package com.fsoft.services;

import java.util.List;

import com.fsoft.entities.LearningPath;

public interface LearningService {
    List<LearningPath> findAll();
}
