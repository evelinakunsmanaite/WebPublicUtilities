/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao.impl;

import com.dao.HouseDao;
import com.model.House;
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
public class HouseDaoImpl implements HouseDao{
    private final DataSource dataSource;

    public HouseDaoImpl (DataSource dataSource) {
        this.dataSource = dataSource;
    }
    
    @Override
    public Set<House> read() {
        String req = "Select * from houses";
        Set<House> houses;
        try (Connection connection = dataSource.getConnection()) {            
            try (Statement statement = connection.createStatement(); ResultSet resultSet= statement.executeQuery(req)) {
                houses = new HashSet<>();
                while (resultSet.next()) {//пока есть записи 
                    int id = resultSet.getInt("id");
                    String userEmail = resultSet.getString("user_email");
                    int apartmentNumber = resultSet.getInt("apartment_number");
                    double apartmentArea = resultSet.getDouble("apartment_area");
                    int floor = resultSet.getInt("floor");
                    int roomsCount = resultSet.getInt("rooms_count");
                    String street = resultSet.getString("street");
                    String buildingType = resultSet.getString("building_type");
                    double lifeTime = resultSet.getDouble("life_time");

                    houses.add(new House(id, userEmail, apartmentNumber, apartmentArea, floor, roomsCount, street, buildingType, lifeTime));
                }
            }
            return houses;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public int create(House house) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int update(House house) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int delete(House house) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
