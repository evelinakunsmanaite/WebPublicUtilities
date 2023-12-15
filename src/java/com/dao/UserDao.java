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
