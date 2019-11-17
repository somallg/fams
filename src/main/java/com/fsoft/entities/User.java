package com.fsoft.entities;

import java.io.Serializable;

import javax.persistence.*;

/**
 * The persistent class for the Users database table.
 * 
 */
@Entity
@Table(name = "Users")
@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
public class User implements Serializable {
  private static final long serialVersionUID = 1L;

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "user_id")
  private int userId;

  private String email;

  private short enabled;

  private String password;

  @Column(name = "user_name")
  private String userName;

  // bi-directional one-to-one association to Users_Role
  @OneToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "user_id", referencedColumnName = "user_id")
  private UsersRole usersRole;

  public User() {
  }

  public int getUserId() {
    return this.userId;
  }

  public User(String password, String userName) {
    super();
    this.password = password;
    this.userName = userName;
  }

  public void setUserId(int userId) {
    this.userId = userId;
  }

  public String getEmail() {
    return this.email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public short getEnabled() {
    return this.enabled;
  }

  public void setEnabled(short enabled) {
    this.enabled = enabled;
  }

  public String getPassword() {
    return this.password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getUserName() {
    return this.userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public UsersRole getUsersRole() {
    return this.usersRole;
  }

  public void setUsersRole(UsersRole usersRole) {
    this.usersRole = usersRole;
  }

}