package com.newdeal.bikyeo.cycle.domain;

public class PaymentDto {
  private int sp_Num;
  private int s_Num;
  private int sp_Pay;
  private int sp_Status;
  private String sp_Date;
  
  public int getSp_Num() {
    return sp_Num;
  }
  public void setSp_Num(int sp_Num) {
    this.sp_Num = sp_Num;
  }
  public int getS_Num() {
    return s_Num;
  }
  public void setS_Num(int s_Num) {
    this.s_Num = s_Num;
  }
  public int getSp_Pay() {
    return sp_Pay;
  }
  public void setSp_Pay(int sp_Pay) {
    this.sp_Pay = sp_Pay;
  }
  public int getSp_Status() {
    return sp_Status;
  }
  public void setSp_Status(int sp_Status) {
    this.sp_Status = sp_Status;
  }
  public String getSp_Date() {
    return sp_Date;
  }
  public void setSp_Date(String sp_Date) {
    this.sp_Date = sp_Date;
  }
  @Override
  public String toString() {
    return "PaymentDto [sp_Num=" + sp_Num + ", s_Num=" + s_Num + ", sp_Pay=" + sp_Pay
        + ", sp_Status=" + sp_Status + ", sp_Date=" + sp_Date + "]";
  }
  
  
  

}
