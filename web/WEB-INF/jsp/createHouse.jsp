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
        <style><%@include file="/resources/css/styleAdminShow.css"%></style>
        <style><%@include file="/resources/css/styleCreateHouse.css"%></style>

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
                                                    <input type="submit" value="Перейти на главную" class="form-out">
                                                </form>
                                            </th>
                                            <td rowspan="3" width="100%">

                                                <div class="form-container">
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
        </section>
    </body>
</html>
