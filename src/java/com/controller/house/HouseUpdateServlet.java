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
          boolean success = false;
    Set<House> houses = houseService.read();
    for (House house : houses) {
        int houseId = house.getId();
        String userEmail = request.getParameter("userEmail_" + houseId);
        int apartmentNumber = Integer.parseInt(request.getParameter("apartmentNumber_" + houseId));
        double apartmentArea = Double.parseDouble(request.getParameter("apartmentArea_" + houseId));
        int floor = Integer.parseInt(request.getParameter("floor_" + houseId));
        int roomsCount = Integer.parseInt(request.getParameter("roomsCount_" + houseId));
        String street = request.getParameter("street_" + houseId);
        String buildingType = request.getParameter("buildingType_" + houseId);
        double lifeTime = Double.parseDouble(request.getParameter("lifeTime_" + houseId));

       success = houseService.update(houseId, userEmail, apartmentNumber, apartmentArea, floor, roomsCount, street, buildingType, lifeTime);
        // Вы можете выполнить какие-либо дополнительные действия здесь, в зависимости от результатов обновления
    }
        request.setAttribute("success", success ? "Данные обновлены" : "Данные не обновлены");
        jump("/WEB-INF/jsp/result_1.jsp", request, response);
           }

}
