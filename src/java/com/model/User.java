/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

/**
 *
 * @author Administrator
 */
public record User(int id, String email, String password, String firstName, String lastName, String status) {
public User(int id) {
        this(id, null, null, null, null, null);
    }

    public int getId() {
        return id;
    }

}
