package com.newdeal.bikyeo.common.util;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {
  
  private String loginidname;
  private String loginpasswdname;
  private String loginredirectname;
  
  private String exceptionmsgname;
  private String defaultFailureUrl;
  
  public CustomAuthenticationFailureHandler() {
    this.loginidname = "j_username";
    this.loginpasswdname = "j_password";
    this.loginredirectname = "loginRedirect";
    this.exceptionmsgname = "securityexceptionmsg";
    this.defaultFailureUrl = "/login.do";
  }
  
  

  public String getLoginidname() {
    return loginidname;
  }



  public void setLoginidname(String loginidname) {
    this.loginidname = loginidname;
  }



  public String getLoginpasswdname() {
    return loginpasswdname;
  }



  public void setLoginpasswdname(String loginpasswdname) {
    this.loginpasswdname = loginpasswdname;
  }



  public String getLoginredirectname() {
    return loginredirectname;
  }



  public void setLoginredirectname(String loginredirectname) {
    this.loginredirectname = loginredirectname;
  }



  public String getExceptionmsgname() {
    return exceptionmsgname;
  }



  public void setExceptionmsgname(String exceptionmsgname) {
    this.exceptionmsgname = exceptionmsgname;
  }



  public String getDefaultFailureUrl() {
    return defaultFailureUrl;
  }



  public void setDefaultFailureUrl(String defaultFailureUrl) {
    this.defaultFailureUrl = defaultFailureUrl;
  }



  @Override
  public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
      AuthenticationException exception) throws IOException, ServletException {
    
    String loginid = request.getParameter(loginidname);
    String loginpasswd = request.getParameter(loginpasswdname);
    String loginRedirect = request.getParameter(loginredirectname);
    
    request.setAttribute(loginidname, loginid);
    request.setAttribute(loginpasswdname, loginpasswd);
    request.setAttribute(loginredirectname, loginRedirect);
    request.setAttribute(exceptionmsgname, exception.getMessage());
    
    request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
    
  }
}