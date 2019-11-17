package com.fsoft.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fsoft.entities.User;
import com.fsoft.services.UserService;
import com.fsoft.utils.Log4J;
import com.fsoft.utils.UserNotFoundException;

@Controller
public class UserController {

  @Autowired
  UserService userService;

  @Autowired
  User user;

  /**
   * This method to redirect the user to "sign-in" page.
   * 
   * @param model
   *          a ModelMap object.
   * @return return a "sign-in" string to view.
   */
  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String home(ModelMap model) {
    Log4J.getLogger().info("Redirect the user to sign-in page.");
    
    return "sign-in";
  }

  /**
   * This method to process login, if username and password are correct, they
   * will be store to a session that use 'HTTP session' that get from a request
   * object.
   * 
   * @param modelMap
   * @param request
   * @param userName
   * @param password
   * @return
   * @throws Exception
   */
  @RequestMapping(value = "/loginProcess1", method = RequestMethod.POST)
  public String doLogin(ModelMap modelMap, HttpServletRequest request,
      @RequestParam("userName") String userName,
      @RequestParam("password") String password) throws Exception {
    try {
      user.setUserName(userName);
      user.setPassword(password);
      User result = userService.checkAccount(user);

      if (null != result) {
        request.getSession().setAttribute("user", user);
        // Data to view
        
        return "index";
      } else {
        modelMap.addAttribute("message", "Username or Password is wrong!!");
        return "login";
      }
    } catch (Exception exception) {
      throw new UserNotFoundException(userName);
    }
  }

  /**
   * This method to process login, if username and password are correct, they
   * will be store to a session that use 'HTTP session' that get from a request
   * object.
   * 
   * @param modelMap
   * @param request
   * @param userName
   * @param password
   * @return
   * @throws Exception
   */
//  @RequestMapping(value = "/loginProcess2", method = RequestMethod.POST)
//  public ModelAndView doLogin2(ModelMap modelMap, HttpServletRequest request,
//      @RequestParam("userName") String userName,
//      @RequestParam("password") String password) throws Exception {
//
//    user.setUserName(userName);
//    user.setPassword(password);
//    User result = userService.checkAccount(user);
//
//    ModelAndView modelAndView = new ModelAndView();
//    
//    if (null != result) {
//      request.getSession().setAttribute("user", user);
//      modelAndView.setViewName("index");
//      return modelAndView;
//    } else {
//      modelMap.addAttribute("message", "Username or Password is wrong!!");
//      modelAndView.setViewName("login");
//      return modelAndView;
//    }
//  }

  @RequestMapping(value = "/loginProcess1", method = RequestMethod.GET)
  public String callDoLogin(ModelMap modelMap, HttpServletRequest request,
      @RequestParam(name="userName", required=false)String userName,
      @RequestParam("password") String password) throws Exception {

    return doLogin(modelMap, request, userName, password);
  }

  @RequestMapping(value = "/accessdenied", method = RequestMethod.GET)
  public String loginerror(ModelMap model) {
    model.addAttribute("error", "true");
    return "denied";
  }

  @ExceptionHandler(UserNotFoundException.class)
  public ModelAndView handleUserNotFoundException(
      HttpServletRequest request, Exception ex) {
    
    Log4J.getLogger().error("Requested URL=" + request.getRequestURL());
    Log4J.getLogger().error("Exception Raised=" + ex);

    ModelAndView modelAndView = new ModelAndView();
    modelAndView.addObject("exception", ex);
    modelAndView.addObject("url", request.getRequestURL());

    modelAndView.setViewName("error");
    return modelAndView;
  }


  @RequestMapping(value = "/accessdenied3", method = RequestMethod.GET)
  public String loginerror3(ModelMap model) {
    model.addAttribute("error", "true");
    return "denied";
  }
}
