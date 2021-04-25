package com.hcl.service;

import java.util.List;

import com.hcl.model.Pet;
import com.hcl.model.User;

public interface PetService {

	List<Pet> listAllPets();

	Pet getPetById(Integer petId);

	Pet buyPet(Integer petId, User user);

	public List<Pet> listOwnedPets(Integer userId);

	void updatePet(Pet pet);

	void addNewPet(Pet pet);
}
