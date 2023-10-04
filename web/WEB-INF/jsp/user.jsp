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

        <style>

            body {
                background-color: #b6d0ff;
            }

  .input-form {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 20vh;
}

.input-form label {
    font-size: 18px;
    color: white; /* Основной синий цвет */
    
}

.input-form .input-container {
    display: flex;
    align-items: center;
    justify-content: center;
}

.input-form input[type="text"] {
    padding: 10px;
    font-size: 16px;
    border: 2px solid white; /* Основной синий цвет для границы */
    border-radius: 4px;
    margin-right: 10px;
    transition: border-color 0.3s ease;
    width: 800px;
}

form {
    display: table;
    margin: 0 auto;
    margin-bottom: -35px;
    background-color: #1a2847; /* Фоновый цвет */
    padding: 20px;
    border-radius: 10px;
}

label {  
    display: block;
    font-weight: bold;
    margin-bottom: 10px;
    color: black; /* Основной синий цвет для текста */
    margin-top: -20px;
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
    padding: 10px 20px;
    background-color: #415792; /* Основной синий цвет для фона */
    color: white; /* Белый цвет для текста на кнопке */
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
p{
    font-size: 20px;
    color: white; /* Основной синий цвет */
    margin-top: 30px;
}

h1 {
    text-align: center; /* Выравнивание текста по центру */
    font-size: 40px;
    color: #1a2847;
}

        </style>

    </head>

    <body id="page-top">

        <!-- Adder -->
        <section class="page-section" id="adder">
            <div class="container">

                <h1>Получить данные</h1>
           
                <form class="input-form" action="HouseSelectServlet" method="post">
                    <input type="hidden" name="action" value="byRoomsCount">
                    <label for="value"><p>Вывести список домов с заданным количеством комнат:</p>
                        <div class="input-container">
                            <input type="text" name="value" required placeholder="Введите количество комнат">
                            <input type="submit" value="Отправить">
                        </div></label>
                </form>       

                <form class="input-form" action="HouseSelectServlet" method="post">
                    <input type="hidden" name="action" value="byFloorAndRoomsCount">
                    <label for="value"><p>Вывести домов больше заданным количеством комнат и интервалом этажей:</p>
                        <div class="input-container">
                            <input type="text" name="value" required placeholder="Введите через количество комнат и интервал этажей. Пример(количество комнат-от-до): 1-1-1">
                            <input type="submit" value="Отправить">
                        </div></label>
                </form>          

                <form class="input-form" action="HouseSelectServlet" method="post">
                    <input type="hidden" name="action" value="bySquare">
                    <label for="value"> <p >Вывести список домов где площадь больше заданной:</p>
                        <div class="input-container">
                            <input type="text" name="value" required placeholder="Введите площадь">
                            <input type="submit" value="Отправить">
                        </div></label>
                </form>     
         
                <script type="text/javascript">
                    var status = document.getElementById("status").value;
                    if (status == "failed") {
                        swal("Ошибка!", "Неверный ввод данных", "error");
                    }
                </script>
            </div>

        </div>

        <form action="index.html">
            <input type="submit" value="Выйти"/>
        </form> 

    </section>




</body>
</html>

