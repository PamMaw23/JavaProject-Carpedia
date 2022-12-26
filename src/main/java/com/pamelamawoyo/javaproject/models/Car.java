package com.pamelamawoyo.javaproject.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="cars")
public class Car {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
    @NotEmpty(message="Car make is required!")
    @Size(min=3, max=128, message="First name must be between 3 and 128 characters")
    private String carMake;
    
    @NotEmpty(message="Car model is required!")
    @Size(min=3, max=128, message="Car model must be between 3 and 128 characters")
    private String carModel;
    
    @NotEmpty(message="Car type is required!")
    @Size(min=3, max=128, message="Car type must be between 3 and 128 characters")
    private String carType;
    
    @NotEmpty(message="Engine is required!")
    @Size(min=8, max=128, message="Please enter an engine!")
    private String carEngine;
    
    @NotEmpty(message="Transmission is required!")
    @Size(min=8, max=128, message="Transmission must be between 2 and 128 characters")
    private String transmission;
    
    @NotEmpty(message="Drivetrain is required!")
    @Size(min=2, max=128, message="Drivetrain must be between 2 and 128 characters")
    private String driveTrain;
    
    @NotEmpty(message="Interior color is required!")
    @Size(min=2, max=128, message="Interior color must be between 2 and 128 characters")
    private String interiorColor;
    
    @NotEmpty(message="Exterior color is required!")
    @Size(min=2, max=128, message="Exterior color must be between 2 and 128 characters")
    private String exteriorColor;
    
    @NotEmpty(message="Fuel type is required!")
    @Size(min=2, max=128, message="Fuel type must be between 2 and 128 characters")
    private String fuelType;
    
    @NotEmpty(message="Condition is required!")
    @Size(min=3, max=128, message="Condition must be between 3 and 128 characters")
    private String condition;
    
    @NotEmpty(message="Image1 is required!")
    @Size(min=2, max=128)
    private String image1;
    
    @NotEmpty(message="Image2 is required!")
    @Size(min=2, max=128)
    private String image2;
    
    @NotEmpty(message="Image3 is required!")
    @Size(min=2, max=128)
    private String image3;

    @NotEmpty(message="Image4 is required!")
    @Size(min=2, max=128)
    private String image4;
    
    @NotNull(message="Year is required!")
    private String manufactureYear;
    
    @Column(nullable = true, length = 64)
    private String photos;
    
    @Column(nullable = true, length = 64)
    private String photos2;
    
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;
    
    @Min(value=0, message="Provide price of vehicle")
    private Integer price;
    
    @Transient
    public String getPhotosImagePath() {
        if (photos == null || id == null) return null;
        return "/car-photos/" + id + "/" + photos;
    }
    
    @Column(updatable=false)
    @OneToMany(mappedBy="car", fetch=FetchType.LAZY)
    private List<Review> reviews;
    
    public List<Review> getReviews() {
		return reviews;
	}
	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}
	@Column(updatable=false)
	@DateTimeFormat(pattern = "yyy-MM-dd")
    private Date createdAt;
	@DateTimeFormat(pattern = "yyy-MM-dd")
    private Date updatedAt;
	
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
	
	public String getPhotos2() {
		return photos2;
	}
	public void setPhotos2(String photos2) {
		this.photos2 = photos2;
	}
	public String getPhotos() {
		return photos;
	}
	public void setPhotos(String photos) {
		this.photos = photos;
	}
	public String getCarMake() {
		return carMake;
	}
	public void setCarMake(String carMake) {
		this.carMake = carMake;
	}
	
	public String getExteriorColor() {
		return exteriorColor;
	}
	public void setExteriorColor(String exteriorColor) {
		this.exteriorColor = exteriorColor;
	}
	
	public String getCarModel() {
		return carModel;
	}
	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}
	
	
	public String getCarEngine() {
		return carEngine;
	}
	public void setCarEngine(String carEngine) {
		this.carEngine = carEngine;
	}
	public String getTransmission() {
		return transmission;
	}
	public void setTransmission(String transmission) {
		this.transmission = transmission;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	
	public String getDriveTrain() {
		return driveTrain;
	}
	public void setDriveTrain(String driveTrain) {
		this.driveTrain = driveTrain;
	}
	public String getInteriorColor() {
		return interiorColor;
	}
	public void setInteriorColor(String interiorColor) {
		this.interiorColor = interiorColor;
	}
	public String getFuelType() {
		return fuelType;
	}
	public void setFuelType(String fuelType) {
		this.fuelType = fuelType;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	public Car() {
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	public String getCarType() {
		return carType;
	}
	public void setCarType(String carType) {
		this.carType = carType;
	}
	public String getManufactureYear() {
		return manufactureYear;
	}
	public void setManufactureYear(String manufactureYear) {
		this.manufactureYear = manufactureYear;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	public String getImage4() {
		return image4;
	}
	public void setImage4(String image4) {
		this.image4 = image4;
	}
	
	
}
