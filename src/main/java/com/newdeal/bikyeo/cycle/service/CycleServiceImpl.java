package com.newdeal.bikyeo.cycle.service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.newdeal.bikyeo.cycle.dao.CycleDao;
import com.newdeal.bikyeo.cycle.domain.CycleDto;

@Service
public class CycleServiceImpl implements CycleService{

  @Autowired
  SqlSession sqlSession;

  @Override
  public List<CycleDto> cycle(int p_Num) {
    return sqlSession.getMapper(CycleDao.class).cycle(p_Num);
  }
  
  
}
