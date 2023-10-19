<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <%@include file="/resources/css/modal.css"%></style>
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
                            </form> <br>
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

        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close" id="closeModal">&times;</span>
                <p>Данные не зарегестрированы. Попробуйте ещё раз</p>
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
</fmt:bundle>
</html>