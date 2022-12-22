package com.pamelamawoyo.javaproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pamelamawoyo.javaproject.models.Repair;
import com.pamelamawoyo.javaproject.repositories.RepairRepository;

@Service
public class RepairService {
	@Autowired
    private RepairRepository repairRepo;
	
	//all services
	public List<Repair> allRepairs(){
		return repairRepo.findAll();
	}
	
	//create book
	public Repair createRepair(Repair repair){
		return repairRepo.save(repair);
	}
	
	//update book
	public Repair editRepair(Repair repair) {
	return repairRepo.save(repair);
	}
	
	//delete book
	public void deleteRepair(Long id) {
		repairRepo.deleteById(id);
	}

	
	public Repair singleSRepair(Long id) {
		Optional<Repair> optionalRepair = repairRepo.findById(id);
		if(optionalRepair.isPresent()) {
			return optionalRepair.get();
		}else {
			return null;
	
		}
}

}
