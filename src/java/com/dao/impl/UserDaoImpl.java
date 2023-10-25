/*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao.impl;

import com.dao.UserDao;
import com.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
public class UserDaoImpl implements UserDao {

    private final DataSource dataSource;

    public UserDaoImpl(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public Set<User> read() {
        String req = "Select * from users";
        Set<User> users;
        try (Connection conn = dataSource.getConnection()) {
            try (Statement statement = conn.createStatement(); ResultSet resultSet = statement.executeQuery(req)) {
                users = new HashSet<>();
                while (resultSet.next()) {//пока есть записи 
                    int id = resultSet.getInt("id");
                    String email = resultSet.getString("email");
                    String password = resultSet.getString("password");
                    String firstName = resultSet.getString("first_Name");
                    String lastName = resultSet.getString("last_Name");
                    String status = resultSet.getString("status");
                    users.add(new User(id, email, password, firstName, lastName, status)); 
                }
            }
            return users;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public int create(User user) {
        try (Connection conn = dataSource.getConnection()) {//установление соединения (получение соединения)
            int id;

            String sql = "insert into users(email,password,first_name,last_name,status) values(?,?,?,?,?)";//формирование запроса добавления
            try (PreparedStatement preparedStatement = conn.prepareStatement(sql)) {//в наш подготовленный запрос передаём строку с запросом
                preparedStatement.setString(1, user.email());
                preparedStatement.setString(2, user.password());
                preparedStatement.setString(3, user.firstName());
                preparedStatement.setString(4, user.lastName());
                preparedStatement.setString(5, user.status());//переданный запрос меняем, указываем позицию ? и чем мы его занимаем, отсчёт с 1
                int affectedRows = preparedStatement.executeUpdate();//количество добавленных строчек

                if (affectedRows == 0) {// если строчки не добавлены выбрасывается исключение 
                    throw new SQLException("Creating user failed, no rows affected.");
                }
                sql = "SELECT * FROM users ORDER BY id DESC LIMIT 1;";//сортируем в обратном порядке записи(от максимального до минимального) в бд и получаем первую строчку
                try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql)) {
                    if (rs.next()) {//если результат имеет хотя бы 1у запись
                        id = rs.getInt("id"); //берём id свежесозданной строчки 
                    } else {
                        throw new SQLException("Creating user failed, no ID obtained.");
                    }
                }
            }
            return id;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return -1;
        }
    }

    @Override
    public int update(User user) {
        try (Connection conn = dataSource.getConnection()) {
            String query = "UPDATE users SET email =?, password =?, first_name =?, last_name =?, status =? WHERE id =?";
            try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                preparedStatement.setString(1, user.email());
                preparedStatement.setString(2, user.password());
                preparedStatement.setString(3, user.firstName());
                preparedStatement.setString(4, user.lastName());
                preparedStatement.setString(5, user.status());

                preparedStatement.setInt(6, user.id());
                return preparedStatement.executeUpdate();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return -1;
        }
    }

    @Override
    public int delete(User user) {
        try (Connection connection = dataSource.getConnection()) {
            String query = "delete from users where id = ?";
            try (PreparedStatement preparedStmt = connection.prepareStatement(query)) {
                preparedStmt.setInt(1, user.id());
                int result = preparedStmt.executeUpdate();
                return result;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return -1;
        }
    }
}
