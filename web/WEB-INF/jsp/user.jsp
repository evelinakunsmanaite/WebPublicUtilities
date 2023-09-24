<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
 
        <style>
        
            
    .input-form {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 20vh;
    }

    .input-form label {
      font-size: 18px;
  

    }

    .input-form .input-container {
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .input-form input[type="text"] {
      padding: 10px;
      font-size: 16px;
      border: 2px solid #ccc;
      border-radius: 4px;
      margin-right: 10px;
      transition: border-color 0.3s ease;
      width: 800px;
    }



     form {
        display: table;
        margin: 0 auto;
        margin-bottom: 20px;
        background-color: #a69cad;
        padding: 10px;
        border-radius: 10px;
    }

    label {
        display: block;
        font-weight: bold;
        margin-bottom: 10px;
        color: rgb(67, 60, 71);

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
        padding: 5px 10px;
        background-color: #7c7182;
        color: white;
        border: none;
        border-radius: 4px;
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
                    class="navbar-toggler text-uppercase font-weight-bold bg-primary rounded"
                    type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
                    aria-expanded="false" aria-label="Toggle navigation">
                    Menu <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item mx-0 mx-lg-1"><a
                                class="nav-link py-3 px-0 px-lg-3 rounded" href="#adder">Получить данные</a></li>                                   
                        <li class="nav-item mx-0 mx-lg-1"><a
                                class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Выйти</a></li>           
                    </ul>
                </div>
            </div>
        </nav>
                
        <!-- Main-->
        <header class="masthead bg-primary text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Avatar Image-->
                <img class="masthead-avatar mb-5" src="assets/img/avatar.svg"
                     alt="..." />
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-secondary mb-0">Добро пожаловать <%= session.getAttribute("name")%></h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon">
                        <i class="fas fa-star"></i>
                    </div>
                    <div class="divider-custom-line"></div>
                </div>
                <p class="masthead-subheading text-secondary mb-0">Коммунальные услуги</p>
            </div>
        </header>

    


        <!-- Adder -->
        <section class="page-section" id="adder">
            <div class="container">

                <h2
                    class="page-section-heading text-center text-uppercase text-secondary mb-0">Получить данные</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon">
                        <i class="fas fa-star"></i>
                    </div>
                    <div class="divider-custom-line"></div>
                </div>
                
                    <input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
  <form class="input-form" action="roomsCountServlet" method="post">
    <label for="value">Вывести список домов с заданным количеством комнат:
    <div class="input-container">
      <input type="text" name="value" required placeholder="Введите количество комнат">
      <input type="submit" value="Отправить">
    </div></label>
  </form>       
             
  <form class="input-form" action="floorServlet" method="post">
    <label for="value">Вывести домов больше заданным количеством комнат и интервалом этажей:
    <div class="input-container">
      <input type="text" name="value" required placeholder="Введите через количество комнат и интервал этажей. Пример(количество комнат-от-до): 1-1-1">
      <input type="submit" value="Отправить">
    </div></label>
  </form>          
                
  <form class="input-form" action="squareServlet" method="post">
    <label for="value">Вывести список домов где площадь больше заданной:
    <div class="input-container">
      <input type="text" name="value" required placeholder="Введите площадь">
      <input type="submit" value="Отправить">
    </div></label>
  </form>      
    
 <script type="text/javascript">
            var status = document.getElementById("status").value;
            if(status == "failed"){
                swal("Ошибка!","Неверный ввод данных","error");
            }
        </script>
            </div>


        </div>
    </section>




</body>
</html>

