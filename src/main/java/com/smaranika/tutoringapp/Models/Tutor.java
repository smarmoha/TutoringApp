package com.smaranika.tutoringapp.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name="tutors")
public class Tutor {

@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
private Long id;

@NotNull
@Size(min=1, message="User Name is Required")
private String tutorname;

@NotNull
@Email(message="must be in email format")
@Size(min=8, message="Must be at least 8 characters=.")
private String email;

@NotNull
@Size(min=8, message= "must be at least 8 characters.")
private String password;

@Transient
private String confirmPass;

@Column(updatable=false)
@DateTimeFormat(pattern ="yyyy-MM-dd")
private Date createdAt;

@DateTimeFormat(pattern ="yyyy-MM-dd")
private Date updatedAt;

public Long getId() {
	return id;
}

@OneToMany(mappedBy="tutor", fetch=FetchType.LAZY)
private List<TaskDetails> tasks;

public void setId(Long id) {
	this.id = id;
}

public String getTutorname() {
	return tutorname;
}

public void setTutorname(String tutorname) {
	this.tutorname = tutorname;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getConfirmPass() {
	return confirmPass;
}

public void setConfirmPass(String confirmPass) {
	this.confirmPass = confirmPass;
}

public Date getCreatedAt() {
	return createdAt;
}

public void setCreatedAt(Date createdAt) {
	this.createdAt = createdAt;
}

public Date getUpdatedAt() {
	return updatedAt;
}

public void setUpdatedAt(Date updatedAt) {
	this.updatedAt = updatedAt;
}

@PrePersist
protected void onCreate() {
	this.createdAt = new Date();
}

@PreUpdate
protected void onUpdate() {
	this.updatedAt = new Date();
}


}
