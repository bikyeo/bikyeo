package com.newdeal.bikyeo.cycle.dao;

import java.util.List;
import com.newdeal.bikyeo.cycle.domain.CycleDto;

public interface CycleShareDao {

  int rent(CycleDto cycleDto);

  List<CycleDto> returncycle(String m_Email);

  int recycle(CycleDto cycleDto);

 
}
