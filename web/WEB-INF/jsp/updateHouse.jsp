<%-- 
    Document   : updateHouse
    Created on : 25 сент. 2023 г., 13:53:06
    Author     : Administrator
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8" />
        <meta name="viewport"
              content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />


        <title>Freelancer - Start Bootstrap Theme</title>

        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
        crossorigin="anonymous"></script>

        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
              rel="stylesheet" type="text/css" />

        <link
            href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
            rel="stylesheet" type="text/css" />

        <!-- Core theme CSS (includes Bootstrap)-->

        <style><%@include file="/resources/css/table.css"%>
            <%@include file="/resources/css/modal.css"%>

        </style>


        <title>JSP Page</title>

    </head>
    <body>
        <section class="page-section bg-primary text-white mb-0" id="finder">
            <div class="container">
                <div class="table-responsive">
                    <form method="post" action="HouseUpdateServlet">
                        <table class="bordered">
                            <thead>
                                <tr>
                                    <th>Email пользователя</th>
                                    <th>Номер квартиры/дома</th>
                                    <th>Площадь квартиры/дома</th>
                                    <th>Этаж</th>
                                    <th>Число комнат</th>
                                    <th>Улица</th>
                                    <th>Тип здания</th>
                                    <th>Срок эксплуатации</th>
                                    <th>Действие</th>
                                </tr>
                            </thead>
                            <tbody>
                                <core:forEach var="house" items="${houses}">
                                    <tr>
                                        <td><input type="text" name="userEmail_${house.id}" value="${house.userEmail}" required></td>
                                        <td><input type="number" min="0" name="apartmentNumber_${house.id}" value="${house.apartmentNumber}" required></td>
                                        <td><input type="number" min="0" step="0.01" name="apartmentArea_${house.id}" value="${house.apartmentArea}" required></td>
                                        <td><input type="number" min="0" name="floor_${house.id}" value="${house.floor}" required></td>
                                        <td><input type="number" min="0" name="roomsCount_${house.id}" value="${house.roomsCount}" required></td>
                                        <td><input type="text" name="street_${house.id}" value="${house.street}" required></td>
                                        <td>
                                            <select name="buildingType_${house.id}" id="buildingType_${house.id}">
                                                <option value="Жилое здание" ${house.buildingType == 'Жилое здание' ? 'selected' : ''}>Жилое здание</option>
                                                <option value="Общественное здание" ${house.buildingType == 'Общественное здание' ? 'selected' : ''}>Общественное здание</option>
                                                <option value="Промышленное здание" ${house.buildingType == 'Промышленное здание' ? 'selected' : ''}>Промышленное здание</option>
                                                <option value="Сельскохозяйственное здание" ${house.buildingType == 'Сельскохозяйственное здание' ? 'selected' : ''}>Сельскохозяйственное здание</option>
                                                <option value="Складское здание" ${house.buildingType == 'Складское здание' ? 'selected' : ''}>Складское здание</option>
                                            </select>
                                        </td>
                                        <td><input type="number" min="0" step="0.01" name="lifeTime_${house.id}" value="${house.lifetime}" required></td>
                                        <td>
                                            <button type="submit" name="id" value="${house.id}" class="form-submit">Обновить</button>
                                        </td>
                                    </tr>
                                </core:forEach>
                            </tbody>
                        </table>
                        <div class="form-group form-button">
                            <input type="submit" name="signup" id="signup" value="Обновить" class="form-out"/>
                        </div>
                    </form>

                    <br><br>
                    <form action="PageServlet" method="post">
                        <input type="hidden" name="page" value="toAdmin">
                        <input type="submit" value="Перейти на главную" class="form-out">
                    </form>
                </div>
            </div>
        </section>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>      


        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="alert/dist/sweetalert.css">

    </script>

</body>
</html>
