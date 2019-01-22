package com.newdeal.bikyeo.cycle.service;

import java.sql.SQLException;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.newdeal.bikyeo.cycle.dao.CycleDao;
import com.newdeal.bikyeo.cycle.dao.CycleShareDao;
import com.newdeal.bikyeo.cycle.dao.PaymentDao;
import com.newdeal.bikyeo.cycle.domain.CycleDto;

@Service
public class CycleShareServiceImpl implements CycleShareService{

  @Autowired
  SqlSession sqlSession;
  
  @Transactional
  @Override
  public int rent(CycleDto cycleDto) throws SQLException {
    int result = 0;  
//    System.out.println(cycleDto.getPaymentDto().getSp_Pay());
    sqlSession.getMapper(CycleDao.class).cyclerent(cycleDto);
    result = sqlSession.getMapper(CycleShareDao.class).rent(cycleDto);
//    System.out.println(result);
    sqlSession.getMapper(PaymentDao.class).cyclerent(cycleDto);
     
    return result;
  }

  @Override
  public List<CycleDto> returncycle(String m_Email) {
    
    return sqlSession.getMapper(CycleShareDao.class).returncycle(m_Email);
  }

  @Transactional
  @Override
  public int recycle(CycleDto cycleDto) {
    int result = 0;  
    sqlSession.getMapper(CycleDao.class).retucycle(cycleDto);
    result = sqlSession.getMapper(CycleShareDao.class).recycle(cycleDto);
    return result;
  }
}
