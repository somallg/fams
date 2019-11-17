package com.fsoft.entities;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the COURSELEARN database table.
 * 
 */
@Embeddable
public class CourselearnPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="learning_code")
  private String learningCode;

	@Column(name="course_code")
	private String courseCode;

	public CourselearnPK() {
	}
	public String getLearningCode() {
		return this.learningCode;
	}
	public void setLearningCode(String learningCode) {
		this.learningCode = learningCode;
	}
	public String getCourseCode() {
		return this.courseCode;
	}
	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof CourselearnPK)) {
			return false;
		}
		CourselearnPK castOther = (CourselearnPK)other;
		return 
			this.learningCode.equals(castOther.learningCode)
			&& this.courseCode.equals(castOther.courseCode);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.learningCode.hashCode();
		hash = hash * prime + this.courseCode.hashCode();
		
		return hash;
	}
}