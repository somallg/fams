package com.fsoft.services;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsoft.dao.ClazzDao;
import com.fsoft.entities.Clazz;

@Service
public class ClazzServiceImpl implements ClazzService, Serializable {
    /**
   * 
   */
  private static final long serialVersionUID = 1L;
    @Autowired
    private ClazzDao clazzDao;

    @Override
    public List<Clazz> findAll() {
        return clazzDao.findAll();
    }

    @Override
    public Serializable save(Clazz clazz) {
      return clazzDao.save(clazz);
    }

}
