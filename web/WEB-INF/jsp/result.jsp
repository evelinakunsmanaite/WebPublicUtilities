<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>результат запроса</title>
         <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            text-align: center;
        }
        h1 {
            color: #007bff;
            margin-top: 270px;
        }
        form {
            margin-top: 20px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
    </head>
    <body>
        <h1>${success}</h1>
     <form action="PageServlet" method="post">
            <input type="hidden" name="page" value="toAdmin">
            <input type="submit" value="Перейти на главную">
        </form>       
    </body>
</html>
