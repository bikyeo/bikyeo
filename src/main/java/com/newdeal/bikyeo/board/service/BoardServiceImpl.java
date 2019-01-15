package com.newdeal.bikyeo.board.service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.newdeal.bikyeo.board.dao.BoardDao;
import com.newdeal.bikyeo.board.domain.BoardDto;

@Service
public class BoardServiceImpl implements BoardService {

  @Autowired
  SqlSession sqlSession;
  
  @Override
  public List<BoardDto> getboardlist() {
    
    return sqlSession.getMapper(BoardDao.class).getboardlist();
  }

}
