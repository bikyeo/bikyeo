package com.newdeal.bikyeo.cycle.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.newdeal.bikyeo.cycle.domain.CycleDto;
import com.newdeal.bikyeo.cycle.service.CycleService;

@Controller
@RequestMapping("/cycle")
public class CycleController {
  
  @Autowired
  CycleService cycleService;
  
  @RequestMapping(value="/cycle.do", method=RequestMethod.GET)
  public @ResponseBody List<CycleDto> cycle(int p_Num) {
    return cycleService.cycle(p_Num);
  }
 
  @RequestMapping(value="/placecheck.do", method=RequestMethod.POST)
  public @ResponseBody int placecheck(@RequestBody CycleDto cycleDto) {
    return cycleService.placecheck(cycleDto);
  }
 
  
}
