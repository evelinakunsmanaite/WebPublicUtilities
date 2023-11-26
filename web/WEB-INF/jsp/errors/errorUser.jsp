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
            <title><fmt:message key = "error.page"/></title>
            <style>
                <%@include file="/resources/css/result.css"%>
            </style>
        </head>
        <body>
            <div class="container">
                <img src="resources/images/error.png"
                     alt="..." />

                <h2>${error}</h2>

                <form action="PageServlet" method="post">
                    <input type="hidden" name="page" value="toUser">
                    <input type="submit" value="<fmt:message key="toHomepage" />">
                </form>
            </div>
        </body>
    </fmt:bundle>
</html>
