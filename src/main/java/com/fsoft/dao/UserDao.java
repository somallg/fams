package com.fsoft.dao;

import com.fsoft.entities.User;


public interface UserDao {
	User login(User user) throws Exception;
	
	String save(User user);
}
