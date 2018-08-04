package com.miksonx.myassistant.commands;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

public class UserCommand {
	
	@NotBlank(message="Please provide your email adress")
	@Email
	@Size(min=4, max=250, message="Email should contain min 4 characters and maximum 250 characters")
	private String email;
	
	@NotBlank(message="{blankName}")
	@Size(min=1, max=100, message="{sizeNameError}")
	private String name;
	
	@NotBlank
	@Size(min=6, max=32)
	private String password;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
