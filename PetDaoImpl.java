package com.hcl.dao;

import java.util.List;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hcl.model.Pet;
import com.hcl.model.User;

@Repository
public class PetDaoImpl implements PetDao {
	
    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory=sessionFactory;
    }
    
	@SuppressWarnings("unchecked")
	@Override
	public List<Pet> listAllPets() {
		return sessionFactory.getCurrentSession().createQuery("from Pet p").list();

	}

	@SuppressWarnings("unchecked")
	@Override
    public List<Pet> listOwnedPets(Integer userId) {
       
        return sessionFactory.getCurrentSession().createQuery("from Pet p where p.userId =:puser_id ")
                .setParameter("puser_id", userId).list();
    }
	
	@SuppressWarnings("unchecked")
	@Override
	public Pet getPetById(Integer petId) {		
		Session session= sessionFactory.getCurrentSession();
		List<Pet> list = session.createQuery("from Pet p where p.petId =:PET_ID ")
				.setParameter("PET_ID",petId).list();
		
		if(list.size()!=0) {
            Pet pet=(Pet)list.get(0);
            return pet;
            
        }else {
            return null;
        }		
	}
	
	@Override
	public Pet buyPet(Integer petId, User user) {	
	  Query query = sessionFactory
	 .getCurrentSession()
	.createQuery("Update Pet p set p.petStatus=:pstatus, p.userId=:userId, p.userName=:userName where p.petId=:pid");
	  query.setParameter("pstatus", "Sold");
	  query.setParameter("pid", petId);
	  query.setParameter("userId", user.getId());
	  query.setParameter("userName", user.getUserName());

	  
	  int status = query.executeUpdate();
	  System.out.println(status +" row is updated to Sold");
	return null; 	
	}
		
	 @Override
	 public void addNewPet(Pet pet) {
	        System.out.println("Pet Id: " + pet.getPetId());
	        sessionFactory.getCurrentSession().saveOrUpdate(pet);
	 }
	 
	 @Override
	 public void updatePet(Pet pet) {
	        sessionFactory.getCurrentSession().update(pet);
	    }
	
}