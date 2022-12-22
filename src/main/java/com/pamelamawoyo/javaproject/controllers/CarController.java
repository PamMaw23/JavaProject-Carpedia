package com.pamelamawoyo.javaproject.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.pamelamawoyo.javaproject.models.Car;
import com.pamelamawoyo.javaproject.models.Review;
import com.pamelamawoyo.javaproject.services.CarService;
import com.pamelamawoyo.javaproject.services.RepairService;
import com.pamelamawoyo.javaproject.services.ReviewService;
import com.pamelamawoyo.javaproject.services.UserService;

@Controller
public class CarController {
	
	@Autowired
	private CarService carService;
	
	@Autowired
	private RepairService repairService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/financing")
 	public String financing(HttpSession session) {
	 if(session.getAttribute("userId")== null) {
		 return "redirect:/";
	 }
	 return "financing.jsp";
 }

		
	@GetMapping("/inventory")
 	public String inventory(HttpSession session, Model model) {
	 if(session.getAttribute("userId")== null) {
		 return "redirect:/";
	 }
	 
	 model.addAttribute("carList", carService.allCars());
	 return "inventory.jsp";
 }
	
	@GetMapping("/scheduled/service")
 	public String scheduledService(HttpSession session, Model model) {
	 if(session.getAttribute("userId")== null) {
		 return "redirect:/";
	 }
	 
	 model.addAttribute("repairList", repairService.allRepairs());
	 return "requestedService.jsp";
 }
	
	//create Car
		@GetMapping("/vehicle/new")
		public String displayNewCarForm(@ModelAttribute("newCar") Car newCar) {
			return "addCar.jsp";
		}
		
		@PostMapping("/vehicle/new")
		public String processNewCarForm(@Valid @ModelAttribute("newCar") Car newCar,
				BindingResult result, Model model) {
			if(result.hasErrors()) {
				return "addCar.jsp";
			}else {
				carService.createCar(newCar);
				return "redirect:/dashboard";}
			}
		
		@GetMapping("/view/luxury")
	 	public String viewType( String type,HttpSession session, Model model) {
		 if(session.getAttribute("userId")== null) {
			 return "redirect:/";
		 }
		 model.addAttribute("carList", carService.allCars());
		 return "viewLuxury.jsp";
	 }
		
		@GetMapping("/view/coupe")
	 	public String viewCoupe( String type,HttpSession session, Model model) {
		 if(session.getAttribute("userId")== null) {
			 return "redirect:/";
		 }
		 model.addAttribute("carList", carService.allCars());
		 return "viewCoupe.jsp";
	 }
		
		@GetMapping("/view/suv")
	 	public String viewSUV( String type,HttpSession session, Model model) {
		 if(session.getAttribute("userId")== null) {
			 return "redirect:/";
		 }
		 model.addAttribute("carList", carService.allCars());
		 return "viewSUV.jsp";
	 }
		
		@GetMapping("/cars/{id}/reviews")
		public String viewProjectTasks(@PathVariable("id") Long id, HttpSession session, Model model, @ModelAttribute("review") Review review) {
			
			if(session.getAttribute("userId") == null) {
				return "redirect:/logout";
			}
			
			Car car = carService.singleCar(id);
			model.addAttribute("car", car);
			model.addAttribute("reviews", reviewService.carReviews(id));
			return "testimonials.jsp";
		}
		
		@PostMapping("/cars/{id}/reviews")
		public String newCarReview(
				@PathVariable("id") Long id, 
				HttpSession session, 
				Model model, 
				@Valid @ModelAttribute("review") Review review, 
				BindingResult result) {
			
			if(session.getAttribute("userId") == null) {
				return "redirect:/logout";
			}
			Long userId = (Long) session.getAttribute("userId");
			
			Car car = carService.singleCar(id);
			
			if(result.hasErrors()) {
				model.addAttribute("car", car);
				model.addAttribute("reviews", reviewService.carReviews(id));
				return "testimonials.jsp";
			}else {
				Review newReview = new Review(review.getName());
				newReview.setCar(car);
				newReview.setUser(userService.oneUser(userId));
				reviewService.addReview(newReview);
				return "redirect:/cars/" + id + "/reviews";
			}
		}
		
//		@GetMapping("/testimonials")
//	 	public String testimonials( String type,HttpSession session, Model model) {
//		 if(session.getAttribute("userId")== null) {
//			 return "redirect:/";
//		 }
//		 model.addAttribute("carList", carService.allCars());
//		 return "testimonials.jsp";
//	 }
}
