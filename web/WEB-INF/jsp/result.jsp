<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <h1>${success}</h1>
        <form action="PageServlet" method="post">
            <input type="hidden" name="page" value="toAdmin">
            <input type="submit" value="Перейти на главную">
        </form>       
    </body>
     </fmt:bundle>
</html>
