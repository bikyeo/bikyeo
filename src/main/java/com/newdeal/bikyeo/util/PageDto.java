package com.newdeal.bikyeo.util;

public class PageDto {
  
  private int pageNum;
  private int amount;
  
  
  public PageDto() {
    this(1,10);
    
  }
  
  public PageDto(int pageNum, int amount) {
    this.pageNum = pageNum;
    this.amount = amount;
    
  }
  
  public int getPageNum() {
    return pageNum;
  }
  public void setPageNum(int pageNum) {
    this.pageNum = pageNum;
  }
  public int getAmount() {
    return amount;
  }
  public void setAmount(int amount) {
    this.amount = amount;
  }
  @Override
  public String toString() {
    return "PageDto [pageNum=" + pageNum + ", amount=" + amount + "]";
  }
  
  

}
