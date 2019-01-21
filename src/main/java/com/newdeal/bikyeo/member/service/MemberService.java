package com.newdeal.bikyeo.member.service;

import java.io.IOException;
import java.sql.SQLException;
import javax.mail.MessagingException;
import com.newdeal.bikyeo.member.domain.MemberDto;
import freemarker.template.TemplateException;

public interface MemberService {
  
  int searchId(String m_Email);
  
  int memberInsert(MemberDto memberDto) throws SQLException, MessagingException, IOException, TemplateException;
  
  int memberConfirm(String m_Email);
}
