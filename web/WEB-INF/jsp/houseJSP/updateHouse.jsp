<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <fmt:setLocale value='${pageContext.response.locale}' scope="session"/>
    <fmt:bundle basename="com.localization.messages.msg">
        <head>
            <meta charset="utf-8" />
            <meta name="viewport"
                  content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />

            <title><fmt:message key="edit.house" /></title>

            <style><%@include file="/resources/css/table.css"%>
                <%@include file="/resources/css/modal.css"%></style>

        </head>
        <body>
            <section class="page-section bg-primary text-white mb-0" id="finder">
                <div class="container">
                    <div class="table-responsive">
                        <form method="post" action="HouseUpdateServlet">
                            <table class="bordered">
                                <thead>
                                    <tr>
                                        <th><fmt:message key="userEmail" /></th>
                                        <th><fmt:message key="apartmentNumber" /></th>
                                        <th><fmt:message key="apartmentArea" /></th>
                                        <th><fmt:message key="floor" /></th>
                                        <th><fmt:message key="roomsCount" /></th>
                                        <th><fmt:message key="street" /></th>
                                        <th><fmt:message key="buildingType" /></th>
                                        <th><fmt:message key="lifetime" /></th>
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
                                                    <option value="Жилое здание" ${house.buildingType == 'Жилое здание' ? 'selected' : ''}><fmt:message key='residential_building' /></option>
                                                    <option value="Общественное здание" ${house.buildingType == 'Общественное здание' ? 'selected' : ''}><fmt:message key='public_building' /></option>
                                                    <option value="Промышленное здание" ${house.buildingType == 'Промышленное здание' ? 'selected' : ''}><fmt:message key='industrial_building' /></option>
                                                    <option value="Сельскохозяйственное здание" ${house.buildingType == 'Сельскохозяйственное здание' ? 'selected' : ''}><fmt:message key='agricultural_building' /></option>
                                                    <option value="Складское здание" ${house.buildingType == 'Складское здание' ? 'selected' : ''}><fmt:message key='warehouse_building' /></option>
                                                </select>
                                            </td>
                                            <td><input type="number" min="0" step="0.01" name="lifeTime_${house.id}" value="${house.lifetime}" required></td>

                                    <input type="hidden" name="id" value="${house.id}" required>

                                    </tr>
                                </core:forEach>
                                </tbody>
                            </table>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" value="<fmt:message key="update" />" class="form-out"/>
                            </div>
                        </form>

                        <br><br>
                        <form action="PageServlet" method="post">
                            <input type="hidden" name="page" value="toAdmin">
                            <input type="submit" value="<fmt:message key="toHomepage" />" class="form-out">
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
