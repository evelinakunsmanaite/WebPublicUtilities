<%-- 
    Document   : createHouse
    Created on : 25 сент. 2023 г., 08:46:23
    Author     : Administrator
--%>


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
            <title>JSP Page</title>
            <style><%@include file="/resources/css/styleAdminShow.css"%>
                <%@include file="/resources/css/styleCreateHouse.css"%>
                <%@include file="/resources/css/modal.css"%></style>

        </head>
        <body>
            <section class="page-section" id="adder">
                <div class="container">

                    <div class="row">
                        <div class="col-md-6">
                            <!-- Добавление дома -->

                            <div class="main">

                                <section class="signup">
                                    <div class="container">

                                        <table border="1" cellpadding="2" cellspacing="0">
                                            <tr align="center">
                                                <th colspan="1" width="50%">

                                                    <figure>
                                                        <img src="resources/images/signin-image.jpg" alt="sing up image">
                                                    </figure>
                                                    <br><br><br>
                                                    <form action="PageServlet" method="post" class="main-form">
                                                        <input type="hidden" name="page" value="toAdmin">
                                                        <input type="submit" value="<fmt:message key='go_to_main_button' />" class="form-out">
                                                    </form>
                                                </th>
                                                <td rowspan="3" width="100%">

                                                    <div class="form-container">
                                                        <form method="post" action="HouseCreateServlet" class="register-form"
                                                              id="register-form">
                                                            <h2 class="form-title text-secondary"><fmt:message key="form_title" /></h2>
                                                            <div class="form-group">
                                                                <label for="userEmail">
                                                                    <i class="zmdi zmdi-account material-icons-name"></i>
                                                                </label>
                                                                <select name="userEmail" id="userEmail" required>
                                                                    <option value="" disabled selected hidden><fmt:message key='user_email' /></option>
                                                                    <c:forEach var="user" items="${userEmail}">
                                                                        <option value="${user}">${user}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>                                                                    
                                                            <div class="form-group">
                                                                <label for="apartmentNumber"><i
                                                                        class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                                    type="number" min="0" name="apartmentNumber" id="apartmentNumber" placeholder="<fmt:message key='apartment_number' />" required/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="apartmentArea"><i
                                                                        class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                                    type="number" step="0.01" min="0" name="apartmentArea" id="apartmentArea" placeholder="<fmt:message key='apartment_area' />" required/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="floor"><i
                                                                        class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                                    type="number" min="0" name="floor" id="floor" placeholder="<fmt:message key='floor' />" required/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="roomsCount"><i
                                                                        class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                                    type="number" min="0" name="roomsCount" id="roomsCount" placeholder="<fmt:message key='rooms_count' />" required/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="street"><i
                                                                        class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                                    type="text" name="street" id="street" placeholder="<fmt:message key='street' />" required/>
                                                            </div>

                                                            <div class="form-group">
                                                                <label for="buildingType"><i class="zmdi zmdi-account-box"></i></label>
                                                                <select name="buildingType" id="buildingType" required>
                                                                    <option value="" disabled selected hidden><fmt:message key='select_building_type' /></option>
                                                                    <option value="Жилое здание"><fmt:message key='residential_building' /></option>
                                                                    <option value="Общественное здание"><fmt:message key='public_building' /></option>
                                                                    <option value="Промышленное здание"><fmt:message key='industrial_building' /></option>
                                                                    <option value="Сельскохозяйственное здание"><fmt:message key='agricultural_building' /></option>
                                                                    <option value="Складское здание"><fmt:message key='warehouse_building' /></option>
                                                                </select>
                                                            </div>

                                                            <div class="form-group">
                                                                <label for="lifeTime"><i
                                                                        class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                                    type="number" min="0" name="lifeTime" id="lifeTime" placeholder="<fmt:message key='lifetime' />" required/>
                                                            </div>
                                                            <br>
                                                            <div class="form-group form-button">
                                                                <input type="submit" name="signup" id="signup"
                                                                       class="form-submit" value="<fmt:message key='register_button' />" />
                                                            </div>
                                                            <br>
                                                        </form> 
                                                    </div>
                                                </td>
                                            </tr>  
                                        </table>
                                    </div>
                                </section>
                            </div>                              
                        </div>
                    </div>


                    <div id="myModal" class="modal">
                        <div class="modal-content">
                            <span id="closeModal" class="close">&times;</span>
                            <p></p>
                        </div>
                    </div>

                    <script type="text/javascript">
                        var modal = document.getElementById('myModal');
                        var closeModalButton = document.getElementById('closeModal');
                        var messageElement = document.querySelector('.modal-content p');

                        function showStatusModal() {
                            modal.style.display = 'block';
                        }

                        closeModalButton.onclick = function () {
                            modal.style.display = 'none';
                        }

                        window.onclick = function (event) {
                            if (event.target == modal) {
                                modal.style.display = 'none';
                            }
                        }

                        var status = '<%= request.getAttribute("status")%>';

                        if (status == "failed") {
                            messageElement.innerText = "<fmt:message key='registration_failed' />";
                            showStatusModal();
                        } else if (status == "success") {
                            messageElement.innerText = "<fmt:message key='registration_success' />";
                            showStatusModal();
                        }
                    </script>
                    </body>
                </fmt:bundle>
                </html>
