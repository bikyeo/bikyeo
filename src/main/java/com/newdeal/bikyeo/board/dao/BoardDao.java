package com.newdeal.bikyeo.board.dao;

import java.util.List;
import com.newdeal.bikyeo.board.domain.BoardDto;

public interface BoardDao {
  


  List<BoardDto> getboardlist();

  List<BoardDto> boardwrite();
   
  BoardDto boardread(int b_Num);
}
