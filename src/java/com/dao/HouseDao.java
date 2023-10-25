/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.model.House;
import java.sql.SQLException;
import java.util.Set;

/**
 *
 * @author Administrator
 */

public interface HouseDao {
    int create(House house);
    Set<House> read();
    int update(House house);
    int delete(House house);
}
