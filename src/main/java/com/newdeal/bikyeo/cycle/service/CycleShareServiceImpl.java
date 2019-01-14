package com.newdeal.bikyeo.cycle.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CycleShareServiceImpl {

  @Autowired
  SqlSession sqlSession;

}
