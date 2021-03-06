package com.newdeal.bikyeo.cycle.domain;

public class CycleDto {
  private ShareDto shareDto; 
  private PaymentDto paymentDto;
  private String c_Code;
  private int p_Num;
  private int c_Status;
  private int c_Move;
  private int c_Prev;
  private int rent_hour;
  private int cyclecount;
  private String s_Pdate;
  
  public ShareDto getShareDto() {
    return shareDto;
  }
  public void setShareDto(ShareDto shareDto) {
    this.shareDto = shareDto;
  }
  public PaymentDto getPaymentDto() {
    return paymentDto;
  }
  public void setPaymentDto(PaymentDto paymentDto) {
    this.paymentDto = paymentDto;
  }
  public String getC_Code() {
    return c_Code;
  }
  public void setC_Code(String c_Code) {
    this.c_Code = c_Code;
  }
  public int getP_Num() {
    return p_Num;
  }
  public void setP_Num(int p_Num) {
    this.p_Num = p_Num;
  }
  public int getC_Status() {
    return c_Status;
  }
  public void setC_Status(int c_Status) {
    this.c_Status = c_Status;
  }
  public int getC_Move() {
    return c_Move;
  }
  public void setC_Move(int c_Move) {
    this.c_Move = c_Move;
  }
  public int getC_Prev() {
    return c_Prev;
  }
  public void setC_Prev(int c_Prev) {
    this.c_Prev = c_Prev;
  }
  public int getRent_hour() {
    return rent_hour;
  }
  public void setRent_hour(int rent_hour) {
    this.rent_hour = rent_hour;
  }
  public int getCyclecount() {
    return cyclecount;
  }
  public void setCyclecount(int cyclecount) {
    this.cyclecount = cyclecount;
  }
  public String getS_Pdate() {
    return s_Pdate;
  }
  public void setS_Pdate(String s_Pdate) {
    this.s_Pdate = s_Pdate;
  }
  @Override
  public String toString() {
    return "CycleDto [shareDto=" + shareDto + ", paymentDto=" + paymentDto + ", c_Code=" + c_Code
        + ", p_Num=" + p_Num + ", c_Status=" + c_Status + ", c_Move=" + c_Move + ", c_Prev="
        + c_Prev + ", rent_hour=" + rent_hour + ", cyclecount=" + cyclecount + ", s_Pdate="
        + s_Pdate + "]";
  }
 
  
  
  
  
}
