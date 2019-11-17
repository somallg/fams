package com.fsoft.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the COURSELEARN database table.
 * 
 */
@Entity
@Table(name="COURSELEARN")
@NamedQuery(name="Courselearn.findAll", query="SELECT c FROM Courselearn c")
public class Courselearn implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private CourselearnPK id;

	private String descriptions;

	//bi-directional many-to-one association to Course
	@ManyToOne
	@JoinColumn(name="course_code", insertable=false, updatable=false)
	private Course course;

	//bi-directional many-to-one association to LearningPath
	@ManyToOne
	@JoinColumn(name="learning_code", insertable=false, updatable=false)
	private LearningPath learningPath;

	public Courselearn() {
	}

	public CourselearnPK getId() {
		return this.id;
	}

	public void setId(CourselearnPK id) {
		this.id = id;
	}

	public String getDescriptions() {
		return this.descriptions;
	}

	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}

	public Course getCourse() {
		return this.course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public LearningPath getLearningPath() {
		return this.learningPath;
	}

	public void setLearningPath(LearningPath learningPath) {
		this.learningPath = learningPath;
	}

}