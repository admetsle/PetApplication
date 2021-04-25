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
@Table(name="USER")
public class User {
	
	@Id
	@Column(name="USER_ID")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	
	@Column(name="USERNAME")
	@NotEmpty
	@NotNull(message="username should not be blank")
	private String userName;
	
	@Column(name="CONTACTNO")
	@NotNull(message="contact number should not be blank")
	private long contactNo;
	
	@Column(name="EMAILID")
	@NotEmpty
	private String email;
	
	@Column(name="PASSWORD")
	@NotEmpty
	@NotNull(message="password is must")
	private String password;
	
//	@Column(name="CONFIRMPASSWORD")
//	@NotEmpty(message="please re-enter password here")
//	private String confirmpassword;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public long getContactNo() {
		return contactNo;
	}

	public void setContactNo(long contactNo) {
		this.contactNo = contactNo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

/*	public String getConfirmpassword() {
		return confirmpassword;
	}

	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}
*/
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
