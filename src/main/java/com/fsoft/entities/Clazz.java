package com.fsoft.entities;

import java.io.Serializable;

import javax.persistence.*;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonProperty;

import java.sql.Date;
import java.util.List;

/**
 * The persistent class for the Clazz database table.
 * 
 */
@Entity
@NamedQuery(name = "Clazz.findAll", query = "SELECT c FROM Clazz c")
public class Clazz implements Serializable {
  private static final long serialVersionUID = 1L;

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "clazz_id")
  private int clazzId;

  @Column(name = "clazz_code")
  private String clazzCode;

  @Column(name = "clazz_name")
  private String clazzName;

  private String descriptions;

  @Column(name = "ends_date")
  private Date endsDate;

  @Column(name = "starts_date")
  private Date startsDate;

  // bi-directional many-to-one association to Trainee
  @OneToMany(mappedBy = "clazz", fetch = FetchType.EAGER)
  @JsonIgnore
  private List<Trainee> trainees;

  // bi-directional many-to-one association to LearningPath
  @ManyToOne
  @JoinColumn(name = "learning_code")
  @JsonIgnore
  private LearningPath learningPath;

  // bi-directional many-to-one association to Schedule

  @OneToMany(mappedBy = "clazz", fetch = FetchType.EAGER)
  @JsonIgnore
  private List<Schedule> schedules;

  public Clazz() {
  }

  public int getClazzId() {
    return this.clazzId;
  }

  public void setClazzId(int clazzId) {
    this.clazzId = clazzId;
  }

  public String getClazzCode() {
    return this.clazzCode;
  }

  public void setClazzCode(String clazzCode) {
    this.clazzCode = clazzCode;
  }

  public String getClazzName() {
    return this.clazzName;
  }

  public void setClazzName(String clazzName) {
    this.clazzName = clazzName;
  }

  public String getDescriptions() {
    return this.descriptions;
  }

  public void setDescriptions(String descriptions) {
    this.descriptions = descriptions;
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

  @JsonIgnore
  public List<Trainee> getTrainees() {
    return this.trainees;
  }

  @JsonIgnore
  public void setTrainees(List<Trainee> trainees) {
    this.trainees = trainees;
  }

  public Trainee addTrainee(Trainee trainee) {
    getTrainees().add(trainee);
    trainee.setClazz(this);

    return trainee;
  }

  public Trainee removeTrainee(Trainee trainee) {
    getTrainees().remove(trainee);
    trainee.setClazz(null);

    return trainee;
  }
  @JsonIgnore
  public LearningPath getLearningPath() {
    return this.learningPath;
  }
  @JsonIgnore
  public void setLearningPath(LearningPath learningPath) {
    this.learningPath = learningPath;
  }

  @JsonIgnore
  public List<Schedule> getSchedules() {
    return this.schedules;
  }

  @JsonIgnore
  public void setSchedules(List<Schedule> schedules) {
    this.schedules = schedules;
  }

  public Schedule addSchedule(Schedule schedule) {
    getSchedules().add(schedule);
    schedule.setClazz(this);

    return schedule;
  }

  public Schedule removeSchedule(Schedule schedule) {
    getSchedules().remove(schedule);
    schedule.setClazz(null);

    return schedule;
  }

}