<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Business Dashboard - ParkFlow</title>
    <link rel="stylesheet" href="../style.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
</head>
<body>
    <%@ include file="topbar.jsp" %>
    <%@ include file="navbar.jsp" %>

    <div class="container">
        <h1>Business Dashboard</h1>

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

<div class="card mt-3">
    <h2 class="card-title">Quick Actions</h2>
    <div class="features-grid">
        <!-- Removed user-specific quick actions for business dashboard -->
        <a href="/parkflow/viewBookings" class="feature-card">
            <i class="fas fa-calendar-check"></i>
            <h3>View Bookings</h3>
            <p>Manage your bookings</p>
        </a>
        <a href="/parkflow/managePayments" class="feature-card">
            <i class="fas fa-credit-card"></i>
            <h3>Manage Payments</h3>
            <p>View and process payments</p>
        </a>
        <a href="/parkflow/businessReports" class="feature-card">
            <i class="fas fa-chart-line"></i>
            <h3>View Reports</h3>
            <p>Analyze business performance</p>
        </a>
        <a href="/parkflow/addParkingSlot" class="feature-card">
            <i class="fas fa-parking"></i>
            <h3>Add Parking Slot</h3>
            <p>Add a new parking slot with map coordinates</p>
        </a>
    </div>
</div>

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
                                        <a href="./vehicleDetails?id=${activity.id}" class="action-btn action-btn-view">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <c:if test="${activity.status == 'PARKED'}">
                                            <a href="./exitVehicle?id=${activity.id}" class="action-btn action-btn-edit">
                                                <i class="fas fa-sign-out-alt"></i>
                                            </a>
                                        </c:if>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty recentActivities}">
                            <tr>
                                <td colspan="6" style="text-align:center;">No recent activities available.</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
            <div class="text-right mt-2">
                <a href="./allActivities" class="btn btn-sm">View All Activities <i class="fas fa-arrow-right"></i></a>
            </div>
        </div>

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

        <div class="card mt-3">
            <h2>Add Parking Slot</h2>
            <form action="addParkingSlot" method="post" id="addParkingSlotForm">
                <div class="input-group">
                    <label for="slotNumber">Slot Number:</label>
                    <input type="text" id="slotNumber" name="slotNumber" placeholder="Enter slot number" required />
                </div>
                <div class="input-group">
                    <label for="floor">Floor:</label>
                    <input type="number" id="floor" name="floor" placeholder="Enter floor number" required min="1" />
                </div>
                <div class="input-group">
                    <label for="section">Section:</label>
                    <input type="text" id="section" name="section" placeholder="Enter section" required />
                </div>
                <button type="submit" class="btn btn-primary mt-2">Add Slot</button>
            </form>
        </div>

        <div class="card mt-3">
            <h2>Manage Parking Slots</h2>
            <table>
                <thead>
                    <tr>
                        <th>Slot Number</th>
                        <th>Floor</th>
                        <th>Section</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${parkingSlots}" var="slot">
                        <tr>
                            <td>${slot.slotNumber}</td>
                            <td>${slot.floor}</td>
                            <td>${slot.section}</td>
                            <td>${slot.status}</td>
                            <td>
                                <form action="removeParkingSlot" method="post" style="display:inline;">
                                    <input type="hidden" name="slotId" value="${slot.id}" />
                                    <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                                </form>
                                <form action="editParkingSlot" method="get" style="display:inline;">
                                    <input type="hidden" name="slotId" value="${slot.id}" />
                                    <button type="submit" class="btn btn-secondary btn-sm">Edit</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty parkingSlots}">
                        <tr>
                            <td colspan="5" style="text-align:center;">No parking slots available.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>

        <div class="card mt-3">
            <h2>Other Business Functions</h2>
            <ul>
                <li><a href="/parkflow/viewBookings">View Bookings</a></li>
                <li><a href="/parkflow/managePayments">Manage Payments</a></li>
                <li><a href="/parkflow/businessReports">View Reports</a></li>
            </ul>
        </div>
    </div>

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
