package com.smaranika.tutoringapp.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.smaranika.tutoringapp.models.LoginUser;
import com.smaranika.tutoringapp.models.Tutor;
import com.smaranika.tutoringapp.repositories.TutorRepository;

@Service
public class TutorService {
	@Autowired
	private TutorRepository tutorrepo;
		
	public Tutor register (Tutor tut,BindingResult result) {
		Optional <Tutor> tutor = tutorrepo.findByEmail(tut.getEmail());
		if(tutor.isPresent()) {
			result.rejectValue("email","Taken", "That email already taken");
		}
		if(result.hasFieldErrors()) {
			return null;
		}
		tut.setPassword(BCrypt.hashpw(tut.getPassword(), BCrypt.gensalt()));
		return tutorrepo.save(tut);
	}
	
	public Tutor login (LoginUser l,BindingResult result) {
		Optional<Tutor> tut = tutorrepo.findByEmail(l.getEmail());
		if(!result.hasErrors()) {
			if (tut.isPresent()) {
				if(BCrypt.checkpw(l.getPassword(), tut.get().getPassword())) {
					return tut.get();
				}
			}
			result.rejectValue("username","Login","Invalid email/password combination");
		}
		return null;
	}
	
	public Tutor findById(Long id) {
		Optional<Tutor> tut = tutorrepo.findById(id);
		if(tut.isPresent()) {
			
				return tut.get();
			}
			else {
				return null;
			}
		}
	
	public Tutor findByName(String tutorname) {
		Optional<Tutor> tut = tutorrepo.findBytutorname(tutorname);
		if(tut.isPresent()) {
			
			return tut.get();
		}
		else {
			return null;
		}
	}
	
}
