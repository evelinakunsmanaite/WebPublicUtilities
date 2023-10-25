package com.controller.user;

import com.controller.InitServlet;
import com.controller.Jumpable;
import com.model.User;
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
@WebServlet(name = "UserUpdateServlet", urlPatterns = {"/UserUpdateServlet"})
public class UserUpdateServlet extends InitServlet implements Jumpable {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Set<User> users = userService.read();
        request.setAttribute("users", users);
        jump("/WEB-INF/jsp/userJSP/updateUser.jsp", request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean success = false;
        Set<User> users = userService.read();
        for (User user : users) {
            int userId = user.getId();
            String email = request.getParameter("email_" + userId);
            String password = request.getParameter("password_" + userId);
            String firstName = request.getParameter("firstName_" + userId);
            String lastName = request.getParameter("lastName_" + userId);
            String status = request.getParameter("status_" + userId);

            success = userService.update(userId, email, password, firstName, lastName, status);

        }
        HttpSession session = request.getSession();
        Locale locale = (Locale) session.getAttribute("javax.servlet.jsp.jstl.fmt.locale.session");
        ResourceBundle bundle = ResourceBundle.getBundle("com.localization.messages.msg", locale);
        String successMessageKey = success ? "success.dataUpdated" : "success.dataNotUpdated";
        String message = bundle.getString(successMessageKey);
        request.setAttribute("message", message);
        jump("/WEB-INF/jsp/result.jsp", request, response);

    }
}
