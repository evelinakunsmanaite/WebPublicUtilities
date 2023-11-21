package com.service;

import java.util.Set;
import com.model.User;

public interface UserService {   
    boolean create(User gr);
    Set<User> read();
    boolean update(int id, String email, String password, String firstName, String lastName, String status);
    boolean delete(int id);
    User login(String email, String password);
 Set<String> getUserEmail();
}
