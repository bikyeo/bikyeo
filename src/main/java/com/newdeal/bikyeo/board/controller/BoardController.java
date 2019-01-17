package com.newdeal.bikyeo.board.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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


  @RequestMapping(value="/boardfaq.do",method=RequestMethod.GET)
  public String boardfaq(Model model) {
    
    List<BoardDto> list = boardService.getboardlist();
    model.addAttribute("list", list);
    

    return "board.boardfaq";
  }

  @RequestMapping(value="/boardfaqlook.do", method=RequestMethod.GET)
  public String boardfaqlook(Model model, @RequestParam("b_Num") int b_Num) {
    
    model.addAttribute("bno", boardService.boardread(b_Num));
    
    System.out.println(boardService.boardread(b_Num));
    
    return "board.boardfaqlook";
  }



  
  @RequestMapping("/boardqna.do")
  public String boardqna() {
    return "board.boardqna";
  }
  
  
  @RequestMapping(value="/boardwrite.do", method=RequestMethod.PUT)
  public String boardinsert(Model model) {

    model.addAttribute("write", boardService.getboardlist());
    return "board.boardwrite";
  }
  
  
  
  
  
  
}
