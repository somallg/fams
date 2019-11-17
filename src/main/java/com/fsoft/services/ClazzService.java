package com.fsoft.services;

import java.io.Serializable;
import java.util.List;

import com.fsoft.entities.Clazz;

public interface ClazzService {
    List<Clazz> findAll();
    
    Serializable save(Clazz clazz);
}
