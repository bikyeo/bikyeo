package com.newdeal.bikyeo.board.service;

import java.util.List;
import com.newdeal.bikyeo.board.domain.BoardDto;
import com.newdeal.bikyeo.util.Criteria;

public interface BoardService {
  
  List<BoardDto> getboardlist();
  
  void boardWrite(BoardDto boardDto);
  
  BoardDto boardread(int b_Num);
  
  void boardModify(BoardDto boardDto);

  int delete(int b_Num);
  
  List<BoardDto> listCriteria(Criteria cri);
  
  int countArticles(Criteria cri);
  
}
