package com.newdeal.bikyeo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
  
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
  @RequestMapping("login.do")
  public String login() {
    return "home.login";
  }
}
