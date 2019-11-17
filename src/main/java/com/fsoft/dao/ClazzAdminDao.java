package com.fsoft.dao;

import java.util.List;

import com.fsoft.entities.Trainer;

public interface ClazzAdminDao {
  List<Object> findAll();

  List<Trainer> findClassAdmin();
}
