<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Business Login | ParkFlow</title>
    <link rel="stylesheet" href="../style.css" />
</head>
<body>
    <%@ include file="topbar.jsp" %>
    <%@ include file="navbar.jsp" %>

    <div class="container">
        <div class="auth-container">
            <h2 class="text-center mb-3">Business Login</h2>

            <c:if test="${not empty errorMsg}">
                <div class="message message-error">
                    <i class="fas fa-exclamation-circle"></i> ${errorMsg}
                </div>
            </c:if>

            <form action="/parkflow/businessLoginForm" method="post" id="businessLoginForm">
                <div class="input-group">
                    <i class="fas fa-envelope"></i>
                    <input type="email" name="email" placeholder="Email Address" required />
                </div>
                <div class="input-group">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="password" placeholder="Password" required />
                </div>
                <button type="submit" class="btn btn-block mt-3">
                    <i class="fas fa-sign-in-alt"></i> Log In
                </button>
            </form>

            <p class="text-center mt-3">
                Don't have a business account? <a href="businessSignup">Register here</a>
            </p>
            <p class="text-center mt-3">
                <a href="login">Back to User Login</a>
            </p>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
