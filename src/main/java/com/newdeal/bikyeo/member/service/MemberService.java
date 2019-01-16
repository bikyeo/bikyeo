package com.newdeal.bikyeo.member.service;

import java.sql.SQLException;
import com.newdeal.bikyeo.member.domain.MemberDto;

public interface MemberService {
  
  int searchId(String m_Email);
  
  int memberInsert(MemberDto memberDto) throws SQLException;
}
