<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <fmt:setLocale value='${pageContext.response.locale}' scope="session"/>
    <fmt:bundle basename="com.localization.messages.msg">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title><fmt:message key="table.caption" /></title>
            <style><%@include file="/resources/css/user.css"%></style>

        </head>
        <body>
            <section class="page-section bg-primary text-white mb-0" id="finder">
                <div class="container">
                    <div class="table-responsive">
                        <table class="bordered">
                            <caption><fmt:message key="table.caption" /></caption>
                            <thead>
                                <tr>
                                    <th><fmt:message key="table.id" /></th>
                                    <th><fmt:message key="table.userEmail" /></th>
                                    <th><fmt:message key="table.apartmentNumber" /></th>
                                    <th><fmt:message key="table.apartmentArea" /></th>
                                    <th><fmt:message key="table.floor" /></th>
                                    <th><fmt:message key="table.roomsCount" /></th>
                                    <th><fmt:message key="table.street" /></th>
                                    <th><fmt:message key="table.buildingType" /></th>
                                    <th><fmt:message key="table.lifetime" /></th>
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
                        <input type="submit" value="<fmt:message key='back.button' />" class="form-out">
                    </form>
                </div>
            </section>
        </body>
    </fmt:bundle>
</html>
