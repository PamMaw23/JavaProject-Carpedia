package com.pamelamawoyo.javaproject.repositories;

import java.util.Optional;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.pamelamawoyo.javaproject.models.User;


@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    Optional<User> findByEmail(String email);
    User findByFirstName(String firstname);

}
