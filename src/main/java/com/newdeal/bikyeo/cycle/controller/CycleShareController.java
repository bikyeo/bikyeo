package com.newdeal.bikyeo.cycle.controller;

import java.security.Principal;
import java.sql.SQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.newdeal.bikyeo.cycle.domain.CycleDto;
import com.newdeal.bikyeo.cycle.domain.ShareDto;
import com.newdeal.bikyeo.cycle.service.CycleShareService;

@Controller
@RequestMapping("/cycleshare")
public class CycleShareController {
  
  @Autowired
  CycleShareService cycleShareService;
  /*
   * 메소드명 : sharemain()
   * 작성일 : 19.01.09
   * 작성자 : 송기원
   * 설명 : 인덱스페이지
   */
  @RequestMapping("/sharemain.do")
  public String sharemain() {
    //return "index.jsp";
    return "share.sharemain";
  }
  
  @RequestMapping(value="/cycle.do", method=RequestMethod.POST, headers= {"Content-Type=application/json"})
  public @ResponseBody int rent(Principal principal,@RequestBody CycleDto cycleDto) throws SQLException {
    ShareDto shareDto = new ShareDto();
    shareDto.setM_Email(principal.getName());
    cycleDto.setShareDto(shareDto);
    return cycleShareService.rent(cycleDto);
  }

  @RequestMapping(value="/return.do", method=RequestMethod.GET, headers= {"Content-Type=application/json"})
  public @ResponseBody int returncycle(Principal principal) throws SQLException {
    return cycleShareService.returncycle(principal.getName());
  }

}
