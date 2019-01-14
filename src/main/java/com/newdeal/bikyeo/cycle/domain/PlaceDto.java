package com.newdeal.bikyeo.cycle.domain;

public class PlaceDto {

  private int p_Num;
  private int p_Holder;
  public int getP_Num() {
    return p_Num;
  }
  public void setP_Num(int p_Num) {
    this.p_Num = p_Num;
  }
  public int getP_Holder() {
    return p_Holder;
  }
  public void setP_Holder(int p_Holder) {
    this.p_Holder = p_Holder;
  }
  @Override
  public String toString() {
    return "PlaceDto [p_Num=" + p_Num + ", p_Holder=" + p_Holder + "]";
  }
  
  
  
}
