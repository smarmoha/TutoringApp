package com.smaranika.tutoringapp.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.smaranika.tutoringapp.models.Tutor;

public interface TutorRepository extends CrudRepository<Tutor, Long> {

	public Optional<Tutor> findByEmail(String email);
	public Optional<Tutor> findBytutorname(String tutorname);
}
