package com.fsoft.entities;

import java.io.Serializable;
import java.lang.String;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: UsersRole
 *
 */
@Entity
@Table(name = "Users_Roles")
public class UsersRole implements Serializable {

  @Id
  @Column(name = "user_role_id")
  private int userRoleId;

  @Column(name = "user_id")
  private int userId;

  private String authority;

  private static final long serialVersionUID = 1L;

  public UsersRole() {
    super();
  }

  public int getUserRoleId() {
    return this.userRoleId;
  }

  public void setUserRoleId(int userRoleId) {
    this.userRoleId = userRoleId;
  }

  public String getAuthority() {
    return this.authority;
  }

  public void setAuthority(String authority) {
    this.authority = authority;
  }

  public int getUserId() {
    return userId;
  }

  public void setUserId(int userId) {
    this.userId = userId;
  }

}
