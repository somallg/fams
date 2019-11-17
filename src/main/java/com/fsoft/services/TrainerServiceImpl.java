package com.fsoft.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsoft.dao.TrainerDao;
import com.fsoft.entities.Trainer;

@Service("trainerService")
public class TrainerServiceImpl implements TrainerService {

  @Autowired
  private TrainerDao trainerDao;
  
  @Override
  public List<Trainer> findTrainer() {
    return trainerDao.findTrainer();
  }

  @Override
  public List<Trainer> findClassAdmin() {
    return trainerDao.findClassAdmin();
  }

}
