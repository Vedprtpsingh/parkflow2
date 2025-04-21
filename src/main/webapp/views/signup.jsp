<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account | Your App</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="../style.css" />
</head>
<body>
    <!-- Topbar -->
    <%@ include file="topbar.jsp" %>

    <!-- Main Content -->
    <%@ include file="navbar.jsp" %>

    <div class="container">
        <div class="auth-container">
            <h2 class="text-center mb-3">Create Your Account</h2>
            
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
            
            <div class="auth-tabs">
                <div class="auth-tab" onclick="location.href='login'">Login</div>
                <div class="auth-tab active">Sign Up</div>
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
                <span>or sign up with email</span>
            </div>
            
            <form action="/parkflow/signupForm" method="post" id="signupForm">
                <input type="hidden" name="role" value="customer" />
                <div class="form-row">
                    <div class="form-col">
                        <div class="input-group">
                            <i class="fas fa-user"></i>
                            <input type="text" name="firstName" placeholder="First Name" required>
                        </div>
                    </div>
                    <div class="form-col">
                        <div class="input-group">
                            <i class="fas fa-user"></i>
                            <input type="text" name="lastName" placeholder="Last Name" required>
                        </div>
                    </div>
                </div>
                
                <div class="input-group">
                    <i class="fas fa-envelope"></i>
                    <input type="email" name="email" id="email" placeholder="Email Address" required>
                </div>
                
                <div class="input-group">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="password" id="password" placeholder="Create Password" required>
                </div>
                
                <div class="input-group">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password" required>
                </div>
                
                <div class="mt-2">
                    <label class="checkbox-container">
                        <input type="checkbox" name="terms" required>
                        <span class="checkmark"></span>
                        I agree to the <a href="/terms">Terms of Service</a> and <a href="/privacy">Privacy Policy</a>
                    </label>
                </div>
                
                <button type="submit" class="btn btn-block mt-3">
                    <i class="fas fa-user-plus"></i> Create Account
                </button>
            </form>
            
            <p class="text-center mt-3">
                Already have an account? <a href="login">Log in</a>
            </p>
            <p class="text-center mt-3">
                <a href="businessSignup">Business Sign Up</a>
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
        document.getElementById('signupForm').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const email = document.getElementById('email').value;
            let isValid = true;
            
            // Password match validation
            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Passwords do not match!');
                isValid = false;
            }
            
            // Password strength validation
            if (password.length < 8) {
                e.preventDefault();
                alert('Password must be at least 8 characters long!');
                isValid = false;
            }
            
            // Email validation
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                e.preventDefault();
                alert('Please enter a valid email address!');
                isValid = false;
            }
            
            return isValid;
        });
    </script>
</body>
</html>