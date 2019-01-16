package com.newdeal.bikyeo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.newdeal.bikyeo.member.service.MemberService;

@Controller
public class IndexController {
  
  @Autowired 
  MemberService memberService;
  
  /*
   * 메소드명 : index()
   * 작성일 : 19.01.09
   * 작성자 : 송기원
   * 설명 : 인덱스페이지
   */
  @RequestMapping("/index.do")
  public String index() {
    return "home.main";
  }
  
  /*
   * 메소드명 : login()
   * 작성일 : 19.01.10
   * 작성자 : 염승민
   * 설명 : 로그인페이지
   */
  @RequestMapping("/login.do")
  public String login() {
    return "home.login";
  }
  
  /*
   * 메소드명 : signUp()
   * 작성일 : 19.01.11
   * 작성자 : 염승민
   * 설명 : 회원가입 페이지
   */
  @RequestMapping("/signup.do")
  public String signUp() {
    return "home.signUp";
  }

  /*
   * 메소드명 : searchId()
   * 작성일 : 19.01.14
   * 작성자 : 염승민
   * 설명 : 아이디 중복체크
   */
  @RequestMapping(value="/searchId.do", method=RequestMethod.GET, headers={"Content-Type=application/json"})
  public @ResponseBody int searchId(@RequestParam String m_Email) {
    return memberService.searchId(m_Email);
  }
  
  
}
