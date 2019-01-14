package com.newdeal.bikyeo.member.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.newdeal.bikyeo.member.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService{
  
  @Autowired
  SqlSession sqlSession;

  @Override
  public int searchId(String email) {
    return sqlSession.getMapper(MemberDao.class).searchId(email);
  }
  
}
