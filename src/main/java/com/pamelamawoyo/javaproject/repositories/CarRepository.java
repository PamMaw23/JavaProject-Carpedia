package com.pamelamawoyo.javaproject.repositories;

import java.util.List;
import java.util.Optional;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.pamelamawoyo.javaproject.models.Car;

@Repository
public interface CarRepository extends CrudRepository<Car, Long> {
	List<Car> findAll();
	Optional<Car> findByCarType(String carType);

}
