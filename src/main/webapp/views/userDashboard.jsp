<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>ParkFlow - Dashboard</title>
    <link rel="stylesheet" href="../style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <!-- Top Bar -->
    <%@ include file="topbar.jsp" %>

    <!-- Header/Navbar -->
    <%@ include file="navbar.jsp" %>

    <!-- Main Content -->
    <div class="container">
        <!-- Dashboard Header -->
        <h1>Parking Dashboard</h1>
        
        <!-- Alert Messages -->
        <c:if test="${not empty success}">
            <div class="message message-success">
                <i class="fas fa-check-circle"></i> ${success}
            </div>
        </c:if>
        
        <c:if test="${not empty error}">
            <div class="message message-error">
                <i class="fas fa-exclamation-circle"></i> ${error}
            </div>
        </c:if>
        
        <!-- Overview Stats -->
        <div class="stats-grid">
            <div class="stat-card">
                <i class="fas fa-car-side"></i>
                <h3>Total Spaces</h3>
                <p>${totalSpaces}</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-car"></i>
                <h3>Occupied</h3>
                <p>${occupiedSpaces}</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-check-circle"></i>
                <h3>Available</h3>
                <p>${availableSpaces}</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-money-bill-wave"></i>
                <h3>Today's Revenue</h3>
                <p>$${todayRevenue}</p>
            </div>
        </div>
        
        <!-- Quick Actions -->
        <div class="card mt-3">
            <h2 class="card-title">Quick Actions</h2>
            <div class="features-grid">
                <a href="/parkflow/addVehicle" class="feature-card">
                    <i class="fas fa-plus-circle"></i>
                    <h3>Add Vehicle</h3>
                    <p>Register a new vehicle</p>
                </a>
                <a href="/parkflow/parkVehicle" class="feature-card">
                    <i class="fas fa-parking"></i>
                    <h3>Park Vehicle</h3>
                    <p>Assign a parking slot</p>
                </a>
                <a href="/parkflow/exitVehicle" class="feature-card">
                    <i class="fas fa-sign-out-alt"></i>
                    <h3>Vehicle Exit</h3>
                    <p>Process a vehicle exit</p>
                </a>
                <a href="/parkflow/parkingMap" class="feature-card">
                    <i class="fas fa-map-marked-alt"></i>
                    <h3>Parking Map</h3>
                    <p>View occupancy map</p>
                </a>
            </div>
        </div>
        
        <!-- Recent Activities -->
        <div class="card mt-3">
            <h2 class="card-title">Recent Activities</h2>
            <div class="table-responsive">
                <table>
                    <thead>
                        <tr>
                            <th>Vehicle Number</th>
                            <th>Type</th>
                            <th>Entry Time</th>
                            <th>Slot</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${recentActivities}" var="activity">
                            <tr>
                                <td>${activity.vehicleNumber}</td>
                                <td>${activity.vehicleType}</td>
                                <td>${activity.entryTime}</td>
                                <td>${activity.slotNumber}</td>
                                <td>
                                    <span class="status-badge ${activity.status == 'PARKED' ? 'status-active' : 'status-completed'}">
                                        ${activity.status}
                                    </span>
                                </td>
                                <td>
                                    <div class="action-btns">
                                        <a href="/parkflow/vehicleDetails?id=${activity.id}" class="action-btn action-btn-view">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <c:if test="${activity.status == 'PARKED'}">
                                            <a href="/parkflow/exitVehicle?id=${activity.id}" class="action-btn action-btn-edit">
                                                <i class="fas fa-sign-out-alt"></i>
                                            </a>
                                        </c:if>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        
                        <!-- Sample data for when the list is empty (can be removed in production) -->
                        <c:if test="${empty recentActivities}">
                            <tr>
                                <td>KA-01-AB-1234</td>
                                <td>Sedan</td>
                                <td>Today, 10:30 AM</td>
                                <td>A-12</td>
                                <td>
                                    <span class="status-badge status-active">PARKED</span>
                                </td>
                                <td>
                                    <div class="action-btns">
                                        <a href="./vehicleDetails?id=1" class="action-btn action-btn-view">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="./exitVehicle?id=1" class="action-btn action-btn-edit">
                                            <i class="fas fa-sign-out-alt"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>MH-04-CD-5678</td>
                                <td>SUV</td>
                                <td>Today, 09:15 AM</td>
                                <td>B-05</td>
                                <td>
                                    <span class="status-badge status-completed">EXITED</span>
                                </td>
                                <td>
                                    <div class="action-btns">
                                        <a href="vehicleDetails?id=2" class="action-btn action-btn-view">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
            <div class="text-right mt-2">
                <a href="/parkflow/allActivities" class="btn btn-sm">View All Activities <i class="fas fa-arrow-right"></i></a>
            </div>
        </div>
        
        <!-- Parking Space Availability -->
        <div class="card mt-3">
            <h2 class="card-title">Parking Space Availability</h2>
            <div class="form-row">
                <div class="form-col">
                    <label for="floorSelect">Select Floor</label>
                    <select id="floorSelect" onchange="updateFloorMap()">
                        <option value="1">Floor 1</option>
                        <option value="2">Floor 2</option>
                        <option value="3">Floor 3</option>
                    </select>
                </div>
                <div class="form-col">
                    <label for="sectionSelect">Select Section</label>
                    <select id="sectionSelect" onchange="updateFloorMap()">
                        <option value="A">Section A</option>
                        <option value="B">Section B</option>
                        <option value="C">Section C</option>
                    </select>
                </div>
            </div>
            
            <!-- Placeholder for the parking map - This would be replaced with actual map in production -->
            <div id="parkingMap" class="mt-2" style="background-color: var(--lighter); border-radius: var(--radius); padding: 20px; min-height: 300px; display: flex; flex-wrap: wrap; gap: 10px; justify-content: center;">
                <!-- Sample parking slots for visualization -->
                <c:forEach begin="1" end="24" var="slot">
                    <div class="parking-slot ${slot % 3 == 0 ? 'occupied' : 'free'}" 
                         onclick="slotClicked('A-${slot}')"
                         data-slot="A-${slot}">
                        A-${slot}
                    </div>
                </c:forEach>
            </div>
            <div class="mt-2" style="display: flex; gap: 20px; justify-content: center;">
                <div style="display: flex; align-items: center; gap: 5px;">
                    <span style="display: inline-block; width: 16px; height: 16px; background-color: var(--success); border-radius: 4px;"></span>
                    <span>Available</span>
                </div>
                <div style="display: flex; align-items: center; gap: 5px;">
                    <span style="display: inline-block; width: 16px; height: 16px; background-color: var(--danger); border-radius: 4px;"></span>
                    <span>Occupied</span>
                </div>
                <div style="display: flex; align-items: center; gap: 5px;">
                    <span style="display: inline-block; width: 16px; height: 16px; background-color: var(--warning); border-radius: 4px;"></span>
                    <span>Reserved</span>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <%@ include file="footer.jsp" %>

    <!-- Page Specific CSS -->
    <style>
        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            display: inline-block;
        }
        
        .status-active {
            background-color: rgba(46, 204, 113, 0.2);
            color: var(--success);
        }
        
        .status-completed {
            background-color: rgba(52, 152, 219, 0.2);
            color: var(--info);
        }
        
        .parking-slot {
            width: 60px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: var(--radius);
            cursor: pointer;
            font-weight: 600;
            font-size: 0.9rem;
            border: 1px solid #ddd;
            transition: var(--transition);
        }
        
        .parking-slot.free {
            background-color: var(--success);
            color: white;
        }
        
        .parking-slot.occupied {
            background-color: var(--danger);
            color: white;
        }
        
        .parking-slot.reserved {
            background-color: var(--warning);
            color: white;
        }
        
        .parking-slot:hover {
            transform: scale(1.05);
            box-shadow: var(--shadow);
        }
    </style>

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
        
        // Slot clicked function
        function slotClicked(slotId) {
            const slotElement = document.querySelector(`[data-slot="${slotId}"]`);
            
            if (slotElement.classList.contains('free')) {
                // Show park vehicle dialog or redirect to park vehicle page
                window.location.href = `./parkVehicle?slot=${slotId}`;
            } else if (slotElement.classList.contains('occupied')) {
                // Show vehicle details or redirect to vehicle details page
                window.location.href = `./vehicleDetails?slot=${slotId}`;
            }
        }
        
        // Update floor map based on selection
        function updateFloorMap() {
            const floor = document.getElementById('floorSelect').value;
            const section = document.getElementById('sectionSelect').value;
            
            // In a real implementation, this would make an AJAX call to get the updated data
            console.log(`Loading parking map for floor ${floor}, section ${section}`);
            
            // Simulate a loading state
            document.getElementById('parkingMap').innerHTML = '<div style="width: 100%; text-align: center; padding: 50px;">Loading parking map...</div>';
            
            // Simulate an AJAX response
            setTimeout(() => {
                let slots = '';
                for (let i = 1; i <= 24; i++) {
                    const status = Math.random() > 0.6 ? 'free' : (Math.random() > 0.5 ? 'occupied' : 'reserved');
                    slots += `<div class="parking-slot ${status}" onclick="slotClicked('${section}-${i}')" data-slot="${section}-${i}">${section}-${i}</div>`;
                }
                document.getElementById('parkingMap').innerHTML = slots;
            }, 500);
        }
    </script>
</body>
</html>
