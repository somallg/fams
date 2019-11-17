package com.fsoft.dao;

import java.util.List;

import com.fsoft.entities.Trainer;

/**
 * Trainer Dao.
 * 
 * @author DieuNT1
 *
 */
public interface TrainerDao {
  List<Trainer> findTrainer();

  List<Trainer> findClassAdmin();
}
