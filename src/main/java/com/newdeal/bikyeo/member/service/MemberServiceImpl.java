package com.newdeal.bikyeo.member.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import javax.mail.MessagingException;
import org.apache.ibatis.session.SqlSession;
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
    memberDto.setM_Pwd(bcryptPasswordEncoder.encode(memberDto.getM_Pwd()));
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
    
    return result;
  }

  @Override
  public int memberConfirm(String m_Email) {
    return sqlSession.getMapper(MemberDao.class).memberConfirm(m_Email);
  }
  
}
