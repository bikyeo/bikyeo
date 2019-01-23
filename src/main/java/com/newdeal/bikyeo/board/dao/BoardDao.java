package com.newdeal.bikyeo.board.dao;

import java.util.List;
import com.newdeal.bikyeo.board.domain.BoardDto;
import com.newdeal.bikyeo.util.Criteria;

public interface BoardDao {
  
  void boardModify(BoardDto boardDto);

  List<BoardDto> getboardlist();

  void boardWrite(BoardDto boardDto);
   
  BoardDto boardread(int b_Num);
  
  int delete(int b_Num);
  
  List<BoardDto> listCriteria(Criteria cri);
  
  int countArticles(Criteria cri);
  
}
