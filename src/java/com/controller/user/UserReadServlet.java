package com.controller.user;

import com.controller.InitServlet;
import com.controller.Jumpable;
import com.model.User;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.Set;
import java.util.TreeSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "UserReadServlet", urlPatterns = {"/UserReadServlet"})
public class UserReadServlet extends InitServlet implements Jumpable {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Set<User> users = new TreeSet<>(userService.read());
        request.setAttribute("users", users);

        if (users.isEmpty()) {
            HttpSession session = request.getSession();
            Locale locale = (Locale) session.getAttribute("javax.servlet.jsp.jstl.fmt.locale.session");
            ResourceBundle bundle = ResourceBundle.getBundle("com.localization.messages.msg", locale);
            String success = "success.dataNull";
            String message = bundle.getString(success);
            request.setAttribute("message", message);
            jump("/WEB-INF/jsp/result.jsp", request, response);
        } else {
            jump("/WEB-INF/jsp/userJSP/showUsers.jsp", request, response);
        }
    }
}
