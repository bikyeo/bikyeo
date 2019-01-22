package com.newdeal.bikyeo.member.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.mail.MessagingException;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.newdeal.bikyeo.common.util.Mail;
import com.newdeal.bikyeo.common.util.Mailer;
import com.newdeal.bikyeo.member.dao.MemberDao;
import com.newdeal.bikyeo.member.domain.MemberDto;
import freemarker.template.TemplateException;

@Service
public class MemberServiceImpl implements MemberService{

  @Autowired
  SqlSession sqlSession;

  @Autowired
  BCryptPasswordEncoder bcryptPasswordEncoder;

  @Autowired
  Mailer mailer;

  @Override
  public int searchId(String m_Email) {
    
    return sqlSession.getMapper(MemberDao.class).searchId(m_Email);
  }

  @Transactional
  @Override
  public int memberInsert(MemberDto memberDto) throws SQLException, MessagingException, IOException, TemplateException {
    
    int result = 0;
    
    if(!memberDto.getM_Email().equals(memberDto.getM_Pwd())) {
      memberDto.setM_Pwd(bcryptPasswordEncoder.encode(memberDto.getM_Pwd()));
      memberDto.setEnabled(0);
      sqlSession.getMapper(MemberDao.class).memberInsert(memberDto);
      result = sqlSession.getMapper(MemberDao.class).memberAuthInsert(memberDto.getM_Email());

      Mail mail = new Mail();
      mail.setFrom("bikyeo.masters@gmail.com");
      mail.setTo(memberDto.getM_Email());
      mail.setSubject("안녕하세요 Bikyeo입니다!");
      mail.setTemplate("signup.ftl");

      Map<String, String> model = new HashMap<>();

      model.put("name", memberDto.getM_Name());
      model.put("signature", "Bikyeo");
      model.put("m_Email", memberDto.getM_Email());
      mail.setModel(model);

      mailer.sendSimpleMessage(mail);
    } else {
      memberDto.setM_Pwd(bcryptPasswordEncoder.encode(memberDto.getM_Pwd()));
      memberDto.setEnabled(1);
      sqlSession.getMapper(MemberDao.class).memberInsert(memberDto);
      result = sqlSession.getMapper(MemberDao.class).memberAuthInsert(memberDto.getM_Email());

    }
    return result;
  }

  @Override
  public int memberConfirm(String m_Email) {
    
    return sqlSession.getMapper(MemberDao.class).memberConfirm(m_Email);
  }

  @Override
  public String memberInfo(MemberDto memberDto) {
    
    memberDto = sqlSession.getMapper(MemberDao.class).memberInfo(memberDto.getM_Email());
    memberDto.setM_Regdate(memberDto.getM_Regdate().substring(0, 10));
    memberDto.setM_Update(memberDto.getM_Update().substring(0, 10));
    JSONObject jsonObject = new JSONObject(memberDto);
    return jsonObject.toString();
  }

  @Override
  public String pwdConfirm(MemberDto memberDto) {
    
    String result = sqlSession.getMapper(MemberDao.class).pwdConfirm(memberDto);
    JSONObject jsonObject = new JSONObject();
    jsonObject.put("result", (bcryptPasswordEncoder.matches(memberDto.getM_Pwd(), result)) ? true : false);
    return jsonObject.toString();
  }

  @Override
  public String memberUpdate(MemberDto memberDto) {
    
    int result;
    if(memberDto.getM_Pwd() == null) {
      result = sqlSession.getMapper(MemberDao.class).memberUpdate(memberDto);
    } else {
      memberDto.setM_Pwd(bcryptPasswordEncoder.encode(memberDto.getM_Pwd()));
      result = sqlSession.getMapper(MemberDao.class).memberUpdateWithPwd(memberDto);
    }
    JSONObject jsonObject = new JSONObject();
    jsonObject.put("result", (result>=1) ? true : false);
    return jsonObject.toString();
  }
  
  @Transactional
  @Override
  public String memberDelete(MemberDto memberDto) {
    
    int result = 1;
    sqlSession.getMapper(MemberDao.class).memberDeleteAuth(memberDto);
    sqlSession.getMapper(MemberDao.class).memberDeleteShare(memberDto);
    result = sqlSession.getMapper(MemberDao.class).memberDelete(memberDto);
    JSONObject jsonObject = new JSONObject();
    jsonObject.put("result", (result>=1) ? true : false);
    return jsonObject.toString();
  }

  @Override
  public String searchEmail(MemberDto memberDto) {
    
    JSONObject jsonObject = new JSONObject();
    jsonObject.put("m_Email", sqlSession.getMapper(MemberDao.class).searchEmail(memberDto));
    return jsonObject.toString();
  }

  @Override
  public String searchPwd(String m_Email) throws MessagingException, IOException, TemplateException  {
    
    MemberDto memberDto = sqlSession.getMapper(MemberDao.class).memberInfo(m_Email);
    if(memberDto != null) {
      Mail mail = new Mail();
      mail.setFrom("bikyeo.masters@gmail.com");
      mail.setTo(m_Email);
      mail.setSubject("안녕하세요 Bikyeo입니다!");
      mail.setTemplate("passwordfind.ftl");

      Map<String, String> model = new HashMap<>();

      model.put("name", memberDto.getM_Name());
      model.put("signature", "Bikyeo");
      model.put("m_Email", memberDto.getM_Email());
      mail.setModel(model);

      mailer.sendSimpleMessage(mail);
      return "success";
    } else {
      return null;
    }
  }

  @Override
  public String editPwd(MemberDto memberDto) {
    
    memberDto.setM_Pwd(bcryptPasswordEncoder.encode(memberDto.getM_Pwd()));
    JSONObject jsonObject = new JSONObject();
    jsonObject.put("success", sqlSession.getMapper(MemberDao.class).editPwd(memberDto));
    return jsonObject.toString();
  }

  @Override
  public String memberShare(String m_Email) {
    List<Map<String,String>> list = sqlSession.getMapper(MemberDao.class).memberShare(m_Email);
    Iterator<Map<String,String>> iterator= list.iterator();
    JSONArray jsonArray = new JSONArray();
    while (iterator.hasNext()) {
      JSONObject jsonObject = new JSONObject(iterator.next());
      jsonArray.put(jsonObject);
    }
    JSONObject jsonObject = new JSONObject(sqlSession.getMapper(MemberDao.class).memberInfo(m_Email));
    jsonObject.put("jsonArray", jsonArray);
    return jsonObject.toString();
  }

}
