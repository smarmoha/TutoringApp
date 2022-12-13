package com.smaranika.tutoringapp.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.smaranika.tutoringapp.models.TaskDetails;
import com.smaranika.tutoringapp.models.Tutor;
import com.smaranika.tutoringapp.repositories.TaskDetailsRepository;
import com.smaranika.tutoringapp.repositories.TutorRepository;

@Service
public class TaskDetailsService {

	@Autowired
	private TaskDetailsRepository taskdetailsRepo;

	public TaskDetails create(TaskDetails td) {
		
		return taskdetailsRepo.save(td);
	}
	
	public List<TaskDetails> getAll(){
		return taskdetailsRepo.findAll();
	}
	
	public List<TaskDetails> getAllByTutor(Long id){
		return taskdetailsRepo.findAllByTutor(id);
	}
	
	public void delete(Long id) {
		taskdetailsRepo.deleteById(id);
		
	}
	
	public TaskDetails getOneById(Long id) {
		Optional<TaskDetails> td = taskdetailsRepo.findById(id);
		if(!td.isPresent()) {
			return null;
		}
		return td.get();
	}
	
	public TaskDetails update(TaskDetails td) {
		
		return taskdetailsRepo.save(td);
	}

	public List<TaskDetails> getOtherTaskDetails(Long id){
		List<TaskDetails> allTasks =taskdetailsRepo.findAll();
		ArrayList<TaskDetails> tds =new ArrayList<TaskDetails>();
		for (TaskDetails td :allTasks) {
			if(!td.getTutor().getId().equals(id)) {
				tds.add(td);		
			}
		}
		return tds;
		}
	
}
