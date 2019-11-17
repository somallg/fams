package com.fsoft.dao;

import java.util.List;

import com.fsoft.entities.LearningPath;

public interface LearningDao {
    List<LearningPath> findAll();
}
