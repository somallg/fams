package com.fsoft.dao;

import java.io.Serializable;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fsoft.entities.Clazz;
import com.fsoft.utils.Constants;


@Repository
@Transactional
public class ClazzDaoImpl implements ClazzDao {
  @Autowired
  private SessionFactory sessionFactory;

  public void setSessionFactory(SessionFactory sf) {
    this.sessionFactory = sf;
  }

  @SuppressWarnings("unchecked")
  @Override
  public List<Clazz> findAll() {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.getNamedQuery("Clazz.findAll");
    if (query != null) {
      return query.list();
    } else {
      return (List<Clazz>) Constants.OTHER_RESULT;
    }
  }

  @Override
  public Serializable save(Clazz clazz) {
    Session session = sessionFactory.getCurrentSession();
    Serializable result = session.save(clazz);
    return result;
  }
  
  
}
