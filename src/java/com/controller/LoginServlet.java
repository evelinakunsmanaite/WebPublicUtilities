package com.controller;

import com.model.User;
import com.validator.LoginValidator;
import com.errors.LoginValidError;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
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

        LoginValidError errors = new LoginValidError();
        LoginValidator.validate(email, password, errors);
        RequestDispatcher rd;
        if (!errors.getErrorList().isEmpty()) {
            request.setAttribute("result", errors);
            rd = getServletContext().getRequestDispatcher("/WEB-INF/jsp/login.jsp");
            rd.forward(request, response);
            return;
        }

        User loggedInUser = userService.login(email, password);
        if (loggedInUser == null) {
            request.setAttribute("status", "failed");
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
        } else {
            if ("admin".equals(loggedInUser.getStatus())) {
                jump("/WEB-INF/jsp/index.jsp", request, response);
            } else {
                request.getSession().setAttribute("name", loggedInUser.firstName());
                request.getSession().setAttribute("lastName", loggedInUser.lastName());

                jump("/WEB-INF/jsp/userJSP/user.jsp", request, response);
            }
        }
    }
}
