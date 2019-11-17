package com.fsoft.entities;

public class Contact {
  private int contactId;
  private String name;
  private String email;
  private String phone;

  public Contact() {
  }

  public Contact(int contactId, String name, String email, String phone) {
    super();
    this.contactId = contactId;
    this.name = name;
    this.email = email;
    this.phone = phone;
  }

  public int getContactId() {
    return contactId;
  }

  public void setContactId(int contactId) {
    this.contactId = contactId;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

}
