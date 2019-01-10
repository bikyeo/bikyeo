package com.newdeal.bikyeo.member.doamin;

public class MemberDTO {

  private String m_mail;
  private String m_Pwd;
  private String m_Name;
  private int m_Gender;
  private String m_Phone;
  private int enabled;
  private String m_Regdate;
  private String m_Update;
  public String getM_mail() {
    return m_mail;
  }
  public void setM_mail(String m_mail) {
    this.m_mail = m_mail;
  }
  public String getM_Pwd() {
    return m_Pwd;
  }
  public void setM_Pwd(String m_Pwd) {
    this.m_Pwd = m_Pwd;
  }
  public String getM_Name() {
    return m_Name;
  }
  public void setM_Name(String m_Name) {
    this.m_Name = m_Name;
  }
  public int getM_Gender() {
    return m_Gender;
  }
  public void setM_Gender(int m_Gender) {
    this.m_Gender = m_Gender;
  }
  public String getM_Phone() {
    return m_Phone;
  }
  public void setM_Phone(String m_Phone) {
    this.m_Phone = m_Phone;
  }
  public int getEnabled() {
    return enabled;
  }
  public void setEnabled(int enabled) {
    this.enabled = enabled;
  }
  public String getM_Regdate() {
    return m_Regdate;
  }
  public void setM_Regdate(String m_Regdate) {
    this.m_Regdate = m_Regdate;
  }
  public String getM_Update() {
    return m_Update;
  }
  public void setM_Update(String m_Update) {
    this.m_Update = m_Update;
  }
  
}
