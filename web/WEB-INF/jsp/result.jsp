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
            <meta charset="UTF-8">
            <title>результат запроса</title>
            <style>
                <%@include file="/resources/css/result.css"%>
            </style>
        </head>
        <body>
            <h1>${message}</h1>
            <form action="PageServlet" method="post">
                <input type="hidden" name="page" value="toAdmin">
                <input type="submit" value="<fmt:message key="toHomepage" />">
            </form>         
        </body>
    </fmt:bundle>
</html>
