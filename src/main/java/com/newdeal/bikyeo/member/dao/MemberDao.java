package com.newdeal.bikyeo.member.dao;

import com.newdeal.bikyeo.member.domain.MemberDto;

public interface MemberDao {

  int searchId(String m_Email);
  
  int memberInsert(MemberDto memberDto);
  
  int memberAuthInsert(String m_Email);
}
