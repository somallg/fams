package com.fsoft.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fsoft.entities.Trainer;
import com.fsoft.utils.Constants;

@Repository("trainerDao")
@Transactional
public class TrainerDaoImpl implements TrainerDao {
  @Autowired
  private SessionFactory sessionFactory;

  public void setSessionFactory(SessionFactory sf) {
    this.sessionFactory = sf;
  }

  @SuppressWarnings("unchecked")
  @Override
  public List<Trainer> findTrainer() {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.getNamedQuery("findTrainers");
    query.setParameter("roles", Constants.TRAINER);
    return query.list();
  }

  @SuppressWarnings("unchecked")
  @Override
  public List<Trainer> findClassAdmin() {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.getNamedQuery("findTrainers");
    query.setParameter("roles", Constants.ADMIN);
    return query.list();
  }

}
