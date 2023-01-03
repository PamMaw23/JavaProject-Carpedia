package com.pamelamawoyo.javaproject.controllers;

import java.security.Principal;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
//import com.pamelamawoyo.javaproject.models.Employee;
//import com.pamelamawoyo.javaproject.models.LoginEmployee;
import com.pamelamawoyo.javaproject.models.LoginUser;
import com.pamelamawoyo.javaproject.models.User;
//import com.pamelamawoyo.javaproject.services.EmployeeService;
import com.pamelamawoyo.javaproject.services.UserService;




@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
//	@Autowired
//	private EmployeeService employeeService;

 
	 @GetMapping("/")
	 public String index(Model model) {
 
     // Bind empty User and LoginUser objects to the JSP
     // to capture the form input
     model.addAttribute("newUser", new User());
     model.addAttribute("newLogin", new LoginUser());
     return "index.jsp";
	 }
	 

 
	 @PostMapping("/register")
	 public String register(@Valid @ModelAttribute("newUser") User newUser, 
	         BindingResult result, Model model, HttpSession session) {
	
	     if(result.hasErrors()) {
	//         model.addAttribute("newLogin", new LoginUser());
	         return "index.jsp";
	     }
	//     
	//     // TO-DO Later: Store their ID from the DB in session, 
	//     // in other words, log them in.
	//     session.setAttribute("userId", registeredUser.getId());
	//     session.setAttribute("userName", registeredUser.getFirstName());
	     userService.saveUserWithAdminRole(newUser);
	     return "redirect:/";
	 }
	 
	 @RequestMapping("/admin")
	    public String adminPage(Principal principal, Model model) {
	        String firstName = principal.getName();
	        model.addAttribute("currentUser", userService.findByFirstName(firstName));
	        System.out.println("Hey, I'm an admin");
	        return "requestedService.jsp";
	    }
	 

	 
	 @PostMapping("/login")
	 public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
	         BindingResult result, Model model, HttpSession session) {
	     
	     // Add once service is implemented:
		 User loginUser = userService.login(newLogin, result);    
	 
	     if(result.hasErrors()) {
	         model.addAttribute("newUser", new User());
	         return "index.jsp";
	     }
	    
	 
	     // No errors! 
	     // TO-DO Later: Store their ID from the DB in session, 
	     // in other words, log them in.
	     session.setAttribute("userId", loginUser.getId());
	     session.setAttribute("userName", loginUser.getFirstName());
	     if (loginUser.getId() == 1) {
			 session.setAttribute("admin", true);
		 } else {
			 session.setAttribute("admin", false);
		 }
	     return "redirect:/dashboard";
	 }
	 
	 @RequestMapping(value = {"/", "/dashboard"})
	    public String home(Principal principal, Model model) {
	        // 1
	        String firstName = principal.getName();
	        model.addAttribute("currentUser", userService.findByFirstName(firstName));
	        return "homePage.jsp";
	    }
	 
//	 @PostMapping("/employee/login")
//	         BindingResult result, Model model, HttpSession session) {
//	     
//	     // Add once service is implemented:
//	 
//	     if(result.hasErrors()) {
//	         model.addAttribute("newEmployee", new Employee());
//	         return "index.jsp";
//	     }
	    
	 
	     // No errors! 
	     // TO-DO Later: Store their ID from the DB in session, 
	     // in other words, log them in.
//	     session.setAttribute("employeeId", loginEmployee.getId());
//	     session.setAttribute("employeeName", loginEmployee.getEmployeeFirstName());
//	     
//	     return "redirect:/dashboard";
//	 }
	 
	 @GetMapping("/dashboard")
	 	public String dashboard(HttpSession session) {
		 if(session.getAttribute("userId")== null) {
			 return "redirect:/";
		 }
		 if (Boolean.valueOf(session.getAttribute("admin").toString())) {
			return "dashboard_admin.jsp";
		 }
		 return "dashboard.jsp";
	 }
	
	 @RequestMapping("/logout")
	 public String logout(HttpSession session) {
		 session.invalidate();
		 return "redirect:/";
		
	 }
	 
	 @GetMapping("/about/us")
	 	public String aboutUs( String type,HttpSession session, Model model) {
		 if(session.getAttribute("userId")== null) {
			 return "redirect:/";
		 }
		 return "aboutUs.jsp";
	 }
	 
//	 @PostMapping("/register")
//	 public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, HttpSession session) {
//	     if (result.hasErrors()) {
//	         return "index.jsp";
//	     }
//	     userService.saveWithUserRole(user);
//	     return "redirect:/";
//	 }
	 
	// @GetMapping("/service")
	//	public String service(HttpSession session) {
	//	 if(session.getAttribute("userId")== null) {
	//		 return "redirect:/";
	//	 }
	//	 return "service.jsp";
	//}
	 
//	 @RequestMapping("/register")
//	 public String registerForm(@Valid @ModelAttribute("user") User user) {
//	     return "registrationPage.jsp";
//	 }
	 
//	 @RequestMapping("/login")
//	    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
//	        if(error != null) {
//	            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
//	        }
//	        if(logout != null) {
//	            model.addAttribute("logoutMessage", "Logout Successful!");
//	        }
//	        return "index.jsp";
//	    }
}
