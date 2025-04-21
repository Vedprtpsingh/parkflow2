<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Forgot Password | ParkFlow</title>
    <link rel="stylesheet" href="../style.css" />
</head>
<body>
    <%@ include file="topbar.jsp" %>
    <%@ include file="navbar.jsp" %>

    <div class="container">
        <div class="auth-container">
            <h2 class="text-center mb-3">Forgot Password</h2>

            <c:if test="${not empty message}">
                <div class="message message-info">
                    ${message}
                </div>
            </c:if>

            <form action="/forgotPassword" method="post" id="forgotPasswordForm">
                <div class="input-group">
                    <i class="fas fa-envelope"></i>
                    <input type="email" name="email" placeholder="Enter your registered email" required />
                </div>
                <button type="submit" class="btn btn-primary mt-3">Send Reset Link</button>
            </form>

            <p class="text-center mt-3">
                <a href="login">Back to Login</a>
            </p>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
