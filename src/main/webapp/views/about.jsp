<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>About ParkFlow</title>
    <link rel="stylesheet" href="../style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <!-- Header/Navbar -->
    <%@ include file="navbar.jsp" %>

    <!-- Main Content -->
    <div class="container">
        <!-- Hero Section -->
        <div class="hero about-hero">
            <div class="hero-content">
                <h1>About ParkFlow</h1>
                <p>Innovative parking solutions for modern cities</p>
            </div>
        </div>

        <!-- Company Overview -->
        <div class="card">
            <h2 class="card-title">Our Story</h2>
            <p>Founded in 2023, ParkFlow was born out of a need to solve the growing parking challenges in urban areas. Our team of engineers and urban planners came together with a mission to create smart, efficient parking solutions that reduce congestion and improve the parking experience for both operators and drivers.</p>
        </div>

        <!-- Mission & Vision -->
        <div class="features-grid">
            <div class="feature-card">
                <i class="fas fa-bullseye"></i>
                <h3>Our Mission</h3>
                <p>To revolutionize parking management through technology that saves time, reduces stress, and optimizes space utilization in parking facilities worldwide.</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-chart-line"></i>
                <h3>Our Vision</h3>
                <p>To become the global leader in smart parking solutions, transforming how cities and businesses manage their parking infrastructure.</p>
            </div>
        </div>

        <!-- Team Section -->
        <div class="card">
            <h2 class="card-title">Meet Our Team</h2>
            <div class="team-grid">
                <div class="team-member">
                    <img src="../image/p1.png" alt="John Doe">
                    <h3>John Doe</h3>
                    <p class="role">CEO & Founder</p>
                    <p>15+ years in urban planning and smart city solutions</p>
                </div>
                <div class="team-member">
                    <img src="../image/p2.jpeg" alt="Jane Smith">
                    <h3>Jane Smith</h3>
                    <p class="role">CTO</p>
                    <p>IoT and smart parking technology expert</p>
                </div>
                <div class="team-member">
                    <img src="../image/image1.jpg" alt="Mike Johnson">
                    <h3>Mike Johnson</h3>
                    <p class="role">Head of Operations</p>
                    <p>Specializes in parking facility management</p>
                </div>
            </div>
        </div>

        <!-- Technology Section -->
        <div class="card">
            <h2 class="card-title">Our Technology</h2>
            <div class="tech-grid">
                <div class="tech-card">
                    <i class="fas fa-car"></i>
                    <h3>Vehicle Detection</h3>
                    <p>Advanced sensors and computer vision for accurate vehicle detection</p>
                </div>
                <div class="tech-card">
                    <i class="fas fa-map-marked-alt"></i>
                    <h3>Real-time Mapping</h3>
                    <p>Live parking space availability on interactive maps</p>
                </div>
                <div class="tech-card">
                    <i class="fas fa-chart-pie"></i>
                    <h3>Analytics</h3>
                    <p>Comprehensive data analysis for operational insights</p>
                </div>
                <div class="tech-card">
                    <i class="fas fa-mobile-alt"></i>
                    <h3>Mobile Integration</h3>
                    <p>Seamless experience across all devices</p>
                </div>
            </div>
        </div>

        <!-- Testimonials -->
        <div class="card">
            <h2 class="card-title">What Our Clients Say</h2>
            <div class="testimonial-grid">
                <div class="testimonial">
                    <p>"ParkFlow reduced our parking complaints by 75% and increased revenue by 30% through better space utilization."</p>
                    <div class="client-info">
                        <img src="../image/imagehotel.jpg" alt="Client 1">
                        <div>
                            <h4>Sarah Williams</h4>
                            <p>Operations Manager, Grand Hotel</p>
                        </div>
                    </div>
                </div>
                <div class="testimonial">
                    <p>"The real-time monitoring and reporting features have transformed how we manage our parking facility."</p>
                    <div class="client-info">
                        <img src="../image/logo.jpeg" alt="Client 2">
                        <div>
                            <h4>Robert Chen</h4>
                            <p>Director, City Mall</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Call to Action -->
        <div class="cta-section">
            <h2>Ready to transform your parking operations?</h2>
            <a href="contact" class="btn btn-primary">Contact Us</a>
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="footer.jsp" %>

    <style>
        .about-hero {
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('../image/imagehotel.jpg');
            background-size: cover;
            background-position: center;
            color: white;
            text-align: center;
            padding: 100px 20px;
        }

        .team-grid, .tech-grid, .testimonial-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .team-member {
            text-align: center;
            padding: 20px;
            border-radius: 8px;
            background: #f9f9f9;
        }

        .team-member img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
        }

        .role {
            color: var(--primary);
            font-weight: bold;
        }

        .tech-card {
            padding: 20px;
            border-radius: 8px;
            background: #f9f9f9;
            text-align: center;
        }

        .tech-card i {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 15px;
        }

        .testimonial {
            padding: 20px;
            border-radius: 8px;
            background: #f9f9f9;
        }

        .client-info {
            display: flex;
            align-items: center;
            margin-top: 15px;
        }

        .client-info img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 15px;
        }

        .cta-section {
            text-align: center;
            padding: 50px 20px;
            margin: 50px 0;
            background: var(--primary-light);
            border-radius: 8px;
        }
    </style>
</body>
</html>
