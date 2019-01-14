package com.newdeal.bikyeo.cycle.domain;

public class CycleDTO {

  private int c_Num;
  private int p_Num;
  private int c_Status;
  private int c_move;
  public int getC_Num() {
    return c_Num;
  }
  public void setC_Num(int c_Num) {
    this.c_Num = c_Num;
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
  public int getC_move() {
    return c_move;
  }
  public void setC_move(int c_move) {
    this.c_move = c_move;
  }
  @Override
  public String toString() {
    return "CycleDTO [c_Num=" + c_Num + ", p_Num=" + p_Num + ", c_Status=" + c_Status + ", c_move="
        + c_move + "]";
  }
  
  
  
}
