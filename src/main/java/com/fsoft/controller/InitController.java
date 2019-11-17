package com.fsoft.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fsoft.entities.User;

@Controller
public class InitController {

  @PostMapping(name = "/loginProcess3")
  public String login(HttpServletRequest request, @ModelAttribute User user, @RequestParam("userName") String userName) {
    
    
    
    return "index";
  }

}
