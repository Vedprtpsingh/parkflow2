<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Your App</title>
    <link rel="stylesheet" href="../style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>
<body>
    <!-- Topbar -->
        <!-- Top Bar -->
        <%@ include file="topbar.jsp" %>
        <%@ include file="navbar.jsp" %>

    <div class="container">
        <div class="auth-container">
            <h2 class="text-center mb-3">    Welcome Back    </h2>
            
            <c:if test="${not empty error}">
                <div class="message message-error">
                    <i class="fas fa-exclamation-circle"></i> ${error}
                </div>
            </c:if>
            
            <c:if test="${not empty success}">
                <div class="message message-success">
                    <i class="fas fa-check-circle"></i> ${success}
                </div>
            </c:if>
            
            <c:if test="${not empty param.logout}">
                <div class="message message-info">
                    <i class="fas fa-info-circle"></i> You have been successfully logged out.
                </div>
            </c:if>
            
            <div class="auth-tabs">
                <div class="auth-tab active">Login</div>
                <div class="auth-tab" onclick="location.href='signup'">Sign Up</div>
            </div>
            
            <div class="social-auth">
                <a href="<c:url value='/oauth2/authorization/google' />" class="social-btn">
                    <i class="fab fa-google" style="color: #DB4437;"></i>
                    <span>Google</span>
                </a>
                <a href="<c:url value='/oauth2/authorization/facebook' />" class="social-btn">
                    <i class="fab fa-facebook-f" style="color: #4267B2;"></i>
                    <span>Facebook</span>
                </a>
            </div>
            
            <div class="divider">
                <span>or login with email</span>
            </div>
            <form action="/parkflow/customerLoginForm" method="post" id="loginForm">
                <div class="input-group">
                    <i class="fas fa-envelope"></i>
                    <input type="email" name="email" id="email" placeholder="Email Address" required>
                </div>
                
                <div class="input-group">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="password" id="password" placeholder="Password" required>
                </div>
                
                <div class="form-row mt-2">
                    <div class="form-col">
                        <label class="checkbox-container">
                            <input type="checkbox" name="remember-me">
                            <span class="checkmark"></span>
                            Remember me
                        </label>
                    </div>
                    <div class="form-col text-right">
                        <a href="forgotpassword" class="forgot-link">Forgot Password?</a>
                    </div>
                </div>
                
                <button type="submit" class="btn btn-block mt-3">
                    <i class="fas fa-sign-in-alt"></i> Log In
                </button>
            </form>
            
            <p class="text-center mt-3">
                Don't have an account yet? <a href="signup">Create an account</a>
            </p>
            <p class="text-center mt-3">
                <a href="businessLogin">Business Login</a>
            </p>
        </div>
    </div>
    
    <!-- Footer -->
    <%@ include file="footer.jsp" %>

    <script>
        // Navigation toggle
        document.getElementById('navToggle').addEventListener('click', function() {
            document.getElementById('navLinks').classList.toggle('show');
        });
        
        // Form validation
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            let isValid = true;
            
            // Email validation
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                e.preventDefault();
                alert('Please enter a valid email address!');
                isValid = false;
            }
            
            // Password field validation
            if (password.trim() === '') {
                e.preventDefault();
                alert('Please enter your password!');
                isValid = false;
            }
            
            return isValid;
        });
    </script>
</body>
</html>