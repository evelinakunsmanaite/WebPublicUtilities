package com.service.impl;

import com.dao.UserDao;
import java.util.Set;
import com.model.User;
import com.service.UserService;
import java.util.stream.Collectors;

public class UserServiceImpl implements UserService {

    UserDao dao;

    public UserServiceImpl(UserDao dao) {
        this.dao = dao;
    }

    @Override
    public boolean create(User user) {
        return dao.create(user) > 0;
    }

    @Override
    public Set<User> read() {
        return dao.read();
    }

    @Override
    public boolean update(int id, String email, String password, String firstName, String lastName, String status) {
        User updatedUser = new User(id, email, password, firstName, lastName, status);
        return dao.update(updatedUser) > 0;
    }

    @Override
    public boolean delete(int id) {
        User user = new User(id);
        return dao.delete(user) > 0;
    }

    public User login(String email, String password) {
        return dao.read().stream()
                .filter(user -> email.equals(user.email())
                && password.equals(user.password()))
                .findFirst()
                .orElse(null);
    }

    public Set<String> getUserEmail() {
        return dao.read().stream()
                .filter(user -> user.getStatus()
                .endsWith("user"))
                .map(User::email)
                .collect(Collectors.toSet());
    }
}
