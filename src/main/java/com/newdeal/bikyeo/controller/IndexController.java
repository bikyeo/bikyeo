package com.newdeal.bikyeo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
  
  /*
   * 메소드명 : index()
   * 작성일 : 19.01.09
   * 작성자 : 송기원
   * 설명 : 인덱스페이
   */
  @RequestMapping("/index.do")
  public String index() {
    //return "index.jsp";
    return "home.home";
  }
}
