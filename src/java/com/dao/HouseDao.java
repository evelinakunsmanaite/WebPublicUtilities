package com.dao;

import com.model.House;
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
