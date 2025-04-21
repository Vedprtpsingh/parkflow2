<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Our Services | ParkFlow</title>
    <link rel="stylesheet" href="../style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .service-section {
            background-color: #f9f9f9;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .service-section:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.15);
        }
        .service-section h2 {
            color: var(--primary);
            margin-bottom: 10px;
            font-size: 1.8rem;
        }
        .service-section p {
            font-size: 1.1rem;
            color: #444;
        }
        /* Add a new service section style */
        .new-service {
            background-color: #e8f5e9;
            border-left: 6px solid var(--secondary);
        }
    </style>
</head>
<body>
        <jsp:include page="navbar.jsp" />

    <main class="container">
        <section id="registration" class="service-section">
            <h2><i class="fas fa-car"></i> Vehicle Registration</h2>
            <p>Register your vehicles with our system for seamless parking management and access control. Our platform ensures secure and efficient vehicle data handling.</p>
        </section>

        <section id="allocation" class="service-section">
            <h2><i class="fas fa-parking"></i> Parking Space Allocation</h2>
            <p>Smart allocation of parking spaces based on vehicle type, availability, and user preferences. Optimize your parking lot usage with our intelligent algorithms.</p>
        </section>

        <section id="monitoring" class="service-section">
            <h2><i class="fas fa-video"></i> Real-time Monitoring</h2>
            <p>24/7 monitoring of parking facilities with live updates, alerts, and historical data tracking to enhance security and operational efficiency.</p>
        </section>

        <section id="analytics" class="service-section">
            <h2><i class="fas fa-chart-line"></i> Reporting & Analytics</h2>
            <p>Comprehensive reports and analytics to optimize parking operations, identify trends, and support data-driven decision making.</p>
        </section>

        <section id="mobile" class="service-section">
            <h2><i class="fas fa-mobile-alt"></i> Mobile Application</h2>
            <p>Manage your parking needs on the go with our dedicated mobile app, featuring real-time updates, booking, and payment options.</p>
        </section>

        <section id="customer-support" class="service-section new-service">
            <h2><i class="fas fa-headset"></i> Customer Support</h2>
            <p>Our dedicated support team is available 24/7 to assist you with any questions or issues related to your parking experience.</p>
        </section>

        <section id="custom-solutions" class="service-section new-service">
            <h2><i class="fas fa-cogs"></i> Custom Solutions</h2>
            <p>We offer tailored parking management solutions to meet the unique needs of your business or facility.</p>
        </section>
    </main>

    <%@ include file="footer.jsp" %>
</body>
</html>
