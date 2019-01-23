package com.newdeal.bikyeo.board.domain;

public class BoardDto {
  
  private int b_Num;
  private int bt_num;
  private String m_Email;
  private String b_Subject;
  private String b_Content;
  private String b_Img;
  private String b_Regdate;
  private int b_hit;
  
  public int getB_Num() {
    return b_Num;
  }
  public void setB_Num(int b_Num) {
    this.b_Num = b_Num;
  }
  public int getBt_num() {
    return bt_num;
  }
  public void setBt_num(int bt_num) {
    this.bt_num = bt_num;
  }
  public String getM_Email() {
    return m_Email;
  }
  public void setM_Email(String m_Email) {
    this.m_Email = m_Email;
  }
  public String getB_Subject() {
    return b_Subject;
  }
  public void setB_Subject(String b_Subject) {
    this.b_Subject = b_Subject;
  }
  public String getB_Content() {
    return b_Content;
  }
  public void setB_Content(String b_Content) {
    this.b_Content = b_Content;
  }
  public String getB_Img() {
    return b_Img;
  }
  public void setB_Img(String b_Img) {
    this.b_Img = b_Img;
  }
  public String getB_Regdate() {
    return b_Regdate;
  }
  public void setB_Regdate(String b_Regdate) {
    this.b_Regdate = b_Regdate;
  }
  public int getB_hit() {
    return b_hit;
  }
  public void setB_hit(int b_hit) {
    this.b_hit = b_hit;
  }
  @Override
  public String toString() {
    return "BoardDto [b_Num=" + b_Num + ", bt_num=" + bt_num + ", m_Email=" + m_Email
        + ", b_Subject=" + b_Subject + ", b_Content=" + b_Content + ", b_Img=" + b_Img
        + ", b_Regdate=" + b_Regdate + ", b_hit=" + b_hit + "]";
  }
  
  
  
  
}
