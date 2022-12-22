package com.pamelamawoyo.javaproject.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pamelamawoyo.javaproject.models.Review;
import com.pamelamawoyo.javaproject.repositories.ReviewRepository;


@Service
public class ReviewService {
	
	@Autowired
	private ReviewRepository reviewRepo;
	
	public List<Review> allReviews(){
		return reviewRepo.findAll();
	}
	
	public List<Review> carReviews(Long carId){
		return reviewRepo.findByCarIdIs(carId);
	}
	
	public Review addReview(Review review) {
		return reviewRepo.save(review);
	}
	
	public void deleteReview(Review review) {
		reviewRepo.delete(review);
	}
	

}
