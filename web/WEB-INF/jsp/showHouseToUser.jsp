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
        <style><%@include file="/resources/css/user.css"%></style>

</head>
<body>
<section class="page-section bg-primary text-white mb-0" id="finder">
    <div class="container">
        <div class="table-responsive">
            <table class="bordered">
                <caption>Данные домов</caption>
                <thead>
                <tr>
                    <th>id</th>
                    <th>Email пользователя</th>
                    <th>Номер квартиры/дома</th>
                    <th>Площадь квартиры/дома</th>
                    <th>Этаж</th>
                    <th>Число комнат</th>
                    <th>Улица</th>
                    <th>Тип здания</th>
                    <th>Срок эксплуатации</th>
                </tr>
                </thead>
                <tbody>
                <core:forEach var="house" items="${houses}">
                    <tr>
                        <td>${house.id}</td>
                        <td>${house.userEmail}</td>
                        <td>${house.apartmentNumber}</td>
                        <td>${house.apartmentArea}</td>
                        <td>${house.floor}</td>
                        <td>${house.roomsCount}</td>
                        <td>${house.street}</td>
                        <td>${house.buildingType}</td>
                        <td>${house.lifetime}</td>
                    </tr>
                </core:forEach>
                </tbody>
            </table>
        </div>
        <form action="PageServlet" method="post">
            <input type="hidden" name="page" value="toUser">
            <input type="submit" value="Перейти на главную" class="form-out">
        </form>
    </div>
</section>
</body>
</html>
