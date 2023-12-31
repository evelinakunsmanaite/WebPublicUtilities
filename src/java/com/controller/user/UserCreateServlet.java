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
        jump("/WEB-INF/jsp/userJSP/createUser.jsp", request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstNname");
        String lastName = request.getParameter("lastNname");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String repassword = request.getParameter("repass");
        String status = request.getParameter("status");
        boolean success;
        if (!password.equals(repassword)) {
            success = false;
        } else {
            User user = new User(email, password, firstName, lastName, status);
            success = userService.create(user);
        }
        if (success) {
            request.setAttribute("status", "success");
        } else {
            request.setAttribute("status", "failed");
        }

        request.getRequestDispatcher("/WEB-INF/jsp/userJSP/createUser.jsp").forward(request, response);
    }
}
