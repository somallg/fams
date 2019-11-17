package com.fsoft.dao;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fsoft.entities.User;
import com.fsoft.utils.UserNotFoundException;

@Repository("userDao")
@Transactional
// With @Transactional in your @Repository Spring is able to apply transactional
// support into your repository.
public class UserDaoImpl implements UserDao {

  @Autowired
  private SessionFactory sessionFactory;

  public void setSessionFactory(SessionFactory sf) {
    this.sessionFactory = sf;
  }

  @SuppressWarnings({ "deprecation", "rawtypes" })
  @Override
  public User login(User user) throws Exception {
    Session session = null;
    try{
      session = sessionFactory.getCurrentSession();
    if (session != null) {
      Query query = session
          .createQuery("FROM User u WHERE u.userName = :userName AND u.password = :password");
      query.setParameter("userName", user.getUserName());
      query.setParameter("password", user.getPassword());

      if ((query.list() != null) && (query.list().size() > 0))
        return (User) query.list().get(0);
    }
    return null;
    }catch(Exception exception){
      throw new UserNotFoundException(user.getUserName());
    }
  }

  @Override
  public String save(User user) {
    Session session = sessionFactory.getCurrentSession();
    session.save(user);
    return null;
  }

}
