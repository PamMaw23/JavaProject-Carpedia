package com.pamelamawoyo.javaproject.services;


import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pamelamawoyo.javaproject.models.Car;
import com.pamelamawoyo.javaproject.repositories.CarRepository;

@Service
public class CarService {
	@Autowired
	private CarRepository carRepo;
	
	//all car
	public List<Car> allCars(){
		return carRepo.findAll();
	}
	
	//create car
		public Car createCar(Car car){
			return carRepo.save(car);
		}
		
		//update car
		public Car editCar(Car car) {
			return carRepo.save(car);
		}
		
		//delete car
		public void deleteCar(Long id) {
			carRepo.deleteById(id);
		}

	
	public Car singleCar(Long id) {
		Optional<Car> optionalCar = carRepo.findById(id);
		if(optionalCar.isPresent()) {
			return optionalCar.get();
		}else {
			return null;
		}
		}
		
		public Car groupCars(String carType) {
			Optional<Car> optionalCarType = carRepo.findByCarType(carType);
			if(optionalCarType.isPresent()) {
				return optionalCarType.get();
			}else {
				return null;
		
			}
		
		
		}
}
