package com.newdeal.bikyeo.cycle.service;

import java.sql.SQLException;
import java.util.List;
import com.newdeal.bikyeo.cycle.domain.CycleDto;
import com.newdeal.bikyeo.cycle.domain.ShareDto;

public interface CycleShareService {

  int rent(CycleDto cycleDto) throws SQLException;

  List<ShareDto> returncycle(String m_Email);

  int recycle(CycleDto cycleDto);

}
