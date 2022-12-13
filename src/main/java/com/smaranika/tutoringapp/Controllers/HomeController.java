package com.smaranika.tutoringapp.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.smaranika.tutoringapp.models.LoginUser;
import com.smaranika.tutoringapp.models.TaskDetails;
import com.smaranika.tutoringapp.models.Tutor;
import com.smaranika.tutoringapp.services.TaskDetailsService;
import com.smaranika.tutoringapp.services.TutorService;

@Controller
public class HomeController {
	@Autowired
	private TutorService tutServ;
	@Autowired
	private TaskDetailsService taskdetailsServ;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("tutor", new Tutor());
		model.addAttribute("loginUser", new LoginUser());
		return "index.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute(name="tutor") Tutor tut, BindingResult result, Model model, HttpSession session) {

		Tutor newtutor= tutServ.register(tut, result);
		if (newtutor == null) {
			model.addAttribute("loginUser", new LoginUser());
			return "index.jsp";
		}
		else {
			session.setAttribute("tutorId", newtutor.getId());
			return "redirect:/tasks";
		}
	}
	
	
	@PostMapping ("/login")
	public String login(@Valid @ModelAttribute (name="loginUser") LoginUser loginUser,
	BindingResult result, Model model, HttpSession session) {
	Tutor tutor = tutServ.login(loginUser, result);
		if (tutor==null) {
		model.addAttribute("tutor", new Tutor());
		return "index.jsp";
		}
	session. setAttribute("tutorId", tutor.getId());
	return "redirect:/tasks";
	
	}
	
	@GetMapping("/tasks")
	public String dashboard (Model model, HttpSession session) {
	if (session.getAttribute("tutorId").equals (null)) {
	return
	"redirect:/";
	}
	Long tutorId = (Long) session. getAttribute("tutorId");
	Tutor tutor = tutServ.findById(tutorId);
	model. addAttribute ("tutor", tutor);
	
	List<TaskDetails> mytasks = taskdetailsServ.getAllByTutor(tutorId);
	model.addAttribute("mytasks",mytasks);
	
	List<TaskDetails> otherctasks = taskdetailsServ.getOtherTaskDetails(tutorId);
	model.addAttribute("othertasks", otherctasks);
	return "tasks.jsp";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("tutorId");
		return "redirect:/";
	}
}
