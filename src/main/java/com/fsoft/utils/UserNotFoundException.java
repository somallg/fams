package com.fsoft.utils;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_FOUND, reason = "User not found!")
public class UserNotFoundException extends Exception {

  /**
   * 
   */
  private static final long serialVersionUID = 6444158494996813615L;

  public UserNotFoundException(int id) {
    super("UserNotFoundException with id=" + id);
  }

  public UserNotFoundException(String userName) {
    super("UserNotFoundException with username=" + userName);
  }
}
