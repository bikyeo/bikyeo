package com.newdeal.bikyeo.member.dao;

import java.util.List;
import java.util.Map;
import com.newdeal.bikyeo.member.domain.MemberDto;

public interface MemberDao {

  int searchId(String m_Email);
  
  int memberInsert(MemberDto memberDto);
  
  int memberAuthInsert(String m_Email);
  
  int memberConfirm(String m_Email);
  
  MemberDto memberInfo(String m_Email);

  String pwdConfirm(MemberDto memberDto);
  
  int memberUpdate(MemberDto memberDto);
  
  int memberUpdateWithPwd(MemberDto memberDto);
  
  void memberDeleteAuth(MemberDto memberDto);
  
  void memberDeleteSharePayment(MemberDto memberDto);
  
  void memberDeleteShare(MemberDto memberDto);
  
  int memberDelete(MemberDto memberDto);
  
  String searchEmail(MemberDto memberDto);
  
  int editPwd(MemberDto memberDto);
  
  List<Map<String, String>> memberShare(String m_Email);
  
  List<Map<String, String>> sharePayment(String m_Email);
  
}
