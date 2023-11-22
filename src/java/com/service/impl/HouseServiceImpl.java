package com.service.impl;

import com.dao.HouseDao;
import com.model.House;
import java.util.Set;
import com.service.HouseService;
import java.util.List;
import java.util.stream.Collectors;

public class HouseServiceImpl implements HouseService {

    HouseDao dao;

    public HouseServiceImpl(HouseDao dao) {
        this.dao = dao;
    }

    @Override
    public boolean create(House house) {
        return dao.create(house) > 0;
    }

    @Override
    public Set<House> read() {
        return dao.read();
    }

    @Override
    public boolean update(int id, String userEmail, int apartmentNumber,
            double apartmentArea, int floor, int roomsCount, String street,
            String buildingType, double lifeTime) {
        House updatedHouse = new House(id, userEmail, apartmentNumber,
                apartmentArea, floor, roomsCount, street, buildingType,
                lifeTime);
        return dao.update(updatedHouse) > 0;
    }

    @Override
    public boolean delete(int id) {
        House house = new House(id);
        return dao.delete(house) > 0;
    }

    @Override
    public List<House> getHousesByArea(double minArea) {
        return dao.read().stream()
                .filter(house -> house.apartmentArea() > minArea)
                .collect(Collectors.toList());
    }

    @Override
    public List<House> getHousesByRoomCount(int roomCount) {
        return dao.read().stream()
                .filter(house -> house.roomsCount() == roomCount)
                .collect(Collectors.toList());
    }

    @Override
    public List<House> getHousesByRoomCountAndFloorRange(int roomCount, int minFloor, int maxFloor) {
        return dao.read().stream()
                .filter(house -> house.roomsCount() == roomCount)
                .filter(house -> house.floor() >= minFloor && house.getFloor() <= maxFloor)
                .collect(Collectors.toList());
    }
}
