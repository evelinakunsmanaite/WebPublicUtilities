<%-- 
    Document   : createUser
    Created on : 25 сент. 2023 г., 08:44:38
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
                        
                        <!-- Добавление пользователя -->

                        <div class="main">

                            <!-- Sign up form -->
                            <section class="signup">
                                <div class="container">
                                    <div class="signup-content">
                                        <div class="signup-form">

                                            <form method="post" action="UserCreateServlet" class="register-form"
                                                  id="register-form">

                                                <h2 class="form-title text-secondary">Добавить пользователя</h2>

                                                
                                                <div class="form-group">
                                                    <label for="firstNname"><i
                                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                        type="text" name="firstNname" id="firstNname"  placeholder="Введите имя" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="lastNname"><i
                                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                        type="text" name="lastNname" id="lastNname" placeholder="Введите фамилию" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="email"><i class="zmdi zmdi-email"></i></label> <input
                                                        type="email" name="email" id="email" placeholder="Введите email" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
                                                        type="password" name="pass" id="pass" placeholder="Введите пароль" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                                    <input type="password" name="re_pass" id="re_pass"
                                                           placeholder="Подтвердите пароль" />
                                                </div>

                                                <div class="form-group">
                                                    <label for="status"><i class="zmdi zmdi-account-box"></i></label>
                                                    <select name="status" id="status">
                                                        <option value="" disabled selected hidden>Выберите статус</option>
                                                        <option value="user">Пользователь</option>
                                                        <option value="admin">Администратор</option>
                                                    </select>
                                                </div>
                                                <br>
                                                <div class="form-group form-button">
                                                    <input type="submit" name="signup" id="signup"
                                                           class="form-submit" value="Зарегистрироваться" />
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </section>

                        </div>
                    </div>
                        
                </div>	
            </div>
        </section>


    </body>
</html>
