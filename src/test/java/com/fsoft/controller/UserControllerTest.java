package com.fsoft.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import com.fsoft.entities.User;
import com.fsoft.services.UserService;

@RunWith(MockitoJUnitRunner.class)
public class UserControllerTest {
  // Test fixture
  @Mock
  private UserService userService;
  @Mock
  HttpServletRequest request;
  @Mock
  HttpSession session;

  @Mock
  private User user;

  @InjectMocks
  private UserController userController;

  private MockMvc mockMvc;

  @Before
  public void setUp() throws Exception {
    // Process mock annotation
    MockitoAnnotations.initMocks(this);

    // Setup Spring test in standalone mode
    this.mockMvc = MockMvcBuilders.standaloneSetup(userController).build();
  }

  @Test
  public void testHome() throws Exception {
    this.mockMvc.perform(get("/")).andExpect(status().isOk())
        .andExpect(forwardedUrl("sign-in"));
  }

  @Test
  public void testDoLoginFail() throws Exception {

    this.mockMvc
        .perform(
            post("/loginProcess1").param("userName", "mvcemail@test.com")
                .param("password", "mvcfirst")).andExpect(status().isOk())
        .andExpect(view().name("login"))
        .andExpect(model().attributeExists("message"));

  }

  @Test
  public void testDoLoginPass() throws Exception {

    this.mockMvc
        .perform(
            post("/loginProcess1").param("userName", "admin").param(
                "password", "admin")).andExpect(status().isOk())
        .andExpect(view().name("index"));

  }

  @Test
  public void testDoLogin2Pass() throws Exception {

    this.mockMvc
        .perform(
            post("/loginProcess2").param("userName", "admin").param(
                "password", "admin")).andExpect(status().isOk())
        .andExpect(view().name("index"));

    when(session.getAttribute("user")).thenReturn(new User("admin", "admin"));
  }

}
