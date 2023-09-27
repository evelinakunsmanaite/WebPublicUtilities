/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller.user;

import com.controller.InitServlet;
import com.controller.Jumpable;
import com.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "UserCreateServlet", urlPatterns = {"/UserCreateServlet"})
public class UserCreateServlet extends InitServlet implements Jumpable {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        jump("/WEB-INF/jsp/createUser.jsp", request, response);
    }//сработывает при нажатии на ссылку добавить 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstNname");
        String lastName = request.getParameter("lastNname");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String status = request.getParameter("status");
        User user = new User(email, password, firstName, lastName, status);

        boolean success = userService.create(user);
        request.setAttribute("success", success ? "Данные добавлены" : "Данные не добавлены");
        jump("/WEB-INF/jsp/result_1.jsp", request, response);
    }
}
