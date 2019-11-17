package com.fsoft.dao;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fsoft.entities.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath*:spring-servlet-test.xml"})
//@WebAppConfiguration
public class UserDaoTest {

  @Autowired
  private User user;

  @Autowired
  private UserDao userDao;

  @Transactional
  @Rollback(true)
  @Test
  public void testLoginSuccess() throws Exception {
    user.setUserName("admin");
    user.setPassword("admin");
    User userLogin = userDao.login(user);
    assertNotNull(userLogin);
  }

  @Transactional
  @Rollback(true)
  @Test
  public void testLoginFail() throws Exception {
    user.setUserName("sa");
    user.setPassword("12345678");
    User userLogin = userDao.login(user);
    assertNull(userLogin);
  }
}
