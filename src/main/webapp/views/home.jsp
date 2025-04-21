<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>ParkFlow</title>
    <link rel="stylesheet" href="../style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <!-- Top Bar -->

    <%@ include file="topbar.jsp" %>
    <%@ include file="navbar.jsp" %>

    <!-- Main Content -->
    <div class="container">
        <!-- Hero section -->
        <div class="hero">
            <div class="hero-content">
                <h2>Smart Parking and Traffic Detection System</h2>
                <p>Efficiently manage your parking facility with our easy-to-use system</p>
                <a href="signup" class="btn btn-lg">Get Started <i class="fas fa-arrow-right"></i></a>
            </div>
        </div>
        
        <!-- Features -->
        <h1>Parking Management Solutions</h1>
        <!-- System Overview -->
        <div class="card mt-4">
            <h2 class="card-title">System Overview</h2>
            <p>The ParkFlow Parking Management System provides the following features:</p>
            <ul style="list-style-type: none; padding-left: 0;">
                <li><i class="fas fa-check-circle" style="color: var(--secondary); margin-right: 10px;"></i> Real-time parking space availability</li>
                <li><i class="fas fa-check-circle" style="color: var(--secondary); margin-right: 10px;"></i> Vehicle registration and management</li>
                <li><i class="fas fa-check-circle" style="color: var(--secondary); margin-right: 10px;"></i> Automated parking slot assignment</li>
                <li><i class="fas fa-check-circle" style="color: var(--secondary); margin-right: 10px;"></i> Comprehensive reporting and analytics</li>
                <li><i class="fas fa-check-circle" style="color: var(--secondary); margin-right: 10px;"></i> User-friendly interface for operators</li>
            </ul>
        </div>
        
        <!-- About Section Preview -->
        <div class="about-section mt-4">
            <h2 class="text-center mb-3">Why Choose ParkFlow?</h2>
            <div class="about-grid">
                <div class="about-card">
                    <i class="fas fa-bullseye"></i>
                    <h3>Our Mission</h3>
                    <p>We aim to revolutionize parking management by providing smart, efficient, and user-friendly solutions that save time and reduce stress for both parking operators and vehicle owners.</p>
                </div>
                <div class="about-card">
                    <i class="fas fa-chart-line"></i>
                    <h3>Our Vision</h3>
                    <p>To become the leading provider of innovative parking solutions worldwide, transforming the way parking facilities are managed and utilized.</p>
                </div>
                <div class="about-card">
                    <i class="fas fa-users"></i>
                    <h3>Our Team</h3>
                    <p>Our team consists of experienced professionals dedicated to delivering excellence in parking management technology and customer service.</p>
                </div>
            </div>
            <div class="text-center mt-3">
                <a href="about" class="btn btn-secondary">Learn More About Us</a>
            </div>
        </div>
        
        <!-- Testimonials -->
        <div class="card mt-4">
            <h2 class="card-title">What Our Clients Say</h2>
            <div class="features-grid">
                <div class="card">
                    <div class="p-2">
                        <p>"ParkFlow has significantly improved our parking operations. The system is intuitive and has reduced our administrative workload by 40%."</p>
                        <div class="mt-2" style="display: flex; align-items: center; gap: 10px;">
                            <img src="image/p1.png" alt="John Doe" style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover;">
                            <div>
                                <h4 style="margin: 0;">John</h4>
                                <p style="margin: 0; color: #777;">Parking Manager, Fort City Central Mall</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="p-2">
                        <p>"The real-time monitoring feature has been a game-changer for our facility. We can now make data-driven decisions that have improved our revenue by 25%."</p>
                        <div class="mt-2" style="display: flex; align-items: center; gap: 10px;">
                            <img src="image/p2.jpeg" alt="Jane Smith" style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover;">
                            <div>
                                <h4 style="margin: 0;">Dev</h4>
                                <p style="margin: 0; color: #777;">Operations Director, Grand Hotel</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Call to Action -->
        <div class="card mt-4" style="background: linear-gradient(135deg, var(--primary), var(--primary-dark)); color: white; text-align: center;">
            <div class="p-4">
                <h2 style="color: white;">Ready to Transform Your Parking Management?</h2>
                <p>Join hundreds of satisfied clients who have revolutionized their parking operations with ParkFlow.</p>
                <div class="mt-3">
                    <a href="signup" class="btn" style="background-color: white; color: var(--primary);">Get Started</a>
                    <a href="contact" class="btn btn-outline" style="color: white; border-color: white;">Contact Sales</a>
                </div>
            </div>
        </div>
    </div>
    
<!-- Footer -->
<%@ include file="footer.jsp" %>


    <!-- JavaScript -->
    <script>
        // Toggle mobile navigation
        document.getElementById('navToggle').addEventListener('click', function() {
            document.getElementById('navLinks').classList.toggle('show');
        });
        
        // Close navigation when clicking outside
        document.addEventListener('click', function(event) {
            const navLinks = document.getElementById('navLinks');
            const navToggle = document.getElementById('navToggle');
            
            if (!navLinks.contains(event.target) && !navToggle.contains(event.target) && navLinks.classList.contains('show')) {
                navLinks.classList.remove('show');
            }
        });
        
        // Dropdown functionality
        const dropdowns = document.querySelectorAll('.dropdown');
        dropdowns.forEach(dropdown => {
            dropdown.addEventListener('click', function(e) {
                this.classList.toggle('active');
                e.stopPropagation();
            });
        });
        
        // Close dropdowns when clicking outside
        document.addEventListener('click', function() {
            dropdowns.forEach(dropdown => {
                dropdown.classList.remove('active');
            });
        });
    </script>
</body>
</html>