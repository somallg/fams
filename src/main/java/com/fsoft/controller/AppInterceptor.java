package com.fsoft.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fsoft.entities.User;
import com.fsoft.utils.Constants;
import com.fsoft.utils.Log4J;

public class AppInterceptor extends HandlerInterceptorAdapter {
  @Override
  public boolean preHandle(HttpServletRequest request,
      HttpServletResponse response, Object handler) throws Exception {

    String url = request.getRequestURI();
    

    Log4J.getLogger().info(url);

    /* if (handler instanceof HandlerMethod) {
       HandlerMethod handlerMethod = (HandlerMethod) handler;
       Method method = handlerMethod.getMethod();

       methodName = method.getName();
       Log4J.getLogger().info("method: "+ methodName);
     }*/

    HttpSession session = request.getSession();
    // get user are logging
    User user = (User) session.getAttribute("user");

    // check user login
    if (user == null) {
      if (url.endsWith(Constants.LOGIN) || url.equals(Constants.HOME)) {
        return true;
      } else {
        response.sendRedirect("/FAMS3/");
        return false;
      }

    } else {
      
      if (url.endsWith("add")) {
        if ("ROLE_USER".equalsIgnoreCase(user.getUsersRole().getAuthority())) {

          response.sendRedirect(request.getContextPath() + "/accessdenied/");
          return false;
        }
      }
      return true;
    }

  }
}
