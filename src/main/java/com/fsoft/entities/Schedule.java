package com.fsoft.entities;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.*;


/**
 * The persistent class for the Schedule database table.
 * 
 */
@Entity
@NamedQuery(name="Schedule.findAll", query="SELECT s FROM Schedule s")
public class Schedule implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="schedule_id")
	private int scheduleId;

	private int duration;

	@Column(name="ends_date")
	private Date endsDate;

	@Column(name="starts_date")
	private Date startsDate;

	//bi-directional many-to-one association to Clazz
	@ManyToOne
	@JoinColumn(name="clazz_id")
	private Clazz clazz;

	//bi-directional many-to-one association to Course
	@ManyToOne
	@JoinColumn(name="course_code")
	private Course course;

	//bi-directional many-to-one association to Trainer
	@ManyToOne
	@JoinColumn(name="trainer_id")
	private Trainer trainer;

	public Schedule() {
	}

	public int getScheduleId() {
		return this.scheduleId;
	}

	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}

	public int getDuration() {
		return this.duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public Date getEndsDate() {
		return this.endsDate;
	}

	public void setEndsDate(Date endsDate) {
		this.endsDate = endsDate;
	}

	public Date getStartsDate() {
		return this.startsDate;
	}

	public void setStartsDate(Date startsDate) {
		this.startsDate = startsDate;
	}

	public Clazz getClazz() {
		return this.clazz;
	}

	public void setClazz(Clazz clazz) {
		this.clazz = clazz;
	}

	public Course getCourse() {
		return this.course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Trainer getTrainer() {
		return this.trainer;
	}

	public void setTrainer(Trainer trainer) {
		this.trainer = trainer;
	}

}