package com.fsoft.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fsoft.entities.User;
import com.fsoft.services.UserService;
import com.fsoft.utils.Log4J;

@Controller
@SessionAttributes("user")
public class AccountController {
  @Autowired
  UserService userService;

  /**
   * Add user in model attribute.
   * 
   * @return return a new User object.
   */
  /*  @ModelAttribute("account")
    public User setUpUserForm() {
      Log4J.getLogger().info("setup user form");
      return new User();
    }*/

  /**
   * This method to process login, if username and password are correct, they
   * will be store to a session that use '@SessionAttributes'.
   * 
   * @param modelMap
   * @param request
   * @param userName
   * @param password
   * @return
   * @throws Exception
   */
  @RequestMapping(value = "/loginProcess2", method = RequestMethod.POST)
  public String login(ModelMap modelMap, HttpServletRequest request,
      @ModelAttribute User user) throws Exception {

    Log4J.getLogger().info(user);

    User result = userService.checkAccount(user);

    if (result != null) {
      return "index";
    } else {
      modelMap.addAttribute("message", "Username or Password is wrong!!");
      return "login";
    }
  }
}



