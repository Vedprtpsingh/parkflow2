<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
    <c:when test="${not empty sessionScope.modelFirstName}">
        <!-- Logged-in topbar content from topbar.jsp -->
        <div class="topbar">
            <div class="topbar-contact">
                <a href="mailto:info@parkflow.com"><i class="fas fa-envelope"></i> info@parkflow.com</a>
                <a href="tel:+1234567890"><i class="fas fa-phone"></i> +123 456 7890</a>
            </div>
            <div class="topbar-auth">
                
                <span>Welcome, ${modelFirstName}!</span>
<a href="/parkflow/logout" class="logout" name="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <!-- Non-logged-in topbar content from hometopbar.jsp -->
        <div class="topbar">
            <div class="topbar-contact">
                <a href="mailto:info@parkflow.com"><i class="fas fa-envelope"></i> info@parkflow.com</a>
                <a href="tel:+1234567890"><i class="fas fa-phone"></i> +123 456 7890</a>
            </div>
            <div class="topbar-auth">
                <a href="/parkflow/login" class="login" name="login"><i class="fas fa-sign-in-alt"></i> Login</a>
                <a href="/parkflow/signup" class="signup" name="signup"><i class="fas fa-user-plus"></i> Sign Up</a>
            </div>
        </div>
    </c:otherwise>
</c:choose>
