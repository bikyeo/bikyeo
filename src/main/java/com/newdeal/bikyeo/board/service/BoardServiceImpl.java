package com.newdeal.bikyeo.board.service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.newdeal.bikyeo.board.dao.BoardDao;
import com.newdeal.bikyeo.board.domain.BoardDto;
import com.newdeal.bikyeo.util.Criteria;

@Service
public class BoardServiceImpl implements BoardService {

  @Autowired
  SqlSession sqlSession;
  
  @Override
  public List<BoardDto> getboardlist() {
    
    return sqlSession.getMapper(BoardDao.class).getboardlist();
  }

  @Override
  public BoardDto boardread(int b_Num) {
    BoardDto boardDto = sqlSession.getMapper(BoardDao.class).boardread(b_Num);
    boardDto.setB_Content(boardDto.getB_Content().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""));
    boardDto.setB_Content(boardDto.getB_Content().replaceAll("\\r|\\n", ""));
    return boardDto;
  }

  @Override
  public void boardWrite(BoardDto boardDto) {
    sqlSession.getMapper(BoardDao.class).boardWrite(boardDto);
    
  }

  @Override
  public void boardModify(BoardDto boardDto) {
    sqlSession.getMapper(BoardDao.class).boardModify(boardDto);
    
  }

  @Override
  public int delete(int b_Num) {
    
    return sqlSession.getMapper(BoardDao.class).delete(b_Num);
  }    
   
  }


