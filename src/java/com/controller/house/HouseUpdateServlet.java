package com.controller.house;

import com.controller.InitServlet;
import com.controller.Jumpable;
import com.model.House;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.Set;
import java.util.TreeSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "HouseUpdateServlet", urlPatterns = {"/HouseUpdateServlet"})
public class HouseUpdateServlet extends InitServlet implements Jumpable {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Set<House> houses = new TreeSet<>(houseService.read());

        request.setAttribute("houses", houses);
        jump("/WEB-INF/jsp/houseJSP/updateHouse.jsp", request, response);
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

        }

        HttpSession session = request.getSession();
        Locale locale = (Locale) session.getAttribute("javax.servlet.jsp.jstl.fmt.locale.session");
ResourceBundle bundle = ResourceBundle.getBundle("com.localization.messages.msg", locale != null ? locale : Locale.getDefault());
        String successMessageKey = success ? "success.dataUpdated" : "success.dataNotUpdated";
        String message = bundle.getString(successMessageKey);
        request.setAttribute("message", message);

        jump("/WEB-INF/jsp/result.jsp", request, response);
    }
}
