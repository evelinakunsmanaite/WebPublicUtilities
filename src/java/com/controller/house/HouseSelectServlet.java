package com.controller.house;

import com.controller.InitServlet;
import com.controller.Jumpable;
import com.model.House;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author AdministratorF
 */
@WebServlet(name = "HouseSelectServlet", urlPatterns = {"/HouseSelectServlet"})
public class HouseSelectServlet extends InitServlet implements Jumpable {

    ResourceBundle bundle;
    HttpSession session;
    Locale locale;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "byRoomsCount" ->
                handleByRoomsCount(request, response);
            case "byFloorAndRoomsCount" ->
                handleByFloorAndRoomsCount(request, response);
            case "bySquare" ->
                handleBySquare(request, response);

        }
    }

    private void handleByRoomsCount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int roomCount = Integer.parseInt(request.getParameter("value"));
            List<House> houses = houseService.getHousesByRoomCount(roomCount);

            request.setAttribute("houses", houses);
            jumpOrShowResult(houses, request, response);
        } catch (NumberFormatException e) {
            session = request.getSession();
            locale = (Locale) session.getAttribute("javax.servlet.jsp.jstl.fmt.locale.session");

            bundle = ResourceBundle.getBundle("com.localization.messages.msg", locale);
            String errorMessage = bundle.getString("error.invalidRoomsCount");

            request.setAttribute("error", errorMessage);
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
            locale = (Locale) session.getAttribute("javax.servlet.jsp.jstl.fmt.locale.session");

            session = request.getSession();
            bundle = ResourceBundle.getBundle("com.localization.messages.msg", locale);
            String errorMessage = bundle.getString("error.invalidFloorAndRoomsCount");

            request.setAttribute("error", errorMessage);
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
            locale = (Locale) session.getAttribute("javax.servlet.jsp.jstl.fmt.locale.session");

            session = request.getSession();
            bundle = ResourceBundle.getBundle("com.localization.messages.msg", locale);
            String errorMessage = bundle.getString("error.invalidArea");

            request.setAttribute("error", errorMessage);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/jsp/error.jsp");
            rd.forward(request, response);
        }
    }

    private void jumpOrShowResult(List<House> houses, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        locale = (Locale) session.getAttribute("javax.servlet.jsp.jstl.fmt.locale.session");

        bundle = ResourceBundle.getBundle("com.localization.messages.msg", locale);

        if (houses.isEmpty()) {
            session = request.getSession();
            String success = bundle.getString("success.dataNull");
            request.setAttribute("success", success);
            jump("/WEB-INF/jsp/userJSP/resultToUser.jsp", request, response);
        } else {
            jump("/WEB-INF/jsp/houseJSP/showHouseToUser.jsp", request, response);
        }
    }
}
