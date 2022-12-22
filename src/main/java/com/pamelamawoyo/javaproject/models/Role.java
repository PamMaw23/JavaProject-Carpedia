package com.pamelamawoyo.javaproject.models;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name="roles")
public class Role {
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
	
	@NotEmpty(message="First name is required!")
    @Size(min=3, max=128, message="First name must be between 3 and 128 characters")
    private String firstName;
	
	@NotEmpty(message="Last name is required!")
    @Size(min=3, max=128, message="Last name must be between 3 and 128 characters")
    private String lastName;
	
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "users_roles", 
            joinColumns = @JoinColumn(name = "role_id"), 
            inverseJoinColumns = @JoinColumn(name = "user_id"))
    private List<User> users;
    
    public Role() {
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
    
    

}
