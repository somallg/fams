package com.fsoft.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the Enroll database table.
 * 
 */
@Entity
@NamedQuery(name="Enroll.findAll", query="SELECT e FROM Enroll e")
public class Enroll implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="enroll_id")
	private int enrollId;

	private double gpa;

	//bi-directional many-to-one association to Course
	@ManyToOne
	@JoinColumn(name="course_code")
	private Course course;

	//bi-directional many-to-one association to Trainee
	@ManyToOne
	@JoinColumn(name="trn_id")
	private Trainee trainee;

	public Enroll() {
	}

	public int getEnrollId() {
		return this.enrollId;
	}

	public void setEnrollId(int enrollId) {
		this.enrollId = enrollId;
	}

	public double getGpa() {
		return this.gpa;
	}

	public void setGpa(double gpa) {
		this.gpa = gpa;
	}

	public Course getCourse() {
		return this.course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Trainee getTrainee() {
		return this.trainee;
	}

	public void setTrainee(Trainee trainee) {
		this.trainee = trainee;
	}

}