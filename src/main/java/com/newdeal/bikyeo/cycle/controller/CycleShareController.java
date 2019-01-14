package com.newdeal.bikyeo.cycle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/cycleshare")
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
  
  @RequestMapping(value="/cycle.do", method=RequestMethod.PUT)
  public @ResponseBody int rent(@RequestBody String c_Code) {
    
    return 1;
  }


}
