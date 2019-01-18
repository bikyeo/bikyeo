package com.newdeal.bikyeo.cycle.service;

import java.sql.SQLException;
import com.newdeal.bikyeo.cycle.domain.CycleDto;

public interface CycleShareService {

  int rent(CycleDto cycleDto) throws SQLException;

  int returncycle(String name);

}
