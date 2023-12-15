<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <fmt:setLocale value='${pageContext.response.locale}' scope="session"/>
        <fmt:bundle basename="com.localization.messages.msg">
            <meta charset="utf-8" />
            <meta name="viewport"
                  content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />

            <style>
                <%@include file="/resources/css/table.css"%>
                <%@include file="/resources/css/modal.css"%>
            </style>
            <title><fmt:message key="edit.user" /></title>
        </head>
        <body>
            <section class="page-section bg-primary text-white mb-0" id="finder">
                <div class="container">
                    <div class="table-responsive">
                        <form method="post" action="UserUpdateServlet">
                            <table class="bordered">
                                <thead>
                                <th><fmt:message key="email" /></th>
                                <th><fmt:message key="password" /></th>
                                <th><fmt:message key="firstName" /></th>
                                <th><fmt:message key="lastName" /></th>
                                <th><fmt:message key="status" /></th>
                                </thead>
                                <core:forEach var="user" items="${users}">
                                    <tr>
                                        <td><input type="text" name="email_${user.id}" value="${user.email}" required></td>
                                        <td><input type="text" name="password_${user.id}" value="${user.password}" required></td>
                                        <td><input type="text" name="firstName_${user.id}" value="${user.firstName}" required></td>
                                        <td><input type="text" name="lastName_${user.id}" value="${user.lastName}" required></td>
                                        <td>
                                            <select name="status_${user.id}" id="status_${user.status}">
                                                <option value="user" ${user.status == 'user' ? 'selected' : ''}><fmt:message key="userOption" /></option>
                                                <option value="admin" ${user.status == 'admin' ? 'selected' : ''}><fmt:message key="adminOption" /></option>
                                            </select>
                                        </td>
                                    <input type="hidden" name="id" value="${user.id}" required>
                                    </tr>
                                </core:forEach>
                            </table>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" value="<fmt:message key="update" />" class="form-out"/>
                            </div>
                        </form>
                        <br><br>
                        <form action="PageServlet" method="post">
                            <input type="hidden" name="page" value="toAdmin">
                            <input type="submit" value="<fmt:message key="toHomepage" />"class="form-out">
                        </form>
                    </div>
                </div>
            </section>

            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="js/main.js"></script>      
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <link rel="stylesheet" href="alert/dist/sweetalert.css">
        </body>
    </fmt:bundle>
</html>