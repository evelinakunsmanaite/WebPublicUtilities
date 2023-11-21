<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "err" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
    <fmt:setLocale value='${pageContext.response.locale}' scope="session"/>
    <fmt:bundle basename="com.localization.messages.msg">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <title>Sign Up Form by Colorlib</title>

            <style><%@include file="/resources/fonts/material-icon/css/material-design-iconic-font.min.css"%>
                <%@include file="/resources/css/style.css"%>
                <%@include file="/resources/css/modal.css"%>

.modal-content {
    background-color: #fefefe;
    padding: 30px;
    border: 2px solid red; /* Change the border color to red */
    max-width: 100%;
    text-align: center;
}
p {
    color:red;
    font-size: 25px;
        margin-top: -10px;
        
}
/* Style for the inserted image */
.modal-content img {
    max-width: 50%;
    max-height: 300px;
    margin-bottom: 15px;
}

/* The Close Button */
.close-button {
    background-color: #cc2b2b;
    color: #fff;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    font-size: 18px;
    margin-top: 6px;
}

.close-button:hover,
.close-button:focus {
    background-color: #0056b3;
}


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
                                <h2 class="form-title"><fmt:message key="hello.greet" /></h2>
                                <form  action="LoginServlet" class="register-form"
                                       id="login-form">
                                    <div class="form-group">
                                        <label for="useremail">
                                        </label> <input
                                            type="email" name="useremail" id="useremail"
                                            placeholder="<fmt:message key='useremail.placeholder' />" />
                                    </div>
                                    <div class="form-group">
                                        <label for="password"></label> <input
                                            type="password" name="password" id="password"
                                            placeholder="<fmt:message key='password.placeholder' />" />
                                    </div>

                                    <div class="form-group form-button">
                                        <input type="submit" name="signin" id="signin"
                                               class="form-submit" value="<fmt:message key='login.button' />" />
                                    </div>
                                </form>
                                    <br>
                                <err:loginError />
                                
                                <table>
                                    <tr>
                                        <td>
                                            <form action="LocalServlet"> 
                                                <div class="form-group form-button">
                                                    <input type="hidden" name="locale" value="en"/>
                                                    <input class="form-submit" type="submit" value='<fmt:message key = "en" />'/>
                                                </div>
                                            </form> 
                                        </td>
                                        <td>

                                            <form action="LocalServlet"> 
                                                <div class="form-group form-button">
                                                    <input type="hidden" name="locale" value="ru"/>
                                                    <input class="form-submit"  type="submit" name="locale" value='<fmt:message key = "ru" />'/>
                                                </div>
                                            </form>
                                        </td>
                                    </tr>
                                </table> 
                            </div>
                        </div>
                    </div>
                </section>

            </div>
            <!-- HTML with the "Close" button -->

            <div id="myModal" class="modal">
                <div class="modal-content">
                    <p></p><br>
                    <img src="resources/images/errorr.png" alt="Image description">
              <br>
                <button id="closeModal" class="close-button"><fmt:message key='modal' /></button>
            </div>
        </div>

        <script type="text/javascript">
            var modal = document.getElementById('myModal');
            var closeModalButton = document.getElementById('closeModal');
            var messageElement = document.querySelector('.modal-content p');

            function showStatusModal() {
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

            var status = '<%= request.getAttribute("status")%>';

            if (status == "failed") {
                messageElement.innerText = "<fmt:message key='errorMessage' />";
                showStatusModal();
            }
        </script>

    </body>
</fmt:bundle>
</html>