package com.pamelamawoyo.javaproject.configs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@EnableWebSecurity
@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{

	@Autowired
	private UserDetailsService userDetailsService;
	
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
 
	@Override
	protected void configure(HttpSecurity http) throws Exception{
		
		http.csrf().disable().
	            authorizeRequests()
	            	.antMatchers("/admin/**").access("hasRole('ADMIN')")
	                .antMatchers("/css/**", "/js/**", "/dashboard", "/cars/**", "/scheduled/service", "/register", "/testimonials", "/about/us",
							"/view/**", "/vehicle/new", "/login", "/inventory",
							"/service/locations", "/financing", "/webjars/**", "/repair/edit",
							"/Images/**").permitAll()
	                .anyRequest().authenticated()
	                .and()
	            .formLogin()
	                .loginPage("/")
	                .permitAll()
	                .and()
	            .logout()
	                .permitAll();

	}

	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService)
				.passwordEncoder(bCryptPasswordEncoder());
        auth.inMemoryAuthentication()
		.withUser("Rocket").password("Password123").authorities("ROLE_USER")
		.and()
		.withUser("Pamela").password("Password123").authorities("ROLE_USER","ROLE_ADMIN");
    } 

}
