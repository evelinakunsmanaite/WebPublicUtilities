/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao.impl;

import com.model.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Set;
import javax.sql.DataSource;

/**
 *
 * @author Administrator
 */
public class UserDaoImpl {
    
       private final DataSource dataSource;

    public UserDaoImpl(DataSource dataSource) {
        this.dataSource = dataSource;
    }
    
    public Set<User> read() {
        String req = "Select * from users";
        Set<User> groups;
        try (Connection conn = dataSource.getConnection()) {            
            try (Statement statement = conn.createStatement(); ResultSet resultSet= statement.executeQuery(req)) {
                groups = new HashSet<>();
                while (resultSet.next()) {//пока есть записи 
                    int id = resultSet.getInt("id");
                    String email = resultSet.getString("email");
                    String password = resultSet.getString("password");
                    String firstName = resultSet.getString("firstName");
                    String lastName = resultSet.getString("lastName");
                    String status = resultSet.getString("status");
                    groups.add(new User( id,  email,  password,  firstName,  lastName,  status));
                }
            }
            return groups;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }
}
