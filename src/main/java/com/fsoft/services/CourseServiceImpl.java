package com.fsoft.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsoft.dao.CourseDao;
import com.fsoft.entities.Course;

@Service("courseService")
public class CourseServiceImpl implements CourseService {

  @Autowired
  private CourseDao courseDao;

  @Override
  public String add(Course course) {
    return courseDao.add(course);
  }

  @Override
  public List<Course> findAll() {
    return courseDao.findAll();
  }

  @Override
  public Course findOne(String courseCode) {
    return courseDao.findOne(courseCode);
  }

  @Override
  public void delete(Course course) throws Exception {
    courseDao.delete(course);

  }

  @Override
  public List<Course> findByPageandSearch(int pageSize, int pageNumber,
      String courseCode, String courseTitle) throws Exception {
    return courseDao.findByPageandSearch(pageSize, pageNumber, courseCode, courseTitle);
  }

}
