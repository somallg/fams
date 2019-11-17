package com.fsoft.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Trainee database table.
 * 
 */
@Entity
@NamedQuery(name="Trainee.findAll", query="SELECT t FROM Trainee t")
public class Trainee implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="trn_id")
	private int trnId;

	@Column(name="external_email")
	private String externalEmail;

	@Column(name="mobile_phone")
	private String mobilePhone;

	@Column(name="trn_account")
	private String trnAccount;

	@Column(name="trn_email")
	private String trnEmail;

	@Column(name="trn_name")
	private String trnName;

	//bi-directional many-to-one association to Clazz
	@ManyToOne
	@JoinColumn(name="clazz_id")
	private Clazz clazz;

	//bi-directional many-to-one association to Enroll
	@OneToMany(mappedBy="trainee", fetch=FetchType.EAGER)
	private List<Enroll> enrolls;

	public Trainee() {
	}

	public int getTrnId() {
		return this.trnId;
	}

	public void setTrnId(int trnId) {
		this.trnId = trnId;
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

	public String getTrnAccount() {
		return this.trnAccount;
	}

	public void setTrnAccount(String trnAccount) {
		this.trnAccount = trnAccount;
	}

	public String getTrnEmail() {
		return this.trnEmail;
	}

	public void setTrnEmail(String trnEmail) {
		this.trnEmail = trnEmail;
	}

	public String getTrnName() {
		return this.trnName;
	}

	public void setTrnName(String trnName) {
		this.trnName = trnName;
	}

	public Clazz getClazz() {
		return this.clazz;
	}

	public void setClazz(Clazz clazz) {
		this.clazz = clazz;
	}

	public List<Enroll> getEnrolls() {
		return this.enrolls;
	}

	public void setEnrolls(List<Enroll> enrolls) {
		this.enrolls = enrolls;
	}

	public Enroll addEnroll(Enroll enroll) {
		getEnrolls().add(enroll);
		enroll.setTrainee(this);

		return enroll;
	}

	public Enroll removeEnroll(Enroll enroll) {
		getEnrolls().remove(enroll);
		enroll.setTrainee(null);

		return enroll;
	}

}