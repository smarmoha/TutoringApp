package com.smaranika.tutoringapp.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.smaranika.tutoringapp.models.TaskDetails;

@Repository
public interface TaskDetailsRepository extends CrudRepository<TaskDetails, Long> {

	public List<TaskDetails> findAll();
	@Query(value="Select * FROM taskdetails where tutor_id =?1",nativeQuery=true)
	public List<TaskDetails> findAllByTutor(Long id);
}
