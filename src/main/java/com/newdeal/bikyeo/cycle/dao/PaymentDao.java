package com.newdeal.bikyeo.cycle.dao;

import com.newdeal.bikyeo.cycle.domain.CycleDto;

public interface PaymentDao {

  void cyclerent(CycleDto cycleDto);

  void returcycle(CycleDto cycleDto);

  void returncycle(CycleDto cycleDto);

}
