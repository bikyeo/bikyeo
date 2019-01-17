package com.newdeal.bikyeo.member.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.mail.MessagingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.newdeal.bikyeo.member.domain.MemberDto;
import com.newdeal.bikyeo.member.service.MemberService;
import freemarker.template.TemplateException;

@Controller
@RequestMapping("/member")
public class MemberController {

  @Autowired
  MemberService memberService;
  /*
   * 메소드명 : insert()
   * 작성일 : 19.01.15
   * 작성자 : 염승민
   * 설명 : 아이디 중복체크
   */
 
  @RequestMapping(value="/insert.do", method=RequestMethod.POST, headers= {"Content-Type=application/json"})
  public @ResponseBody int insert(@RequestBody MemberDto memberDto) throws SQLException, MessagingException, IOException, TemplateException {
    return memberService.memberInsert(memberDto);
  }
  
  @RequestMapping(value="/confirm.do")
  public String confirm(String m_Email, RedirectAttributes rttr) {
    
    rttr.addFlashAttribute("msg", "success");
    memberService.memberConfirm(m_Email);
    return "redirect:/index.do";
  }
}
