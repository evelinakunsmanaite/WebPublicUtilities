<%-- 
    Document   : showHouse
    Created on : 25 сент. 2023 г., 00:20:36
    Author     : Administrator
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <style><%@include file="/resources/css/table.css"%></style>
    </head>
    <body>
        <section class="page-section bg-primary text-white mb-0" id="finder">
            <div class="container">
                <div class="table-responsive">
                    <table class="bordered">
                        <caption>Данные пользователей</caption>

                        <thead>
                        <th>id</th>
                        <th>email</th>
                        <th>password</th>
                        <th>firstName</th>
                        <th>lastName</th>
                        <th>status</th>
                        </thead>
                        <core:forEach var="user" items="${users}">
                            <tr>
                                <td>${user.id}</td>
                                <td>${user.email}</td>
                                <td>${user.password}</td>
                                <td>${user.firstName}</td>
                                <td>${user.lastName}</td>
                                <td>${user.status}</td>

                            </tr>
                        </core:forEach>
                        </tbody>
                    </table>
                </div>
              
                <form action="PageServlet" method="post">
            <input type="hidden" name="page" value="toAdmin">
            <input type="submit" value="Перейти на главную" class="form-out">
        </form>
            </div>
        </section>
    </body>
</html>
