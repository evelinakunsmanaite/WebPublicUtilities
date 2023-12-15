<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <fmt:setLocale value='${pageContext.response.locale}' scope="session"/>

    <fmt:bundle basename="com.localization.messages.msg">

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title><fmt:message key = "index"/></title>
            <style><%@include file="/resources/css/style.css"%></style>

        </head>
        <body>
            <div class="main">
                <section class="sign-in">
                    <div class="container">
                        <div class="signin-content">
                            <div class="signin-image">
                                <figure>
                                    <img src="resources/images/signin-image.jpg" alt="sing up image">
                                </figure>
                            </div>

                            <div class="signin-form">
                                <ul class="nav-menu">
                                    <li>
                                        <a href="HouseCreateServlet">
                                            <i class="fas fa-plus"></i> <fmt:message key="add.house" />
                                        </a>
                                    </li>
                                    <li>
                                        <a href="UserCreateServlet">
                                            <i class="fas fa-user"></i> <fmt:message key="add.user" />
                                        </a>
                                    </li>
                                    <li>
                                        <a href="HouseReadServlet">
                                            <i class="fas fa-home"></i> <fmt:message key="view.house" />
                                        </a>
                                    </li>
                                    <li>
                                        <a href="UserReadServlet">
                                            <i class="fas fa-users"></i> <fmt:message key="view.user" />
                                        </a>
                                    </li>
                                    <li>
                                        <a href="HouseUpdateServlet">
                                            <i class="fas fa-edit"></i> <fmt:message key="edit.house" />
                                        </a>
                                    </li>
                                    <li>
                                        <a href="UserUpdateServlet">
                                            <i class="fas fa-edit"></i> <fmt:message key="edit.user" />
                                        </a>
                                    </li>
                                    <li>
                                        <a href="HouseDeleteServlet">
                                            <i class="fas fa-edit"></i> <fmt:message key="delete.house" />
                                        </a>
                                    </li>
                                    <li>
                                        <a href="UserDeleteServlet">
                                            <i class="fas fa-edit"></i> <fmt:message key="delete.user" />
                                        </a>
                                    </li>

                                    <form class="logout-form" action="index.html">
                                        <input type="submit" value="<fmt:message key="logout" />"/>
                                    </form> 
                                </ul>
                            </div>

                        </div>

                    </div>
                </section>
            </div>
        </body>
    </fmt:bundle>
</html>
