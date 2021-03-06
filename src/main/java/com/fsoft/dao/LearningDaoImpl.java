package com.fsoft.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fsoft.entities.LearningPath;
import com.fsoft.utils.Constants;

@Repository("learningDao")
@Transactional
public class LearningDaoImpl implements LearningDao {

  @Autowired
  private SessionFactory sessionFactory;

  public void setSessionFactory(SessionFactory sf) {
    this.sessionFactory = sf;
  }

  @SuppressWarnings("unchecked")
  @Override
  public List<LearningPath> findAll() {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.getNamedQuery("LearningPath.findAll");

    if (query != null)
      return query.list();
    else
      return (List<LearningPath>) Constants.OTHER_RESULT;
  }

}
