/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.model.User;
import java.util.Set;

/**
 *
 * @author Administrator
 */

public interface UserDao {
    int create(User user);
    Set<User> read();
    int update(User user);
    int delete(User user);
}
