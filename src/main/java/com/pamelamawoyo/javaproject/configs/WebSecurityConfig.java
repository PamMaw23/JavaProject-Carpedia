package com.pamelamawoyo.javaproject.configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class WebSecurityConfig {
	
	private UserDetailsService userDetailsService;
	
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
 
	@Bean
	protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
		
		http.
	            authorizeRequests()
	            	.antMatchers("/admin/**").access("hasRole('ADMIN')")
	                .antMatchers("/css/**", "/js/**", "/dashboard", "/cars/**", "/scheduled/service", "/register", "/testimonials", "/about/us", "/view/**", "/vehicle/new", "/login", "/inventory","/service/locations", "/financing", "/webjars/**", "/Images/**").permitAll()
	                .anyRequest().authenticated()
	                .and()
	            .formLogin()
	                .loginPage("/")
	                .permitAll()
	                .and()
	            .logout()
	                .permitAll();
		
		return http.build();
	}
	
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
        auth.inMemoryAuthentication()
		.withUser("Rocket").password("Password123").authorities("ROLE_USER")
		.and()
		.withUser("Pamela").password("Password123").authorities("ROLE_USER","ROLE_ADMIN");
    } 

}
