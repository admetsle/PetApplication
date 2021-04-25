package com.hcl.service;

import com.hcl.model.User;


public interface UserService {
	
	 public User login(User user);
	 public boolean register(User user);
}
