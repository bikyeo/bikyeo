package com.newdeal.bikyeo.cycle.service;

import java.sql.SQLException;
import java.util.List;
import com.newdeal.bikyeo.cycle.domain.CycleDto;

public interface CycleShareService {

  int rent(CycleDto cycleDto) throws SQLException;

  List<CycleDto> returncycle(String m_Email);

  int recycle(CycleDto cycleDto);

}
