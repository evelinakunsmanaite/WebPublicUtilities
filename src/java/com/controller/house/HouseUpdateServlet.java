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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "HouseUpdateServlet", urlPatterns = {"/HouseUpdateServlet"})
public class HouseUpdateServlet extends InitServlet implements Jumpable {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Set<House> houses = houseService.read();

        request.setAttribute("houses", houses);
        jump("/WEB-INF/jsp/updateHouse.jsp", request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idString = request.getParameter("id");
        int id = Integer.parseInt(idString);

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
        double lifeTime = Double.parseDouble(lifeTimeString);

        boolean success = houseService.update(id, userEmail, apartmentNumber, apartmentArea, floor, roomsCount, street, buildingType, lifeTime);
        request.setAttribute("success", success ? "Данные обновлены" : "Данные не обновлены");
        jump("/WEB-INF/jsp/result_1.jsp", request, response);
           }

}
