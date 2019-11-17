package com.fsoft.entities;

import java.io.Serializable;

import javax.persistence.*;

import java.util.List;

/**
 * The persistent class for the Course database table.
 * 
 */
@Entity
@NamedQuery(name = "Course.findAll", query = "SELECT c FROM Course c")
@NamedStoredProcedureQueries({ @NamedStoredProcedureQuery(name = "findByPage", procedureName = "usp_searchPagingCourse", resultClasses = Course.class, parameters = {
    @StoredProcedureParameter(mode = ParameterMode.IN, type = Integer.class, name = "pageSize"),
    @StoredProcedureParameter(mode = ParameterMode.IN, type = Integer.class, name = "pageNumber"),
    @StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "courseCode"),
    @StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "courseTitle") }) })
public class Course implements Serializable {
  private static final long serialVersionUID = 1L;

  @Id
  @Column(name = "course_code")
  private String courseCode;

  @Column(name = "course_title")
  private String courseTitle;

  private String descriptions;

  private int duration;
  private int status;

  // bi-directional many-to-one association to Courselearn
  @OneToMany(mappedBy = "course", fetch = FetchType.EAGER)
  private List<Courselearn> courselearns;

  // bi-directional many-to-one association to Enroll
  @OneToMany(mappedBy = "course", fetch = FetchType.EAGER)
  private List<Enroll> enrolls;

  // bi-directional many-to-one association to Schedule
  @OneToMany(mappedBy = "course", fetch = FetchType.EAGER)
  private List<Schedule> schedules;

  public Course() {
  }

  public Course(String courseCode, String courseTitle, String descriptions,
      int duration) {
    super();
    this.courseCode = courseCode;
    this.courseTitle = courseTitle;
    this.descriptions = descriptions;
    this.duration = duration;
  }

  public String getCourseCode() {
    return this.courseCode;
  }

  public void setCourseCode(String courseCode) {
    this.courseCode = courseCode;
  }

  public String getCourseTitle() {
    return this.courseTitle;
  }

  public void setCourseTitle(String courseTitle) {
    this.courseTitle = courseTitle;
  }

  public String getDescriptions() {
    return this.descriptions;
  }

  public void setDescriptions(String descriptions) {
    this.descriptions = descriptions;
  }

  public int getDuration() {
    return this.duration;
  }

  public void setDuration(int duration) {
    this.duration = duration;
  }

  public int getStatus() {
    return status;
  }

  public void setStatus(int status) {
    this.status = status;
  }

  public List<Courselearn> getCourselearns() {
    return this.courselearns;
  }

  public void setCourselearns(List<Courselearn> courselearns) {
    this.courselearns = courselearns;
  }

  public Courselearn addCourselearn(Courselearn courselearn) {
    getCourselearns().add(courselearn);
    courselearn.setCourse(this);
    ;

    return courselearn;
  }

  public Courselearn removeCourselearn(Courselearn courselearn) {
    getCourselearns().remove(courselearn);
    courselearn.setCourse(null);
    ;

    return courselearn;
  }

  public List<Enroll> getEnrolls() {
    return this.enrolls;
  }

  public void setEnrolls(List<Enroll> enrolls) {
    this.enrolls = enrolls;
  }

  public Enroll addEnroll(Enroll enroll) {
    getEnrolls().add(enroll);
    enroll.setCourse(this);

    return enroll;
  }

  public Enroll removeEnroll(Enroll enroll) {
    getEnrolls().remove(enroll);
    enroll.setCourse(null);

    return enroll;
  }

  public List<Schedule> getSchedules() {
    return this.schedules;
  }

  public void setSchedules(List<Schedule> schedules) {
    this.schedules = schedules;
  }

  public Schedule addSchedule(Schedule schedule) {
    getSchedules().add(schedule);
    schedule.setCourse(this);

    return schedule;
  }

  public Schedule removeSchedule(Schedule schedule) {
    getSchedules().remove(schedule);
    schedule.setCourse(null);

    return schedule;
  }

}