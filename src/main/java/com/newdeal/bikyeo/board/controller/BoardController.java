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
import com.newdeal.bikyeo.util.Criteria;
import com.newdeal.bikyeo.util.PageMaker;

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

  @RequestMapping(value="/listPaging",method=RequestMethod.GET)
  public String listPaging(Criteria cri, Model model) {
    
    PageMaker pageMaker = new PageMaker();
    pageMaker.setCri(cri);
    pageMaker.setTotalCount(boardService.countArticles(cri));
        
        
    model.addAttribute("articles", boardService.listCriteria(cri));
    model.addAttribute("pageMaker", pageMaker);
     
    
    
    
    return "board.list_paging";
  }
  
  
  
  
  
  
  
  
  @RequestMapping(value="/boardfaqlook.do", method=RequestMethod.GET)
  public String boardfaqlook(Model model, @RequestParam("b_Num") int b_Num) {
    
    model.addAttribute("bno", boardService.boardread(b_Num));
      
    return "board.boardfaqlook";
  }
  
  @RequestMapping(value="/boardfaqform.do",method=RequestMethod.GET)
  public String boardfaq() {
     

    return "board.boardfaqform";
  }
  
  @RequestMapping(value="/delete.do", method=RequestMethod.POST)
  public String boardDelete(@RequestParam("b_Num") int b_Num, Model model) {
    
    model.addAttribute("delete",boardService.delete(b_Num));
    
    
    System.out.println(boardService.delete(b_Num));
    
    return "redirect:boardfaq.do";
  }


  
  @RequestMapping(value="/boardfaqwrite.do", method=RequestMethod.POST)
  public String boardinsert(Model model,BoardDto boardDto) {

    boardService.boardWrite(boardDto);
    
    return "redirect:boardfaq.do";
  }
  
  @RequestMapping(value="/boardmodify.do", method=RequestMethod.POST)
  public String boardModify(Model model, BoardDto boardDto) {
    
    boardService.boardModify(boardDto);

    
    return "redirect:boardfaq.do";
  }
  
  
  @RequestMapping("/boardqna.do")
  public String boardqna() {
    return "boardqna";
  }
  
  
}
