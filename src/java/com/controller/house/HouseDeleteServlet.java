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
         request.setAttribute("success", success ? "Данные удалены" : "Данные не удалены");
        jump("/WEB-INF/jsp/result.jsp", request, response);
    }
}
