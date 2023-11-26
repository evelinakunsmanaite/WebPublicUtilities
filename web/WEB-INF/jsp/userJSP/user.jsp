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

            <title><fmt:message key = "index"/></title>
            <style>
                <%@include file="/resources/css/users.css"%>
            </style>
        </head>

        <body id="page-top">
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

