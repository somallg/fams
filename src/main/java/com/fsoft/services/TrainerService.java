package com.fsoft.services;

import java.util.List;

import com.fsoft.entities.Trainer;

public interface TrainerService {
  List<Trainer> findTrainer();

  List<Trainer> findClassAdmin();
}
