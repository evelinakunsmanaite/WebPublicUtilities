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
            <!-- Masthead Avatar Image-->
            <img src="resources/images/error.png"
                 alt="..." />
            <!-- Masthead Heading-->
            <h2>${error}</h2>
            
             <!-- Error details initially hidden -->
        <div class="error-details" style="display: none;">
            <h1 class="error-heading">
                <fmt:message key="error">
                    <fmt:param value="${pageContext.exception.message}" />
                </fmt:message>
            </h1>

            <h2 class="error-heading">
                <fmt:message key="error.code">
                    <fmt:param value="${pageContext.errorData.statusCode}" />
                </fmt:message>
            </h2>

            <h3>
                <fmt:message key="error.name">
                    <fmt:param value="${pageContext.exception.getClass().getName()}" />
                    <fmt:param value="${pageContext.errorData.requestURI}" />
                </fmt:message>
            </h3>
        </div>

        <!-- Toggle button -->
        <button id="detailsToggleBtn" onclick="toggleDetails()">Подробнее</button>

        <!-- Form -->
        <form action="PageServlet" method="post">
            <input type="hidden" name="page" value="toUser">
            <input type="submit" value="<fmt:message key="toHomepage" />">
        </form>
    </div>

    <!-- JavaScript to toggle details -->
    <script>
        function toggleDetails() {
            var detailsSection = document.querySelector('.error-details');
            var toggleButton = document.getElementById('detailsToggleBtn');

            if (detailsSection.style.display === 'none') {
                detailsSection.style.display = 'block';
                toggleButton.textContent = 'Скрыть детали';
            } else {
                detailsSection.style.display = 'none';
                toggleButton.textContent = 'Подробнее';
            }
        }
    </script>

    </body>
    </fmt:bundle>
</html>
