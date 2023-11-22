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
            <title>JSP Page</title>
            <style><%@include file="/resources/css/table.css"%></style>
        </head>
        <body>
            <section class="page-section bg-primary text-white mb-0" id="finder">
                <div class="container">
                    <div class="table-responsive">
                        <table class="bordered">
                            <caption><fmt:message key="caption" /></caption>
                            <thead>
                            <th><fmt:message key="id" /></th>
                            <th><fmt:message key="email" /></th>
                            <th><fmt:message key="password" /></th>
                            <th><fmt:message key="firstName" /></th>
                            <th><fmt:message key="lastName" /></th>
                            <th><fmt:message key="status" /></th>
                            </thead>
                            <core:forEach var="user" items="${users}">
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.email}</td>
                                    <td>${user.password}</td>
                                    <td>${user.firstName}</td>
                                    <td>${user.lastName}</td>
                                    <td>${user.status}</td>
                                </tr>
                            </core:forEach>
                            </tbody>
                        </table>
                    </div>

                    <form action="PageServlet" method="post">
                        <input type="hidden" name="page" value="toAdmin">
                        <input type="submit" value="<fmt:message key="toHomepage" />" class="form-out">
                    </form>
                </div>
            </section>
        </body>
    </fmt:bundle>
</html>
