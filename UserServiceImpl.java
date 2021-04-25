package com.hcl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hcl.dao.UserDao;
import com.hcl.model.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Autowired(required = true)
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public User login(User user) {
		return userDao.login(user);

	}

	@Transactional
	public boolean register(User user) {
		return userDao.register(user);

	}
}
