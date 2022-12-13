package com.smaranika.tutoringapp.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smaranika.tutoringapp.models.TaskDetails;
import com.smaranika.tutoringapp.models.Tutor;
import com.smaranika.tutoringapp.services.TaskDetailsService;
import com.smaranika.tutoringapp.services.TutorService;

@Controller
@RequestMapping("/tasks")
public class TaskDetailsController {

	@Autowired
	private TaskDetailsService taskdetailsServ;
	@Autowired 
	TutorService tutorServ;
	
	@GetMapping("/new")
	public String newTask(@ModelAttribute("task")TaskDetails task) {
			return "newtask.jsp";
		}
	
	@PostMapping("/create")
	public String create(@Valid @ModelAttribute("task") TaskDetails task,
			BindingResult result,HttpSession session) {
		if(result.hasErrors()) {
			return "newtask.jsp";
		}
		else {
			Long id=(Long) session.getAttribute("tutorId");
			Tutor tutor = tutorServ.findById(id);
			task.setTutor(tutor);
			taskdetailsServ.create(task);
			return "redirect:/tasks";
		}
	}
		@GetMapping("{id}/delete")
		public String delete(@PathVariable("id") Long id, HttpSession session){
			if(session.getAttribute("tutorId")==null) {
				return "redirect:/";
			}
			taskdetailsServ.delete(id);
			return "redirect:/tasks";
		}
		
		
		@GetMapping("{id}/edit")
		public String edit(@PathVariable("id") Long id, HttpSession session,Model model){
			if(session.getAttribute("tutorId")==null) {
				return "redirect:/";
			}
			model.addAttribute("task",taskdetailsServ.getOneById(id));
		return "edittask.jsp";
		}
		
		@PutMapping("/update")
		public String update(@Valid @ModelAttribute(name="task") TaskDetails task, 
				BindingResult result) {
			if(result.hasErrors()) {
				return "edittask.jsp";
			}
			taskdetailsServ.update(task);
			return "redirect:/tasks";
		}
		
		
	    @GetMapping("/{id}/view")
	    public String showPage(Model model, @PathVariable("id") Long id) {

	    	TaskDetails task = taskdetailsServ.getOneById(id);
	    	model.addAttribute("task", task);    	
	    	return "viewtask.jsp";
	    }
	    
	}
	

