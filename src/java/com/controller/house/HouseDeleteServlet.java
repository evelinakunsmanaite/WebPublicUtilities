package com.controller.house;

import com.controller.InitServlet;
import com.controller.Jumpable;
import com.model.House;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "HouseDeleteServlet", urlPatterns = {"/HouseDeleteServlet"})
public class HouseDeleteServlet extends InitServlet implements Jumpable {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Set<House> houses = houseService.read();
        request.setAttribute("houses", houses);
        jump("/WEB-INF/jsp/houseJSP/deleteHouse.jsp", request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);
        boolean success = houseService.delete(id);

        HttpSession session = request.getSession();
        Locale locale = (Locale) session.getAttribute("javax.servlet.jsp.jstl.fmt.locale.session");
        ResourceBundle bundle = ResourceBundle.getBundle("com.localization.messages.msg", locale);
        String successMessageKey = success ? "success.dataDeleted" : "success.dataNotDeleted";
        String message = bundle.getString(successMessageKey);
        request.setAttribute("message", message);
        jump("/WEB-INF/jsp/result.jsp", request, response);
    }
}
