package com.newdeal.bikyeo.member.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

  @RequestMapping(value="/myPage.do")
  public String myPage(Model model) {

    return "member.myPage";
  }

  @RequestMapping(value="/info.do", method=RequestMethod.GET)
  public @ResponseBody String info() {

    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    User user = (User) authentication.getPrincipal();
    MemberDto memberDto = new MemberDto();
    memberDto.setM_Email(user.getUsername());
    return memberService.memberInfo(memberDto);
  }

  @RequestMapping(value="/pwdConfirm.do", method=RequestMethod.POST, headers= {"Content-Type=application/json"})
  public @ResponseBody String pwdConfirm(@RequestBody MemberDto memberDto) {

    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    User user = (User) authentication.getPrincipal();
    memberDto.setM_Email(user.getUsername());
    return memberService.pwdConfirm(memberDto);
  }

  @RequestMapping(value="/update.do", method=RequestMethod.PUT, headers= {"Content-Type=application/json"})
  public @ResponseBody String update(@RequestBody MemberDto memberDto) {

    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    User user = (User) authentication.getPrincipal();
    memberDto.setM_Email(user.getUsername());
    return memberService.memberUpdate(memberDto);
  }

  @RequestMapping(value="/share.do", method=RequestMethod.GET, headers= {"Content-Type=application/json"})
  public @ResponseBody String share() {

    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    User user = (User) authentication.getPrincipal();
    return memberService.memberShare(user.getUsername());
  }


  @RequestMapping(value="/delete.do", method=RequestMethod.DELETE, headers= {"Content-Type=application/json"})
  public @ResponseBody String delete() {

    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    User user = (User) authentication.getPrincipal();
    MemberDto memberDto = new MemberDto();
    memberDto.setM_Email(user.getUsername());
    return memberService.memberDelete(memberDto);
  }

  @RequestMapping(value="/searchEmail.do", method=RequestMethod.GET, headers= {"Content-Type=application/json"})
  public @ResponseBody String searchEmail(@RequestParam String m_Name, @RequestParam String m_Phone) {

    MemberDto memberDto = new MemberDto();
    memberDto.setM_Name(m_Name);
    memberDto.setM_Phone(m_Phone);
    return memberService.searchEmail(memberDto);
  }

  @RequestMapping(value="/searchPwd.do", method=RequestMethod.GET, headers= {"Content-Type=application/json"})
  public @ResponseBody String searchPwd(@RequestParam String m_Email) throws MessagingException, IOException, TemplateException {
    return memberService.searchPwd(m_Email);
  }

  @RequestMapping(value="/resetPwd.do")
  public String resetPwd(@RequestParam String m_Email, RedirectAttributes rttr) {

    rttr.addFlashAttribute("msg", "reset");
    rttr.addFlashAttribute("m_Email", m_Email);
    return "redirect:/login.do";
  }

  @RequestMapping(value="/editPwd.do", method=RequestMethod.PUT, headers= {"Content-Type=application/json"})
  public @ResponseBody String editPwd(@RequestBody MemberDto memberDto) {

    return memberService.editPwd(memberDto);
  }

  @RequestMapping(value="/payment.do", method=RequestMethod.GET, headers= {"Content-Type=application/json"})
  public @ResponseBody String payment() {

    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    User user = (User) authentication.getPrincipal();
    return memberService.sharePayment(user.getUsername());
  }

  @RequestMapping(value="/logout.do", method=RequestMethod.POST)
  public String logout(HttpServletRequest request) {
    request.getSession().invalidate();
    return "redirect:/index.do";

  }
}
