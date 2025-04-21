<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
    <c:when test="${not empty sessionScope.modelFirstName}">
        <!-- Logged-in navbar content from navbar.jsp -->
        <nav class="navbar">
            <a href="/parkflow" class="logo">
                <img src="../image/logo.jpeg" alt="ParkFlow Logo"> ParkFlow
            </a>
            <button class="nav-toggle" id="navToggle">
                <i class="fas fa-bars"></i>
            </button>
            <ul class="nav-links" id="navLinks">
                <li><a href="/parkflow" class="active"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="/parkflow/addVehicle"><i class="fas fa-plus-circle"></i> Add Vehicle</a></li>
                <li><a href="/parkflow/parkVehicle"><i class="fas fa-parking"></i> Park Vehicle</a></li>
                <li><a href="/parkflow/viewParkedVehicles"><i class="fas fa-car"></i> View Vehicles</a></li>
                <li><a href="/parkflow/map"><i class="fas fa-map-marker-alt"></i> Map</a></li>
                <li class="dropdown">
                    <a href="#"><i class="fas fa-info-circle"></i> About <i class="fas fa-chevron-down"></i></a>
                    <div class="dropdown-content">
                        <a href="/parkflow/about"><i class="fas fa-building"></i> About Us</a>
                        <a href="/parkflow/services"><i class="fas fa-concierge-bell"></i> Services</a>
                        <a href="/parkflow/contact"><i class="fas fa-envelope"></i> Contact Us</a>
                    </div>
                </li>
            </ul>
        </nav>
    </c:when>
    <c:otherwise>
        <!-- Non-logged-in navbar content from homenavbar.jsp -->
        <nav class="navbar">
            <a href="/parkflow" class="logo">
                <img src="/image/logo.jpeg" alt="ParkFlow Logo"> ParkFlow
            </a>
            <button class="nav-toggle" id="navToggle">
                <i class="fas fa-bars"></i>
            </button>
            <ul class="nav-links" id="navLinks">
                <li><a href="/parkflow" class="active"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="/parkflow/map"><i class="fas fa-map-marker-alt"></i> Map</a></li>
                <li class="dropdown">
                    <a href="#"><i class="fas fa-info-circle"></i> About <i class="fas fa-chevron-down"></i></a>
                    <div class="dropdown-content">
                        <a href="/parkflow/about"><i class="fas fa-building"></i> About Us</a>
                        <a href="/parkflow/services"><i class="fas fa-concierge-bell"></i> Services</a>
                        <a href="/parkflow/contact"><i class="fas fa-envelope"></i> Contact Us</a>
                    </div>
                </li>
            </ul>
        </nav>
    </c:otherwise>
</c:choose>
