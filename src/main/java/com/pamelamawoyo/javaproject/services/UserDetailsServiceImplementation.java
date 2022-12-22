package com.pamelamawoyo.javaproject.services;

import java.util.ArrayList;
import java.util.List;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.pamelamawoyo.javaproject.models.Role;
import com.pamelamawoyo.javaproject.models.User;
import com.pamelamawoyo.javaproject.repositories.UserRepository;

@Service
public class UserDetailsServiceImplementation implements UserDetailsService {
    private UserRepository userRepository;
    
    public UserDetailsServiceImplementation(UserRepository userRepository){
        this.userRepository = userRepository;
    }
    // 1
    @Override
    public UserDetails loadUserByUsername(String firstName) throws UsernameNotFoundException {
        User newUser = userRepository.findByFirstName(firstName);
        
        if(newUser == null) {
            throw new UsernameNotFoundException("User not found");
        }
        
        return new org.springframework.security.core.userdetails.User(newUser.getFirstName(), newUser.getPassword(), getAuthorities(newUser));
    }
    
    // 2
    private List<GrantedAuthority> getAuthorities(User newUser){
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        for(Role role : newUser.getRoles()) {
            GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(role.getFirstName());
            authorities.add(grantedAuthority);
        }
        return authorities;
    }

}
