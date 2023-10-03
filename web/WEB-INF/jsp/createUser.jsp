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
        <style><%@include file="/resources/css/styleAdminShow.css"%></style>
        <style><%@include file="/resources/css/styleCreateUser.css"%></style>
    </head>
    <body>
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
                                                <br><br>
                                                <form action="PageServlet" method="post" class="main-form">
                                                    <input type="hidden" name="page" value="toAdmin">
                                                    <input type="submit" value="Перейти на главную" class="form-out">
                                                </form>
                                            </th>
                                            <td rowspan="3" width="100%">

                                                <div class="form-container">

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
                                            </td>
                                        </tr>  
                                    </table>
                                </div>
                            </section>
                        </div>                              
                    </div>
                </div>
                                </div>

        </section>
    </body>
</html>
