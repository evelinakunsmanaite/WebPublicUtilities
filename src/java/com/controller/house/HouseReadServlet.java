/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
@WebServlet(name = "HouseReadServlet", urlPatterns = {"/HouseReadServlet"})
public class HouseReadServlet extends InitServlet implements Jumpable {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Set<House> houses = houseService.read();

        request.setAttribute("houses", houses);

        if (houses.isEmpty()) {
            HttpSession session = request.getSession();
            Locale locale = (Locale) session.getAttribute("javax.servlet.jsp.jstl.fmt.locale.session");
            ResourceBundle bundle = ResourceBundle.getBundle("com.localization.messages.msg", locale);
            String success = "success.dataNull";
            String message = bundle.getString(success);
            request.setAttribute("message", message);
            jump("/WEB-INF/jsp/result.jsp", request, response);
        } else {
            jump("/WEB-INF/jsp/houseJSP/showHouses.jsp", request, response);
        }
    }
}
