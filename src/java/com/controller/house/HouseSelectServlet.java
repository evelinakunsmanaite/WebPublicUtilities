/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller.house;

import com.controller.InitServlet;
import com.controller.Jumpable;
import com.model.House;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author AdministratorF
 */
@WebServlet(name = "HouseSelectServlet", urlPatterns = {"/HouseSelectServlet"})
public class HouseSelectServlet extends InitServlet implements Jumpable {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("byRoomsCount".equals(action)) {
            // количество комнат
            int roomCount = Integer.parseInt(request.getParameter("value"));
            List<House> houses = houseService.getHousesByRoomCount(roomCount);

            request.setAttribute("houses", houses);
            jump("/WEB-INF/jsp/showHouseToUser.jsp", request, response);
            
        } else if ("byFloorAndRoomsCount".equals(action)) {
            // этаж и количество комнат
            String[] values = request.getParameter("value").split("-");
            if (values.length == 3) {
                int roomCount = Integer.parseInt(values[0]);
                int minFloor = Integer.parseInt(values[1]);
                int maxFloor = Integer.parseInt(values[2]);
                List<House> houses = houseService.getHousesByRoomCountAndFloorRange(roomCount, minFloor, maxFloor);

                request.setAttribute("houses", houses);
                jump("/WEB-INF/jsp/showHouseToUser.jsp", request, response);
                
            } else {
                // Обработка неправильного формата ввода пользователем
                response.sendRedirect("/errorPage.jsp");
            }
        } else if ("bySquare".equals(action)) {
            // площадь
            double minArea = Double.parseDouble(request.getParameter("value"));
            List<House> houses = houseService.getHousesByArea(minArea);
            // Обработка полученных домов, например, передача их на JSP для отображения
            request.setAttribute("houses", houses);
            jump("/WEB-INF/jsp/showHouseToUser.jsp", request, response);
        } else {
            // Обработка неподдерживаемого действия
            response.sendRedirect("/errorPage.jsp");
        }

        // Далее, выполните необходимую логику для каждого случая и отправьте ответ
    }
}
