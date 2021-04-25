package com.hcl.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "PET")
public class Pet {

	@Id
	@Column(name = "PET_ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer petId;

	@Column(name = "PET_Type")
	@NotEmpty
	private String petType;

	@Column(name = "PET_AGE")
	@NotNull
	private Integer petAge;

	@Column(name = "PET_Breed")
	@NotEmpty
	private String petBreed;

	@Column(name = "PET_PRICE")
	private float price;
	
	@Column(name = "PET_STATUS")
	private String petStatus;

	@Column(name = "USER_ID")
	private int userId;

	@Column(name = "USER_NAME")
	private String userName;
	
	@Column(name = "CONTACT_DETAILS")
	@NotEmpty
	private String contact;


	public String getPetStatus() {
		return petStatus;
	}

	public void setPetStatus(String petStatus) {
		this.petStatus = petStatus;
	}
	
	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getPetId() {
		return petId;
	}

	public void setPetId(Integer petId) {
		this.petId = petId;
	}

	public String getPetType() {
		return petType;
	}

	public void setPetType(String petType) {
		this.petType = petType;
	}

	public Integer getPetAge() {
		return petAge;
	}

	public void setPetAge(Integer petAge) {
		this.petAge = petAge;
	}

	public String getPetBreed() {
		return petBreed;
	}

	public void setPetBreed(String petBreed) {
		this.petBreed = petBreed;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

}
