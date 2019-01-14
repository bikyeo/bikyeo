package com.newdeal.bikyeo.cycle.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cycle")
public class CycleShareController {
  
  /*
   * 메소드명 : sharemain()
   * 작성일 : 19.01.09
   * 작성자 : 송기원
   * 설명 : 인덱스페이지
   */
  @RequestMapping("/sharemain.do")
  public String sharemain() {
    //return "index.jsp";
    return "share.sharemain";
  }
  @RequestMapping(value="/cycle.do")
  public String cycle(int p_Num) {
    System.out.println(p_Num);
    //return "index.jsp";
    return "share.sharemain";
  }


}
