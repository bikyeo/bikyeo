package com.newdeal.bikyeo.member.domain;

public class MemberDto {

  private String m_Email;
  private String m_Pwd;
  private String m_Name;
  private String m_Gender;
  private String m_Phone;
  private int enabled;
  private String m_Regdate;
  private String m_Update;
  public String getM_Email() {
    return m_Email;
  }
  public void setM_Email(String m_Email) {
    this.m_Email = m_Email;
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
  public String getM_Gender() {
    return m_Gender;
  }
  public void setM_Gender(String m_Gender) {
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
  
  @Override
  public String toString() {
    return "MemberDto [m_Email=" + m_Email + ", m_Pwd=" + m_Pwd + ", m_Name=" + m_Name
        + ", m_Gender=" + m_Gender + ", m_Phone=" + m_Phone + ", enabled=" + enabled
        + ", m_Regdate=" + m_Regdate + ", m_Update=" + m_Update + "]";
  }
  
}
