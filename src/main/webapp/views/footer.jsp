<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
    <c:when test="${not empty sessionScope.modelFirstName}">
        <!-- Logged-in footer content from footer.jsp -->
        <footer>
            <div class="footer-container">
                <div class="footer-grid">
                    <div class="footer-col">
                        <h3>ParkFlow</h3>
                        <p>Smart solutions for modern parking management. Transforming the way you handle parking facilities
                            with innovative technology.</p>
                        <div class="social-links mt-3">
                            <a href="https://facebook.com/parkflow" target="_blank"><i class="fab fa-facebook-f"></i></a>
                            <a href="https://twitter.com/parkflow" target="_blank"><i class="fab fa-twitter"></i></a>
                            <a href="https://linkedin.com/company/parkflow" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                            <a href="https://instagram.com/parkflow" target="_blank"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                    <div class="footer-col">
                        <h3>Quick Links</h3>
                        <ul class="footer-links">
                            <li><a href="/parkflow"><i class="fas fa-chevron-right"></i> Home</a></li>
                            <li><a href="./about"><i class="fas fa-chevron-right"></i> About Us</a></li>
                            <li><a href="./services"><i class="fas fa-chevron-right"></i> Services</a></li>
                            <li><a href="./addVehicle"><i class="fas fa-chevron-right"></i> Add Vehicle</a></li>
                            <li><a href="./parkVehicle"><i class="fas fa-chevron-right"></i> Park Vehicle</a></li>
                            <li><a href="./viewParkedVehicles"><i class="fas fa-chevron-right"></i> View Vehicles</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h3>Our Services</h3>
                        <ul class="footer-links">
                            <li><a href="./services#registration"><i class="fas fa-chevron-right"></i> Vehicle Registration</a></li>
                            <li><a href="./services#allocation"><i class="fas fa-chevron-right"></i> Parking Space Allocation</a></li>
                            <li><a href="./services#monitoring"><i class="fas fa-chevron-right"></i> Real-time Monitoring</a></li>
                            <li><a href="./services#analytics"><i class="fas fa-chevron-right"></i> Reporting & Analytics</a></li>
                            <li><a href="./services#mobile"><i class="fas fa-chevron-right"></i> Mobile Application</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h3>Contact Us</h3>
                        <ul class="footer-contact">
                            <li>
                                <i class="fas fa-map-marker-alt"></i>
                                <span>123 Parking Street, Ghaziabad, India</span>
                            </li>
                            <li>
                                <i class="fas fa-phone"></i>
                                <span>+123 456 7890</span>
                            </li>
                            <li>
                                <i class="fas fa-envelope"></i>
                                <span>info@parkflow.com</span>
                            </li>
                            <li>
                                <i class="fas fa-clock"></i>
                                <span>Mon - Fri: 9:00 AM - 5:00 PM</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="footer-bottom">
                    <p>&copy; 2025 ParkFlow. All rights reserved.</p>
                </div>
            </div>
        </footer>
    </c:when>
    <c:otherwise>
        <!-- Non-logged-in footer content from homefooter.jsp -->
        <footer>
            <div class="footer-container">
                <div class="footer-grid">
                    <div class="footer-col">
                        <h3>Contact Us</h3>
                        <ul class="footer-contact">
                            <li>
                                <i class="fas fa-map-marker-alt"></i>
                                <span>123 Parking Street, Ghaziabad, India</span>
                            </li>
                            <li>
                                <i class="fas fa-phone"></i>
                                <span>+123 456 7890</span>
                            </li>
                            <li>
                                <i class="fas fa-envelope"></i>
                                <span>info@parkflow.com</span>
                            </li>
                            <li>
                                <i class="fas fa-clock"></i>
                                <span>Mon - Fri: 9:00 AM - 5:00 PM</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="footer-bottom">
                    <p>&copy; 2025 ParkFlow. All rights reserved.</p>
                </div>
            </div>
        </footer>
    </c:otherwise>
</c:choose>
