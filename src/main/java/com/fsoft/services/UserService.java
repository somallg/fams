package com.fsoft.services;

import com.fsoft.entities.User;

public interface UserService {
    User checkAccount(User user) throws Exception;
}
