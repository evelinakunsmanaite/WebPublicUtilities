/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller.house;

import com.controller.InitServlet;
import com.controller.Jumpable;
import com.model.House;
import java.io.IOException;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "HouseCreateServlet", urlPatterns = {"/HouseCreateServlet"})
public class HouseCreateServlet extends InitServlet implements Jumpable {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Set<String> userEmail = userService.getUserEmail();
        request.setAttribute("userEmail", userEmail);
        jump("/WEB-INF/jsp/houseJSP/createHouse.jsp", request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userEmail = request.getParameter("userEmail");

        String apartmentNumberString = request.getParameter("apartmentNumber");
        int apartmentNumber = Integer.parseInt(apartmentNumberString);

        String apartmentAreaString = request.getParameter("apartmentArea");
        double apartmentArea = Double.parseDouble(apartmentAreaString);

        String floorString = request.getParameter("floor");
        int floor = Integer.parseInt(floorString);

        String roomsCountString = request.getParameter("roomsCount");
        int roomsCount = Integer.parseInt(roomsCountString);

        String street = request.getParameter("street");

        String buildingType = request.getParameter("buildingType");

        String lifeTimeString = request.getParameter("lifeTime");
        int lifeTime = Integer.parseInt(lifeTimeString);
        
        House house = new House(userEmail, apartmentNumber, apartmentArea, floor, roomsCount, street, buildingType, lifeTime);
        boolean success = houseService.create(house);

        if (success) {
            request.setAttribute("status", "success");
        } else {
            request.setAttribute("status", "failed");
        }
        request.getRequestDispatcher("/WEB-INF/jsp/houseJSP/createHouse.jsp").forward(request, response);
    }
}
