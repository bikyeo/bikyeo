package com.newdeal.bikyeo.cycle.service;

import java.sql.SQLException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.newdeal.bikyeo.cycle.dao.CycleDao;
import com.newdeal.bikyeo.cycle.dao.CycleShareDao;
import com.newdeal.bikyeo.cycle.domain.CycleDto;

@Service
public class CycleShareServiceImpl implements CycleShareService{

  @Autowired
  SqlSession sqlSession;
  
  @Transactional
  @Override
  public int rent(CycleDto cycleDto) throws SQLException {
    int result = 0;  
    sqlSession.getMapper(CycleDao.class).cyclerent(cycleDto);
    result = sqlSession.getMapper(CycleShareDao.class).rent(cycleDto);
    return result;
  }
}
