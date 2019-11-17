package com.fsoft.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

/**
 * The persistent class for the Trainer database table.
 * 
 */
@Entity
@NamedQueries({
    @NamedQuery(name = "Trainer.findAll", query = "SELECT t FROM Trainer t"),
    @NamedQuery(name = "findTrainers", query = "SELECT t FROM Trainer t WHERE t.roles = :roles") })
@NamedNativeQueries({ 
  @NamedNativeQuery(name = "callFindAllClazzAdmin", query = "{CALL usp_findAllClassAdmin()}", resultClass=Trainer.class)
 })

public class Trainer implements Serializable {
  private static final long serialVersionUID = 1L;

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "trainer_id")
  private int trainerId;

  @Column(name = "external_email")
  private String externalEmail;

  @Column(name = "mobile_phone")
  private String mobilePhone;

  private String subjects;

  @Column(name = "trainer_account")
  private String trainerAccount;

  @Column(name = "trainer_email")
  private String trainerEmail;

  @Column(name = "trainer_name")
  private String trainerName;

  private String roles;

  // bi-directional many-to-one association to Schedule
  @OneToMany(mappedBy = "trainer", fetch = FetchType.EAGER)
  private List<Schedule> schedules;

  public Trainer() {
  }

  public int getTrainerId() {
    return this.trainerId;
  }

  public void setTrainerId(int trainerId) {
    this.trainerId = trainerId;
  }

  public String getExternalEmail() {
    return this.externalEmail;
  }

  public void setExternalEmail(String externalEmail) {
    this.externalEmail = externalEmail;
  }

  public String getMobilePhone() {
    return this.mobilePhone;
  }

  public void setMobilePhone(String mobilePhone) {
    this.mobilePhone = mobilePhone;
  }

  public String getSubjects() {
    return this.subjects;
  }

  public void setSubjects(String subjects) {
    this.subjects = subjects;
  }

  public String getTrainerAccount() {
    return this.trainerAccount;
  }

  public void setTrainerAccount(String trainerAccount) {
    this.trainerAccount = trainerAccount;
  }

  public String getTrainerEmail() {
    return this.trainerEmail;
  }

  public void setTrainerEmail(String trainerEmail) {
    this.trainerEmail = trainerEmail;
  }

  public String getTrainerName() {
    return this.trainerName;
  }

  public void setTrainerName(String trainerName) {
    this.trainerName = trainerName;
  }

  public List<Schedule> getSchedules() {
    return this.schedules;
  }

  public void setSchedules(List<Schedule> schedules) {
    this.schedules = schedules;
  }

  public String getRoles() {
    return roles;
  }

  public void setRoles(String roles) {
    this.roles = roles;
  }

  /**
   * add a schedule.
   * 
   * @param schedule
   *          a schedule object.
   * @return
   */
  public Schedule addSchedule(Schedule schedule) {
    getSchedules().add(schedule);
    schedule.setTrainer(this);

    return schedule;
  }

  /**
   * remove a schedule.
   * 
   * @param schedule
   *          a schedule object.
   * @return
   */
  public Schedule removeSchedule(Schedule schedule) {
    getSchedules().remove(schedule);
    schedule.setTrainer(null);

    return schedule;
  }

}