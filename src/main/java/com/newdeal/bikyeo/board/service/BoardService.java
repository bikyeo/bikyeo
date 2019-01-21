package com.newdeal.bikyeo.board.service;

import java.util.List;
import com.newdeal.bikyeo.board.domain.BoardDto;

public interface BoardService {
  
  List<BoardDto> getboardlist();
  
  void boardWrite(BoardDto boardDto);
  
  BoardDto boardread(int b_Num);
  
  void boardModify(BoardDto boardDto);

  int delete(int b_Num);
  
}
