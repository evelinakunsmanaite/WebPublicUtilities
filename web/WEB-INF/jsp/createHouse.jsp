<%-- 
    Document   : createHouse
    Created on : 25 сент. 2023 г., 08:46:23
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <style><%@include file="/resources/css/adminTable.css"%></style>

    </head>
    <body>
        <section class="page-section" id="adder">
            <div class="container">

                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Добавить данные</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon">
                        <i class="fas fa-star"></i>
                    </div>
                    <div class="divider-custom-line"></div>
                </div>

                <div class="row">
 <div class="col-md-6">
                        <!-- Добавление дома -->

                        <input type="hidden" id="status" value="<%= request.getAttribute("status")%>">

                        <div class="main">

                            <section class="signup">
                                <div class="container">
                                    <div class="signup-content">
                                        <div class="signup-form">
                                            

                                            <form method="post" action="HouseCreateServlet" class="register-form"
                                                  id="register-form">
                                              
                                                <h2 class="form-title text-secondary">Добавить дом</h2>
                                                
                                                <div class="form-group">
                                                    <label for="userEmail"><i
                                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                        type="text" name="userEmail" id="userEmail" placeholder="Введите email пользователя" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="apartmentNumber"><i
                                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                        type="number" min="0" name="apartmentNumber" id="apartmentNumber" placeholder="Введите номер квартиры/дома" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="apartmentArea"><i
                                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                        type="number" step="0.01" min="0" name="apartmentArea" id="apartmentArea" placeholder="Введите площадь квартиры/дома" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="floor"><i
                                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                        type="number" min="0" name="floor" id="floor" placeholder="Введите этаж" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="roomsCount"><i
                                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                        type="number" min="0" name="roomsCount" id="roomsCount" placeholder="Введите количество комнат" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="street"><i
                                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                        type="text" name="street" id="street" placeholder="Введите улицу" />
                                                </div>

                                                <div class="form-group">
                                                    <label for="buildingType"><i class="zmdi zmdi-account-box"></i></label>
                                                    <select name="buildingType" id="buildingType">
                                                        <option value="" disabled selected hidden>Выберите тип здания</option>
                                                        <option value="Жилое здание">Жилое здание</option>
                                                        <option value="Общественное здание">Общественное здание</option>
                                                        <option value="Промышленное здание">Промышленное здание</option>
                                                        <option value="Сельскохозяйственное здание">Сельскохозяйственное здание</option>
                                                        <option value="Складское здание">Складское здание</option>
                                                    </select>
                                                </div>

                                                <div class="form-group">
                                                    <label for="lifeTime"><i
                                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                        type="number" min="0" name="lifeTime" id="lifeTime" placeholder="Введите срок эксплуатации" />
                                                </div>
<br>
                                                <div class="form-group form-button">
                                                    <input type="submit" name="signup" id="signup"
                                                           class="form-submit" value="Зарегистрировать" />
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </section>

                        </div>                              
                    </div>
                                   </div>
        </section>
    </body>
</html>
