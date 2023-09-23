<%-- 
    Document   : update
    Created on : 15 мая 2023 г., 05:26:29
    Author     : Administrator
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.sql.*"%>

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

        <c:url var="css" value="/css/index-styles.css"></c:url>
        <link rel="stylesheet" href="${css}" type="text/css"/>

        <c:url var="css" value="/css/index-styles.css"></c:url>
        <link rel="stylesheet" href="${css}" type="text/css"/>



        <title>JSP Page</title>
        <style>
            .table {
                margin-left: auto;
                margin-right: auto;
                margin-top: 250px;
                width: 70%;
                border: none;
                margin-bottom: 20px;
                border-collapse: separate;
            }

            .table thead th {
                font-weight: bold;
                text-align: left;
                border: none;
                padding: 10px 15px;
                background: #7c7182;
                font-size: 14px;
                border-top: 1px solid #ddd;
            }

            .table tr th:first-child,
            .table tr td:first-child {
                border-left: 1px solid #ddd;
            }

            .table tr th:last-child,
            .table tr td:last-child {
                border-right: 1px solid #ddd;
            }

            .table thead tr th:first-child {
                border-radius: 20px 0 0 0;
            }

            .table thead tr th:last-child {
                border-radius: 0 20px 0 0;
            }

            .table tbody td {
                text-align: left;
                border: none;
                padding: 10px 15px;
                font-size: 12px;
                vertical-align: top;
            }

            .table tbody tr:nth-child(even) {
                background: #a69cad;
            }

            .table tbody tr:nth-child(odd) {
                background: #bdb1c4;
            }

            .table tbody tr:last-child td {
                border-bottom: 1px solid #ddd;
            }

            .table tbody tr:last-child td:first-child {
                border-radius: 0 0 0 20px;
            }

            .table tbody tr:last-child td:last-child {
                border-radius: 0 0 20px 0;
            }

            .form-group input[type="submit"] {
                background-color: rgb(67, 60, 71);
                color: white;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                cursor: pointer;
            }
        </style>


    </head>
    <body id="page-top">




        <!-- Navigation-->
        <nav
            class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
            id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#page-top"><%= session.getAttribute("status")%></a>
                <button
                    class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
                    type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
                    aria-expanded="false" aria-label="Toggle navigation">
                    Menu <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">

                        <li class="nav-item mx-0 mx-lg-1"><a
                                class="nav-link py-3 px-0 px-lg-3 rounded" href="admin.jsp">Выйти</a></li>           
                    </ul>
                </div>
            </div>
        </nav>


        <input type="hidden" id="status" value="<%= request.getAttribute("status")%>">

        <form method="post" action="updateServlet">

            <table id="housesTable" class="table">
                <thead>
                    <tr>
                        <th>Email пользователя</th>
                        <th>Номер квартиры/дома</th>
                        <th>Площадь квартиры/дома</th>
                        <th>Этаж</th>
                        <th>Число комнат</th>
                        <th>Улица</th>
                        <th>Тип здания</th>
                        <th>Срок эксплуатации</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String idString = request.getParameter("id");
                        int id = Integer.parseInt(idString);
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/publicutilities?useSSL=false", "root", "evelina2002");
                            PreparedStatement pst = con.prepareStatement("SELECT * FROM houses WHERE id =?");
                            pst.setInt(1, id);
                            ResultSet rs = pst.executeQuery();
                            while (rs.next()) {
                    %>
                    <tr>

                        <td><input type="text" name="userEmail" value="<%= rs.getString(2)%>" required></td>
                        <td><input type="number" min="0" name="apartmentNumber" value="<%= rs.getString(3)%>" required></td>
                        <td><input type="number" min="0" step="0.01" name="apartmentArea" value="<%= rs.getString(4)%>" required></td>
                        <td><input type="number" min="0" name="floor" value="<%= rs.getString(5)%>" required></td>
                        <td><input type="number" min="0" name="roomsCount" value="<%= rs.getString(6)%>" required></td>
                        <td><input type="text" name="street" value="<%= rs.getString(7)%>" required></td>
                        <td><select name="buildingType" id="buildingType">
                                <option value="Жилое здание">Жилое здание</option>
                                <option value="Общественное здание">Общественное здание</option>
                                <option value="Промышленное здание">Промышленное здание</option>
                                <option value="Сельскохозяйственное здание">Сельскохозяйственное здание</option>
                                <option value="Складское здание">Складское здание</option>
                            </select></td>
                        <td><input type="number" min="0" step="0.01" name="lifeTime" value="<%= rs.getString(9)%>" required>
                            <input type="hidden" name="id" value="<%= rs.getInt(1)%>" required></td>

                    </tr>


                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
            <div class="form-group form-button">
                <input type="submit" name="signup" id="signup"
                       class="form-submit" value="Обновить" />
            </div>

        </form>
    </div></section>

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
