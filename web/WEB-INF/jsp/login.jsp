<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign Up Form by Colorlib</title>

        <style><%@include file="/resources/fonts/material-icon/css/material-design-iconic-font.min.css"%>
            <%@include file="/resources/css/style.css"%>
            <%@include file="/resources/css/modal.css"%>


        </style>
    </head>
    <body>

        <input type="hidden" id="status" value="<%= request.getAttribute("status")%>">

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
                            <h2 class="form-title">Sign in</h2>
                            <form  action="LoginServlet" class="register-form"
                                   id="login-form">
                                <div class="form-group">
                                    <label for="useremail">
                                    </label> <input
                                        type="email" name="useremail" id="useremail"
                                        placeholder="Your email" />
                                </div>
                                <div class="form-group">
                                    <label for="password"></label> <input
                                        type="password" name="password" id="password"
                                        placeholder="Password" />
                                </div>

                                <div class="form-group form-button">
                                    <input type="submit" name="signin" id="signin"
                                           class="form-submit" value="Log in" />
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </section>

        </div>

        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close" id="closeModal">&times;</span>
                <p>Неверные данные. Пожалуйста, попробуйте еще раз.</p>
            </div>
        </div>

        <!-- JS -->

        <script type="text/javascript">
            var modal = document.getElementById('myModal');
            var closeModalButton = document.getElementById('closeModal');

            function showInvalidDataModal() {
                modal.style.display = 'block';
            }

            closeModalButton.onclick = function () {
                modal.style.display = 'none';
            }

            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = 'none';
                }
            }

            var status = document.getElementById("status").value;
            if (status == "failed") {
                showInvalidDataModal();
            }
        </script>

    </body>

</html>