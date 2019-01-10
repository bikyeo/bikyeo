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
   * 메소드명 : test()
   * 작성일 : 19.01.10
   * 작성자 : 염승민
   * 설명 : 일반 페이지 변경 테스트
   */
  @RequestMapping("/test.do")
  public String test() {
    return "common.common";
  }
}
