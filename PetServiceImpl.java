package com.hcl.service;

import java.util.List;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hcl.dao.PetDao;
import com.hcl.model.Pet;
import com.hcl.model.User;

@Service
public class PetServiceImpl implements PetService {

	PetDao petdao;

	 @Autowired(required=true)
	    public void setPetDao(PetDao petdao) {
	        this.petdao=petdao;
	    }

	@Transactional
	public List<Pet> listAllPets() {
		return petdao.listAllPets();
	}

	@Transactional
    public List<Pet> listOwnedPets(Integer userId) {
        return petdao.listOwnedPets(userId);
    }

	@Transactional
	public Pet getPetById(Integer petId) {
		return petdao.getPetById(petId);
	}

	@Transactional
	public Pet buyPet(Integer petId, User user) {
		 return petdao.buyPet(petId, user);		
	}

	@Transactional
    public void addNewPet(Pet pet) {
       petdao.addNewPet(pet);
    }
	
	@Transactional 
    public void updatePet(Pet pet) {
        petdao.updatePet(pet);
    }

}