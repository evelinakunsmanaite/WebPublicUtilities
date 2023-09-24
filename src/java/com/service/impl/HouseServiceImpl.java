package com.service.impl;

import com.dao.HouseDao;
import com.model.House;
import java.util.Set;
import static java.util.stream.Collectors.toSet;
import com.service.HouseService;

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
    public boolean update(int id, String userEmail, int apartmentNumber, double apartmentArea, int floor, int roomsCount, String street, String buildingType, double lifeTime) {
    	 House updatedHouse= new House(id, userEmail, apartmentNumber, apartmentArea, floor, roomsCount, street, buildingType,lifeTime);
    return dao.update(updatedHouse) > 0;
    }

    @Override
    public boolean delete(int id) {
    	House house = new House(id);
        return dao.delete(house) > 0;
    }

    @Override
    public House getById(int id) {
        return dao.read().stream().filter(house -> id == house.getId())
                .collect(toSet()).iterator().next();
    }    


}
