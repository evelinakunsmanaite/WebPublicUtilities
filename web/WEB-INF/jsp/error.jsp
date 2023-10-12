<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
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
            <!-- Masthead Avatar Image-->
            <img src="resources/images/error.png"
                 alt="..." />
            <!-- Masthead Heading-->
            <h2>${error}</h2>
            <form action="PageServlet" method="post">
                <input type="hidden" name="page" value="toUser">
                <input type="submit" value="Перейти на главную">
            </form>  

        </div>
    </body>
</html>
