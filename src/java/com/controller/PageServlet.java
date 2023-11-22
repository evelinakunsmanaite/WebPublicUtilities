package com.controller;

import java.io.IOException;
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
        String page = request.getParameter("page");

        if ("toAdmin".equals(page)) {
            jump("/WEB-INF/jsp/index.jsp", request, response);

        } else if ("toUser".equals(page)) {
            jump("/WEB-INF/jsp/userJSP/user.jsp", request, response);
        }
    }
}
