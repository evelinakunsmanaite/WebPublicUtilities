/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

/**
 *
 * @author Administrator
 */
public record House (int id, String userEmail, int apartmentNumber, double apartmentArea, int floor, int roomsCount, String street, String buildingType, double lifetime) {
public House(int id) {
this(id, null, 0, 0.0, 0, 0, null, null, 0.0);
}
public House(String userEmail, int apartmentNumber, double apartmentArea, int floor, int roomsCount, String street, String buildingType, double lifetime) {
this(0, userEmail, apartmentNumber, apartmentArea, floor, roomsCount, street, buildingType, lifetime);
}
     public int getId() {
        return id;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public int getApartmentNumber() {
        return apartmentNumber;
    }

    public double getApartmentArea() {
        return apartmentArea;
    }

    public int getFloor() {
        return floor;
    }

    public int getRoomsCount() {
        return roomsCount;
    }

    public String getStreet() {
        return street;
    }

    public String getBuildingType() {
        return buildingType;
    }

    public double getLifetime() {
        return lifetime;
    }

}; 
