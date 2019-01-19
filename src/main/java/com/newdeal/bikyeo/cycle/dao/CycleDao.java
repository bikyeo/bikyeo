package com.newdeal.bikyeo.cycle.dao;

import java.util.List;
import com.newdeal.bikyeo.cycle.domain.CycleDto;

public interface CycleDao {
  List<CycleDto> cycle(int p_Num);

  void cyclerent(CycleDto cycleDto);

  void retucycle(CycleDto cycleDto);

  int placecheck(CycleDto cycleDto);

 
}
