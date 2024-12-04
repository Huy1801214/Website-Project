package model;

import java.util.Date;

public class Ct_user {
    int id_user;
    Date date_of_birth;
    String surname, lastname, username, gender, email, address, phone_num, password;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Ct_user(int id_user, String surname, String lastname, String username, String gender, String phone_num, String email, Date date_of_birth, String address, String password) {
        this.id_user = id_user;
        this.date_of_birth = date_of_birth;
        this.surname = surname;
        this.lastname = lastname;
        this.username = username;
        this.gender = gender;
        this.email = email;
        this.address = address;
        this.phone_num = phone_num;
        this.password = password;
    }

    public Ct_user() {
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public java.sql.Date getDate_of_birth() {
        return (java.sql.Date) date_of_birth;
    }

    public void setDate_of_birth(Date date_of_birth) {
        this.date_of_birth = date_of_birth;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone_num() {
        return phone_num;
    }

    public void setPhone_num(String phone_num) {
        this.phone_num = phone_num;
    }
}
