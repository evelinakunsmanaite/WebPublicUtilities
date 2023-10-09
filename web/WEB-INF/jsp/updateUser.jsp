<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8" />
        <meta name="viewport"
              content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />


        <title>Freelancer - Start Bootstrap Theme</title>

        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
        crossorigin="anonymous"></script>

        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
              rel="stylesheet" type="text/css" />

        <link
            href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
            rel="stylesheet" type="text/css" />

        <!-- Core theme CSS (includes Bootstrap)-->
        <style><%@include file="/resources/css/table.css"%></style>

        <title>JSP Page</title>
    </head>
     <body>
        <section class="page-section bg-primary text-white mb-0" id="finder">
            <div class="container">
                <div class="table-responsive">
                    <form method="post" action="UserUpdateServlet">
                        <table class="bordered">
                            <thead>
                            <th>email</th>
                            <th>password</th>
                            <th>firstName</th>
                            <th>lastName</th>
                            <th>status</th>
                            </thead>
                            <core:forEach var="user" items="${users}">
                                <tr>
                                    <td><input type="text" name="email" value="${user.email}" required></td>
                                    <td><input type="text" name="password" value="${user.password}" required></td>
                                    <td><input type="text" name="firstName" value="${user.firstName}" required></td>
                                    <td><input type="text" name="lastName" value="${user.lastName}" required></td>
                                    <td>
                                        <select name="status" id="status_${user.status}">
                                            <option value="user" ${user.status == 'user' ? 'selected' : ''}>Пользователь</option>
                                            <option value="admin" ${user.status == 'admin' ? 'selected' : ''}>Администратор</option>
                                        </select>
                                    </td>
                                    <input type="hidden" name="id" value="${user.id}" required>
                                </tr>
                            </core:forEach>
                            </tbody>
                        </table>
                        <div class="form-group form-button">
                            <input type="submit" name="signup" id="signup" class="form-submit" value="Обновить" />
                        </div>
                    </form>
                    <form action="PageServlet" method="post">
                        <input type="hidden" name="page" value="toAdmin">
                        <input type="submit" value="Перейти на главную"class="form-out">
                    </form>
                </div>
            </div>
       
        </section>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>      


        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="alert/dist/sweetalert.css">

        <script type="text/javascript">
            var status = document.getElementById("status").value;
            if (status == "success") {
                swal("Поздравляю", "Данные успешно обновлены", "success");
            } else if (status == "failed") {
                swal("Ошибка!", "Неверный ввод данных", "error");
            }
        </script>

    </body>
</html>