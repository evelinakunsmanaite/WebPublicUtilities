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


        <title>Freelancer - Start Bootstrap Theme</title>
        <style>

            body {
                background-color: #b6d0ff;
            }

  .input-form {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 20vh;
}

.input-form label {
    font-size: 18px;
    color: white; /* Основной синий цвет */
    
}

.input-form .input-container {
    display: flex;
    align-items: center;
    justify-content: center;
}

.input-form input[type="text"] {
    padding: 10px;
        color: #1a2847;

    font-size: 16px;
    border: 2px solid white; /* Основной синий цвет для границы */
    border-radius: 4px;
    margin-right: 10px;
    transition: border-color 0.3s ease;
    width: 800px;
}

form {
    display: table;
    margin: 0 auto;
    margin-bottom: -35px;
    padding: 20px;
    border-radius: 10px;
}

label {  
    display: block;
    font-weight: bold;
    margin-bottom: 10px;
    color: black; /* Основной синий цвет для текста */
    margin-top: -20px;
}

.input-container {
    display: flex;
    align-items: center;
}

.input-container input[type="text"],
.input-container input[type="submit"] {
    margin-right: 10px;
}

input[type="text"] {
    padding: 5px;
    border: none;
    border-radius: 4px;
}

input[type="submit"] {
    padding: 10px 20px;
    background-color: #415792; /* Основной синий цвет для фона */
    color: white; /* Белый цвет для текста на кнопке */
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
p{
    font-size: 20px;
        color: #1a2847;
 /* Основной синий цвет */
    margin-top: 30px;
}

h1 {
    text-align: center; /* Выравнивание текста по центру */
    font-size: 40px;
    color: #1a2847;
}

        </style>

    </head>

    <body id="page-top">

        <!-- Adder -->
        <section class="page-section" id="adder">
            <div class="container">
                        <div class="header">
            <h2 class="header-title"><fmt:message key="welcomeMessage"><fmt:param value="${sessionScope.name}" /><fmt:param value="${sessionScope.lastName}" /></fmt:message></h2>
        </div>

                <h1><fmt:message key="getData" /></h1>
        
                <form class="input-form" action="HouseSelectServlet" method="post">
                    <input type="hidden" name="action" value="byRoomsCount">
                    <label for="value"><p><fmt:message key="roomsCountLabel" /></p>
                        <div class="input-container">
                            <input type="text" name="value" required placeholder="<fmt:message key='roomsCountPlaceholder' />">
                            <input type="submit" value="<fmt:message key='sendButton' />">
                        </div></label>
                </form>       

                <form class="input-form" action="HouseSelectServlet" method="post">
                    <input type="hidden" name="action" value="byFloorAndRoomsCount">
                    <label for="value"><p><fmt:message key="floorAndRoomsLabel" /></p>
                        <div class="input-container">
                            <input type="text" name="value" required placeholder="<fmt:message key='floorAndRoomsPlaceholder' />">
                            <input type="submit" value="<fmt:message key='sendButton' />">
                        </div></label>
                </form>          

                <form class="input-form" action="HouseSelectServlet" method="post">
                    <input type="hidden" name="action" value="bySquare">
                    <label for="value"> <p><fmt:message key="squareLabel" /></p>
                        <div class="input-container">
                            <input type="text" name="value" required placeholder="<fmt:message key='squarePlaceholder' />">
                            <input type="submit" value="<fmt:message key='sendButton' />">
                        </div></label>
                </form>     
         
                <script type="text/javascript">
                    var status = document.getElementById("status").value;
                    if (status == "failed") {
                         swal("<fmt:message key="errorMessage" />", "<fmt:message key="invalidInput" />", "error");
                    }
                </script>
            </div>
        <form action="index.html">
            <input type="submit" value="<fmt:message key="logout" />"/>
        </form> 

    </section>
</body>
</fmt:bundle>
</html>

