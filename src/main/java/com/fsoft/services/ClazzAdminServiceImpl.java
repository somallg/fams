package com.fsoft.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsoft.dao.ClazzAdminDao;
import com.fsoft.entities.Trainer;

@Service("clazzAdminService")
public class ClazzAdminServiceImpl implements ClazzAdminService {

  @Autowired
  private ClazzAdminDao clazzAdminDao;

  @Override
  public List<Trainer> findAll() {
    return clazzAdminDao.findClassAdmin();
  }

}
