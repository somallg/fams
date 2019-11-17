package com.fsoft.dao;

import java.util.List;

import javax.persistence.StoredProcedureQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fsoft.entities.Course;
import com.fsoft.utils.Constants;
import com.fsoft.utils.Log4J;

@Repository
@Transactional
public class CourseDaoImpl implements CourseDao {

  @Autowired
  private SessionFactory sessionFactory;

  public void setSessionFactory(SessionFactory sf) {
    this.sessionFactory = sf;
  }

  @Override
  public String add(Course course) {
    Session session = sessionFactory.getCurrentSession();

    session.saveOrUpdate(course);
    return Constants.SUCCESS;
  }

  @SuppressWarnings("unchecked")
  @Override
  public List<Course> findAll() {
    Session session = sessionFactory.getCurrentSession();
    Query<Course> query = session.getNamedQuery("Course.findAll");
    List<Course> listOfCourse = query.list();
    return listOfCourse;
  }

  @SuppressWarnings("unchecked")
  @Override
  public List<Course> findByPageandSearch(int pageSize, int pageNumber,
      String courseCode, String courseTitle) throws Exception {

    Session session = sessionFactory.getCurrentSession();
    StoredProcedureQuery procedureQuery = session
        .createNamedStoredProcedureQuery("findByPage");
    procedureQuery.setParameter("courseCode", courseCode);
    procedureQuery.setParameter("courseTitle", courseTitle);
    procedureQuery.setParameter("pageSize", pageSize);
    procedureQuery.setParameter("pageNumber", pageNumber);

    List<Course> listOfCourse = procedureQuery.getResultList();

    // Get output param
    // int amountOfRec = (int)
    // procedureQuery.getOutputParameterValue("amountOfRec");

    Log4J.getLogger().info(listOfCourse);

    return listOfCourse;
  }

  @Override
  public Course findOne(String courseCode) {
    Session session = sessionFactory.getCurrentSession();
    Course course = (Course) session.get(Course.class, courseCode);

    return course;
  }

  @Override
  public void delete(Course course) throws Exception {
    Session session = sessionFactory.getCurrentSession();
    try {
      session.delete(course);
    } catch (Exception ex) {
      throw new Exception();
    }
  }

}
