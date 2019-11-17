package com.fsoft.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.Repository;

import com.fsoft.entities.User;

@org.springframework.stereotype.Repository("userRepository")
public interface UserRepository extends Repository<User, String> {
  
  List<User> findByUserNameAndPassword(String userName, String password);
}
