package com.hcl.dao;

import java.util.List;

import com.hcl.model.Pet;
import com.hcl.model.User;

public interface PetDao {

	List<Pet> listAllPets();

	Pet getPetById(Integer petId);

	Pet buyPet(Integer petId, User user);

	public List<Pet> listOwnedPets(Integer userId);

	public void addNewPet(Pet pet);

	public void updatePet(Pet pet);
}