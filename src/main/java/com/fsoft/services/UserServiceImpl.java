package com.fsoft.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsoft.dao.UserDao;
import com.fsoft.entities.User;
import com.fsoft.repositories.UserRepository;

@Service
public class UserServiceImpl implements UserService {

  @Autowired
  UserRepository userRepository;

  @Autowired
  UserDao userDao;

  public User checkAccount(User user) throws Exception {
    return userDao.login(user);
  }

}
