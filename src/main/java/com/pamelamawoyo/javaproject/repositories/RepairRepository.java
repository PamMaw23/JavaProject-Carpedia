package com.pamelamawoyo.javaproject.repositories;

import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.pamelamawoyo.javaproject.models.Repair;


@Repository
public interface RepairRepository extends CrudRepository<Repair,Long>{
	List<Repair> findAll();

}
