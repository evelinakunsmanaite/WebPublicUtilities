
package com.controller.house;

import com.controller.InitServlet;
import com.controller.Jumpable;
import com.model.House;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
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

        switch (action) {
            case "byRoomsCount":
                handleByRoomsCount(request, response);
                break;
            case "byFloorAndRoomsCount":
                handleByFloorAndRoomsCount(request, response);
                break;
            case "bySquare":
                handleBySquare(request, response);
                break;
            
        }
    }

private void handleByRoomsCount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
        int roomCount = Integer.parseInt(request.getParameter("value"));
        List<House> houses = houseService.getHousesByRoomCount(roomCount);

        request.setAttribute("houses", houses);
        jumpOrShowResult(houses, request, response);
    } catch (NumberFormatException e) {
        request.setAttribute("error", "Неправильный формат числа для количества комнат");
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/jsp/error.jsp");
        rd.forward(request, response);
    }
}

private void handleByFloorAndRoomsCount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String[] values = request.getParameter("value").split("-");
    
    if (values.length == 3) {
  
            int roomCount = Integer.parseInt(values[0]);
            int minFloor = Integer.parseInt(values[1]);
            int maxFloor = Integer.parseInt(values[2]);
            
            List<House> houses = houseService.getHousesByRoomCountAndFloorRange(roomCount, minFloor, maxFloor);

            request.setAttribute("houses", houses);
            jumpOrShowResult(houses, request, response);
     
    } else {
        request.setAttribute("error", "Неправильный формат ввода для этажей и комнат");
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/jsp/error.jsp");
        rd.forward(request, response);
    }
}


private void handleBySquare(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
        double minArea = Double.parseDouble(request.getParameter("value"));
        List<House> houses = houseService.getHousesByArea(minArea);

        request.setAttribute("houses", houses);
        jumpOrShowResult(houses, request, response);
    } catch (NumberFormatException e) {
        request.setAttribute("error", "Неправильный формат числа для площади");
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/jsp/error.jsp");
        rd.forward(request, response);
    }
}


    private void jumpOrShowResult(List<House> houses, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (houses.isEmpty()) {
            String success = "Данные отсутствуют";
            request.setAttribute("success", success);
            jump("/WEB-INF/jsp/resultToUser.jsp", request, response);
        } else {
            jump("/WEB-INF/jsp/showHouseToUser.jsp", request, response);
        }
    }
}
