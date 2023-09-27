/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

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
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends InitServlet implements Jumpable {

  @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String email = request.getParameter("useremail");
        String password = request.getParameter("password");
                User loggedInUser = userService.login(email, password);
if (loggedInUser != null) {
    if ("admin".equals(loggedInUser.getStatus())) {
        // Перенаправьте на страницу администратора
        jump("/WEB-INF/jsp/index.jsp", request, response);
    } else {
        // Перенаправьте на страницу пользователя
        
        jump("/WEB-INF/jsp/user.jsp", request, response);
    }
} else {
    // Перенаправьте на страницу с сообщением об ошибке входа
    response.sendRedirect("/loginError.jsp");
}    }
    
}
