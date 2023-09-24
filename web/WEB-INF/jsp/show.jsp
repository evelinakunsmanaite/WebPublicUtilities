<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Список группы</title>
    </head>
    <body>
        <table>
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
        </table>
        <form action="index.html">
            <input type="submit" value="На главную"/>
        </form>
    </body>
</html>
