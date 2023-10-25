/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "PageServlet", urlPatterns = {"/PageServlet"})
public class PageServlet extends HttpServlet implements Jumpable { 
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Получите значение параметра "page" из запроса
        String page = request.getParameter("page");

        if ("toAdmin".equals(page)) {
            jump("/WEB-INF/jsp/index.jsp", request, response);

        } else if ("toUser".equals(page)) {

             jump("/WEB-INF/jsp/userJSP/user.jsp", request, response);
        } 
    }
}
