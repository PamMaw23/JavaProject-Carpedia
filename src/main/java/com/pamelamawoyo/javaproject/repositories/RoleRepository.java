package com.pamelamawoyo.javaproject.repositories;


import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.pamelamawoyo.javaproject.models.Role;

@Repository
public interface RoleRepository extends CrudRepository<Role, Long>{
	 List<Role> findAll();
	 List<Role> findByFirstName(String firstName);
}
