package com.newdeal.bikyeo.cycle.domain;

public class ShareDto {
  
  private int s_Num;
  private String m_Email;
  private int p_Num;
  private String c_Code;
  private String s_Sdate;
  private String s_Pdate;
  private String s_Edate;
  private int s_Status;
  
  public int getS_Num() {
    return s_Num;
  }
  public void setS_Num(int s_Num) {
    this.s_Num = s_Num;
  }
  public String getM_Email() {
    return m_Email;
  }
  public void setM_Email(String m_Email) {
    this.m_Email = m_Email;
  }
  public int getP_Num() {
    return p_Num;
  }
  public void setP_Num(int p_Num) {
    this.p_Num = p_Num;
  }
  public String getC_Code() {
    return c_Code;
  }
  public void setC_Code(String c_Code) {
    this.c_Code = c_Code;
  }
  public String getS_Sdate() {
    return s_Sdate;
  }
  public void setS_Sdate(String s_Sdate) {
    this.s_Sdate = s_Sdate;
  }
  public String getS_Pdate() {
    return s_Pdate;
  }
  public void setS_Pdate(String s_Pdate) {
    this.s_Pdate = s_Pdate;
  }
  public String getS_Edate() {
    return s_Edate;
  }
  public void setS_Edate(String s_Edate) {
    this.s_Edate = s_Edate;
  }
  public int getS_Status() {
    return s_Status;
  }
  public void setS_Status(int s_Status) {
    this.s_Status = s_Status;
  }
  
  @Override
  public String toString() {
    return "ShareDto [s_Num=" + s_Num + ", m_Email=" + m_Email + ", p_Num=" + p_Num + ", c_Code="
        + c_Code + ", s_Sdate=" + s_Sdate + ", s_Pdate=" + s_Pdate + ", s_Edate=" + s_Edate
        + ", s_Status=" + s_Status + "]";
  }
 
  
  
}
