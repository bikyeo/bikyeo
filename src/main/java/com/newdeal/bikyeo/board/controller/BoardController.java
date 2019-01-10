package com.newdeal.bikyeo.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

  /*
   * 메소드명 : board()
   * 작성일 : 19.01.10
   * 작성자 : 김무균
   * 설명 : 게시판페이지
   */
  
  @RequestMapping("/board")
  public String board() {
    
    return "board.board";
  }
  
  
  
  
  
}
