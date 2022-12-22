package com.pamelamawoyo.javaproject.services;

import java.util.Optional;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import com.pamelamawoyo.javaproject.models.LoginUser;
import com.pamelamawoyo.javaproject.models.User;
import com.pamelamawoyo.javaproject.repositories.RoleRepository;
import com.pamelamawoyo.javaproject.repositories.UserRepository;


@Service
public class UserService {
	
	
	private final BCryptPasswordEncoder bCryptPasswordEncoder;
    private final UserRepository userRepo;
    private final RoleRepository roleRepo;
    
    public UserService(UserRepository userRepository, RoleRepository roleRepository, BCryptPasswordEncoder bCryptPasswordEncoder)     {
        this.userRepo = userRepository;
        this.roleRepo = roleRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }
    
 // 1
    public void saveWithUserRole(User newUser) {
    	newUser.setPassword(bCryptPasswordEncoder.encode(newUser.getPassword()));
    	newUser.setRoles(roleRepo.findByFirstName("ROLE_USER"));
        userRepo.save(newUser);
    }
     
     // 2 
    public void saveUserWithAdminRole(User newUser) {
    	newUser.setPassword(bCryptPasswordEncoder.encode(newUser.getPassword()));
        newUser.setRoles(roleRepo.findByFirstName("ROLE_ADMIN"));
        userRepo.save(newUser);
    }    
    
    // 3
    public User findByFirstName(String firstName) {
        return userRepo.findByFirstName(firstName);
    }
    
    
    // This method will be called from the controller
    // whenever a user submits a registration form.
    public User register(User newUser, BindingResult result) {
    	// TO-DO - Reject values or register if no errors:
    	
    	Optional<User> thisUser = userRepo.findByEmail(newUser.getEmail());
    	
        // Reject if email is taken (present in database)
    	if(thisUser.isPresent()){
    		result.rejectValue("email", "Matches", "This email alreday in use!");
        	}
    	
       // Reject if password doesn't match confirmation
    	if(!newUser.getPassword().equals(newUser.getConfirm())) {
    	    result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
    	}
    		
        // Return null if result has errors
		if(result.hasErrors()) {
			return null;}
    			
        // Hash and set password, save user to database
    		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    		newUser.setPassword(hashed);
    		userRepo.save(newUser);
    		
    		return newUser;
    }
    
    
    // This method will be called from the controller
    // whenever a user submits a login form.
    public User login(LoginUser newLogin, BindingResult result) {
    	// TO-DO - Reject values:
        
    	// Find user in the DB by email
    	Optional<User> potentialUser = userRepo.findByEmail(newLogin.getEmail());
    	
        // Reject if NOT present
        if(!potentialUser.isPresent()) {
        	result.rejectValue("email", "Matches", "Invalid Email!");
        	return null;
        }
        
        //grab the user from potential user
         User user = potentialUser.get();
         
        // Reject if BCrypt password match fails
    	if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
    	    result.rejectValue("password", "Matches", "Invalid Password!");
    	}
        // Return null if result has errors
    	if(result.hasErrors()) {;
    	
			return null;}
    	
        // Otherwise, return the user object
	    	else {
	    		return user;
	    	}
    }
    
    //find one user
    public User oneUser(Long id) {
    	Optional<User> optionalUser = userRepo.findById(id);
    	if(optionalUser.isPresent()) {
    		return optionalUser.get();
    	}else {
    		return null;
    	}
    }
}