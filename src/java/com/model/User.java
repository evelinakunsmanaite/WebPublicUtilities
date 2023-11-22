package com.model;

/**
 *
 * @author Administrator
 */
public record User(int id, String email, String password, String firstName, String lastName, String status) {

    public User(int id) {
        this(id, null, null, null, null, null);
    }

    public User(String email, String password, String firstName, String lastName, String status) {
        this(0, email, password, firstName, lastName, status);
    }

    public int getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getStatus() {
        return status;
    }
}
