package com.pamelamawoyo.javaproject.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Future;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="repairs")
public class Repair {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotEmpty(message="First name is required!")
    @Size(min=3, max=128, message="First name must be between 3 and 128 characters")
    private String firstName;
    
    @NotEmpty(message="Last name is required!")
    @Size(min=3, max=128, message="Last name must be between 3 and 128 characters")
    private String lastName;
    
    @NotEmpty(message="Make is required!")
    @Size(min=3, max=128, message="Make must be between 3 and 128 characters")
    private String make;
    
    @NotEmpty(message="Model is required!")
    @Size(min=3, max=128, message="Model must be between 3 and 128 characters")
    private String model;
    
    @NotNull(message="Mileage is required!")
    @Min(value=1, message="Provide estimate if exact mileage is unknown")
    private Integer mileage;
    
    @NotEmpty(message="Comments are required!")
    @Size(min=3, max=128, message="Comments must be between 3 and 128 characters")
    private String comments;
    
    @NotNull(message="Year is required!")
    private String year;
    
    @NotNull(message="Service date is required!")
    @Future
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date serviceDate;

	@JsonProperty("assigned_staff")
	private String assigned_staff;
	@JsonProperty("milestone")
	private String mileStone;


	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
    
    @Column(updatable=false)
	@DateTimeFormat(pattern = "yyy-MM-dd")
    private Date createdAt;
	@DateTimeFormat(pattern = "yyy-MM-dd")
    private Date updatedAt;
	
	@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;

	public Repair() {
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public Integer getMileage() {
		return mileage;
	}
	public void setMileage(Integer mileage) {
		this.mileage = mileage;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public Date getServiceDate() {
		return serviceDate;
	}
	public void setServiceDate(Date serviceDate) {
		this.serviceDate = serviceDate;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public String getAssigned_staff() {
		return assigned_staff;
	}

	public void setAssigned_staff(String assignedStaff) {
		this.assigned_staff = assignedStaff;
	}

	public String getMileStone() {
		return mileStone;
	}

	public void setMileStone(String mileStone) {
		this.mileStone = mileStone;
	}
}
