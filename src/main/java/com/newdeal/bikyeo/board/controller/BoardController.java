package com.newdeal.bikyeo.board.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.newdeal.bikyeo.board.domain.BoardDto;
import com.newdeal.bikyeo.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

  /*
   * 메소드명 : board()
   * 작성일 : 19.01.10
   * 작성자 : 김무균
   * 설명 : 게시판페이지
   */

  @Autowired
  BoardService boardService;


  @RequestMapping("/boardfaq.do")
  public String boardfaq() {

    return "board.boardfaq";
  }

  @RequestMapping(value="/boardqna.do",method=RequestMethod.GET)
  public String boardqna(Model model) {

    List<BoardDto> list = boardService.getboardlist();
    model.addAttribute("list", list);
    System.out.println(list);
    return "board.boardqna";
  }
  
  
  
  
  
  
  
}
