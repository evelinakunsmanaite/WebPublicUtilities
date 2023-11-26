<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <fmt:setLocale value='${pageContext.response.locale}' scope="session"/>
    <fmt:bundle basename="com.localization.messages.msg">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title><fmt:message key="addUserTitle" /></title>
            <style><%@include file="/resources/css/styleAdminShow.css"%>
                <%@include file="/resources/css/styleCreateUser.css"%>
                <%@include file="/resources/css/modal.css"%>
                <%@include file="/resources/css/model.css"%>
            </style>
    </head>
     
    <body>
        <section class="page-section" id="adder">
            <div class="container">

                <div class="row">
                    <div class="col-md-6">

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
                                                    <input type="submit" value="<fmt:message key='goToMain' />" class="form-out">
                                                </form>
                                            </th>
                                            <td rowspan="3" width="100%">

                                                <div class="form-container">

                                                    <form method="post" action="UserCreateServlet" class="register-form"
                                                          id="register-form">

                                                        <h2 class="form-title text-secondary"><fmt:message key="addUserTitle" /></h2>


                                                        <div class="form-group">
                                                            <label for="firstNname"><i
                                                                    class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                                type="text" name="firstNname" id="firstNname"  placeholder="<fmt:message key='nameLabel' />" required />
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="lastNname"><i
                                                                    class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                                type="text" name="lastNname" id="lastNname" placeholder="<fmt:message key='surnameLabel' />" required />
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="email"><i class="zmdi zmdi-email"></i></label> <input
                                                                type="email" name="email" id="email" placeholder="<fmt:message key='emailLabel' />" required />
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
                                                                type="password" name="pass" id="pass" placeholder="<fmt:message key='passwordLabel' />" required />
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="repass"><i class="zmdi zmdi-lock-outline"></i></label>
                                                            <input type="password" name="repass" id="repass"
                                                                   placeholder="<fmt:message key='confirmPasswordLabel' />" required/>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="status"><i class="zmdi zmdi-account-box"></i></label>
                                                            <select name="status" id="status" required>
                                                                <option value="" disabled selected hidden><fmt:message key='statusLabel' /></option>
                                                                <option value="user"><fmt:message key='userOption' /></option>
                                                                <option value="admin"><fmt:message key='adminOption' /></option>
                                                            </select>
                                                        </div>
                                                        <br>
                                                        <div class="form-group form-button">
                                                            <input type="submit" name="signup" id="signup"
                                                                   class="form-submit" value="<fmt:message key='registerButton' />" />
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

        <div id="myModal" class="modal">
            <div class="modal-content">
                <p></p><br>
                <img />
                <br>
                <button id="closeModal" class="close-button"><fmt:message key='modal' /></button>
            </div>
        </div>
        <script type="text/javascript">
            var modal = document.getElementById('myModal');
            var closeModalButton = document.getElementById('closeModal');
            var messageElement = document.querySelector('.modal-content p');
            var imageElement = document.querySelector('.modal-content img');
            var closeButtonElement = document.getElementById('closeModal');

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
            console.log("Status:", status); // Add this line for debugging

            if (status == "failed") {
                messageElement.innerHTML = "<span style='color: red'><fmt:message key='modalFailed' /></span>";
                modal.style.border = "2px solid red";
                modal.style.color = "red";
                imageElement.src = "resources/images/errorr.png";
                closeButtonElement.style.backgroundColor = "#cc2b2b";
                showStatusModal();
            } else if (status == "success") {
                messageElement.innerHTML = "<span style='color: green'><fmt:message key='modalSuccess' /></span>";
                modal.style.border = "2px solid green";
                modal.style.color = "green";
                imageElement.src = "resources/images/success.png";
                closeButtonElement.style.backgroundColor = "#2b8f3a";
                showStatusModal();
            }
        </script>

    </body>
</fmt:bundle>
</html>
