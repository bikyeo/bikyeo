package com.newdeal.bikyeo.common.util;

import java.util.Map;

public class Mail {

  private String from;
  private String to;
  private String subject;
  private String content;
  private String template;
  
  public String getTemplate() {
    return template;
  }

  public void setTemplate(String template) {
    this.template = template;
  }

  private Map<String,String> model;

  public String getFrom() {
      return from;
  }

  public void setFrom(String from) {
      this.from = from;
  }

  public String getTo() {
      return to;
  }

  public void setTo(String to) {
      this.to = to;
  }

  public String getSubject() {
      return subject;
  }

  public void setSubject(String subject) {
      this.subject = subject;
  }

  public String getContent() {
      return content;
  }

  public void setContent(String content) {
      this.content = content;
  }

  public Map<String, String> getModel() {
    return model;
  }

  public void setModel(Map<String, String> model) {
    this.model = model;
  }

  @Override
  public String toString() {
      return "Mail{" +
              "from='" + from + '\'' +
              ", to='" + to + '\'' +
              ", subject='" + subject + '\'' +
              ", content='" + content + '\'' +
              '}';
  }
}
