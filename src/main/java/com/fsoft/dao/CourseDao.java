package com.fsoft.dao;

import java.util.List;

import com.fsoft.entities.Course;

public interface CourseDao {
  String add(Course course);

  List<Course> findAll();

  Course findOne(String courseCode);
  
  void delete(Course course) throws Exception;
  
 List<Course> findByPageandSearch(int pageSize, int pageNumber,
      String courseCode, String courseTitle) throws Exception;
}
