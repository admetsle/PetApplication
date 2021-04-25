package com.hcl.dao;

import com.hcl.model.User;

public interface UserDao {
	
    public boolean register(User user);
    public User login(User user);

}
