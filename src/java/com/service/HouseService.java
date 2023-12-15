package com.service;

import com.model.House;
import java.util.List;
import java.util.Set;

public interface HouseService {

    boolean create(House house);

    Set<House> read();

    boolean update(int id, String userEmail, int apartmentNumber,
            double apartmentArea, int floor, int roomsCount, String street,
            String buildingType, double lifeTime);

    boolean delete(int id);

    List<House> getHousesByArea(double minArea);

    List<House> getHousesByRoomCount(int roomCount);

    List<House> getHousesByRoomCountAndFloorRange(int roomCount, int minFloor,
            int maxFloor);
}
