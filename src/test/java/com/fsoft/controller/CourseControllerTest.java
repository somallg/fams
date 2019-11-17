package com.fsoft.controller;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

import com.fsoft.entities.Course;
import com.fsoft.services.CourseService;

public class CourseControllerTest {
  // Test fixture
  @Mock
  private CourseService courseService;

  @Mock
  private Course course;

  @InjectMocks
  private CourseController courseController;

  private MockMvc mockMvc;

  @Before
  public void setUp() throws Exception {
    // Process mock annotation
    MockitoAnnotations.initMocks(this);

    // Setup Spring test in standalone mode
    this.mockMvc = MockMvcBuilders.standaloneSetup(courseController).build();
  }

  @Test
  public void testSave() throws Exception {
  
    this.mockMvc.perform(MockMvcRequestBuilders.post("/saveCourse")
        .param("courseCode", "TTT2018")
        .param("courseTitle", "Java Basic")
        .param("duration", "5")
        .param("descriptions", "Java Basic"))
        .andExpect(MockMvcResultMatchers.status().isOk())
        .andExpect(MockMvcResultMatchers.forwardedUrl("course_add"));
//        .andExpect(MockMvcResultMatchers.model().attribute("message_success", "Add/Update a course success!"));
  }

  @Test
  public void testUpdate() {
    fail("Not yet implemented");
  }

  @Test
  public void testDelete() {
    fail("Not yet implemented");
  }

}
