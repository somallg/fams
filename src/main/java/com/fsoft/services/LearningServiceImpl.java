package com.fsoft.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsoft.dao.LearningDao;
import com.fsoft.entities.LearningPath;

@Service("learningService")
public class LearningServiceImpl implements LearningService{

    @Autowired
    private LearningDao learningDao;
    
    @Override
    public List<LearningPath> findAll() {
        return learningDao.findAll();
    }

}
