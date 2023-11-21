<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <fmt:bundle basename="com.localization.messages.msg">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title><fmt:message key = "error.page"/></title>
            <style>

body {
    font-family: Arial, sans-serif;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 80vh;
    margin: 0;
    padding: 0;
}

img {
    width: 180px;
    height: 180px;
    /* add more styles as needed */
}

.error-heading {
    color: red;
    align-content: center;

}
h1{
    font-size: 40px;
color: red;
}
h1.error-heading {
    font-size: 20px;
    font-weight: bold;
}

h2.error-heading {
    font-size: 18px;
}

h3 {
    font-size: 16px;
}

form {
    margin-top: 20px;   
}

form input[type="submit"] {
    background-color: #007BFF;
    color: #fff;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    font-size: 16px;
}

            </style>
        </head>
        
        <body>
         <img src="resources/images/error.png" alt="..." />
         <h1><fmt:message key="errors"/></h1>
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

    </div>
    
    <form action="index.html">
        <input type="submit" value="<fmt:message key='logout' />" />
    </form>
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
