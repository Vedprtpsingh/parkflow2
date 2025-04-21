package com.ved.parkflow.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table
public class User {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column
private int id;
@Column
private String firstName;
@Column
private String lastName;
@Column
private String role;  // new field to distinguish user type

public String getFirstName() {
    return firstName;
}
public void setFirstName(String firstName) {
    this.firstName = firstName;
}
public String getLastName() {
    return lastName;
}
public void setLastName(String lastName) {
    this.lastName = lastName;
}
@Column
private String email;
@Column(name = "password")
private String password;
@Column
private String phoneno;

public int getId() {
    return id;
}
public void setId(int id) {
    this.id = id;
}
public String getEmail() {
    return email;
}
public void setEmail(String email) {
    this.email = email;
}
public String getPassword() {
    return password;
}
public void setPassword(String password) {
    this.password = password;
}
public String getPhoneno() {
    return phoneno;
}
public void setPhoneno(String phoneno) {
    this.phoneno = phoneno;
}

public String getRole() {
    return role;
}
public void setRole(String role) {
    this.role = role;
}
}