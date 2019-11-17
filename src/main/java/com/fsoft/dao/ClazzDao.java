package com.fsoft.dao;

import java.io.Serializable;
import java.util.List;

import com.fsoft.entities.Clazz;

public interface ClazzDao {
    List<Clazz> findAll();
    Serializable save(Clazz clazz);
}
