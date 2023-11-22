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
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Ошибка</title>
            <title>Freelancer - Start Bootstrap Theme</title>
            <style>
                <%@include file="/resources/css/result.css"%>
            </style>
        </head>
        <body>
            <div class="container">
                <img src="resources/images/error.png" alt="..." />

                <h2><fmt:message key="error.sessionExpired.part1" /><br>
                    <fmt:message key="error.sessionExpired.part2" /></h2>

                <form action="index.html">
                    <input type="submit" value="<fmt:message key="logout" />"/>
                </form> 
            </div>
        </body>
    </fmt:bundle>
</html>
