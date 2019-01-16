package com.newdeal.bikyeo.member.service;

import java.sql.SQLException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.newdeal.bikyeo.member.dao.MemberDao;
import com.newdeal.bikyeo.member.domain.MemberDto;

@Service
public class MemberServiceImpl implements MemberService{
  
  @Autowired
  SqlSession sqlSession;
  
  @Autowired
  BCryptPasswordEncoder bcryptPasswordEncoder;
  
  @Override
  public int searchId(String m_Email) {
    return sqlSession.getMapper(MemberDao.class).searchId(m_Email);
  }

  @Transactional
  @Override
  public int memberInsert(MemberDto memberDto) throws SQLException {
    int result = 0;
    memberDto.setM_Pwd(bcryptPasswordEncoder.encode(memberDto.getM_Pwd()));
    sqlSession.getMapper(MemberDao.class).memberInsert(memberDto);
    result = sqlSession.getMapper(MemberDao.class).memberAuthInsert(memberDto.getM_Email());
    
    return result;
  }
  
}
