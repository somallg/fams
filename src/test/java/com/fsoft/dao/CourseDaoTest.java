package com.fsoft.dao;

import static org.junit.Assert.*;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fsoft.entities.Course;
import com.fsoft.utils.Constants;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:spring-servlet-test.xml" })
public class CourseDaoTest {

  @Autowired
  private CourseDao courseDao;

  @Test
  @Rollback(false)
  @Transactional
  public void testAdd() {
    Course course = new Course("MOCKITO2", "MOCKITO", "MOCKITO", 5);
    assertEquals(Constants.SUCCESS, courseDao.add(course)); 
    
  }


}
