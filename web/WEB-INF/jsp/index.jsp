<%-- 
    Document   : index
    Created on : 24 сент. 2023 г., 23:47:56
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style><%@include file="/resources/css/style.css"%></style>

    </head>
    <body>

        <div class="main">

            <!-- Sing in  Form -->
            <section class="sign-in">

                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure>
                                <img src="resources/images/signin-image.jpg" alt="sing up image">
                            </figure>

                        </div>

                        <div class="signin-form">
                            <ul class="nav-menu">
                                <li>
                                    <a href="HouseCreateServlet">
                                        <i class="fas fa-plus"></i> Добавить дом
                                    </a>
                                </li>
                                <li>
                                    <a href="UserCreateServlet">
                                        <i class="fas fa-user"></i> Добавить пользователя
                                    </a>
                                </li>
                                <li>
                                    <a href="HouseReadServlet">
                                        <i class="fas fa-home"></i> Просмотреть дом
                                    </a>
                                </li>
                                <li>
                                    <a href="UserReadServlet">
                                        <i class="fas fa-users"></i> Просмотреть пользователя
                                    </a>
                                </li>
                                <li>
                                    <a href="UserUpdateServlet">
                                        <i class="fas fa-edit"></i> Изменить данные пользователя
                                    </a>
                                </li>
                                <li>
                                    <a href="HouseUpdateServlet">
                                        <i class="fas fa-edit"></i> Изменить данные дома
                                    </a>
                                </li>
                                <li>
                                    <a href="UserDeleteServlet">
                                        <i class="fas fa-edit"></i> Удалить данные пользователя
                                    </a>
                                </li>
                                <li>
                                    <a href="HouseDeleteServlet">
                                        <i class="fas fa-edit"></i> Удалить данные дома
                                    </a>
                                </li>
                                
                                   
                    
                        <form class="logout-form" action="index.html">
            <input type="submit" value="Выйти"/>
                             </form> 
                            </ul>
                        </div>
                     
                    </div>
                
                </div>
            </section>

        </div>

    </body>
</html>
