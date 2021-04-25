package com.hcl.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hcl.model.User;

@Repository
public class UserDaoImpl implements UserDao {

	private SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
    @Transactional
    @SuppressWarnings("unchecked")
	public User login(User user) {
		System.out.println("In Check login");
		Session session = sessionFactory.getCurrentSession();
		
		String query="from User u where u.email=:email and u.password=:password";
		User list = (User) session.createQuery(query).setParameter("email", user.getEmail()).setParameter("password", user.getPassword()).uniqueResult();
		
		if (list != null) {
			System.out.println("In email id:"+user.getEmail());
			return (User) list;
		} else {
			System.out.println("wrong");
			return null;
		}
	}

	@Override
    @Transactional
	public boolean register(User user) {
		System.out.println("User Id :" + user.getId());
		
		 int check = (int) sessionFactory.getCurrentSession().save(user);
		 
		 if(check != 0) {
			 return true;
		 }else {
			 return false;
		 }

	}
	
	public User verifyUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		System.out.println(user.getEmail());
		System.out.println(user.getPassword());
		String query="from User u where u.email=:email and u.password=:password";
		User verifiedUser = (User) session.createQuery(query).setParameter("email", user.getEmail()).setParameter("password", user.getPassword()).uniqueResult();
		if(verifiedUser!=null) {
			System.out.println(verifiedUser.getEmail());
			return verifiedUser;
		}else {
		return null;
		
	
	}
	}
}
