<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" href="../style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Additional styles for new features */
        .summary-card {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }
        .summary-item {
            flex: 1;
            background-color: var(--primary);
            color: white;
            padding: 15px;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            text-align: center;
        }
        .summary-item h3 {
            margin-bottom: 10px;
            font-size: 1.2rem;
        }
        .summary-item p {
            font-size: 1.5rem;
            font-weight: 700;
        }
        .notifications-card {
            background-color: #fff3cd;
            border: 1px solid #ffeeba;
            padding: 15px;
            border-radius: var(--radius);
            margin-bottom: 20px;
            color: #856404;
        }
        .notifications-card h2 {
            margin-top: 0;
            margin-bottom: 10px;
        }
        .notifications-list {
            list-style: none;
            padding-left: 0;
            max-height: 120px;
            overflow-y: auto;
        }
        .notifications-list li {
            margin-bottom: 8px;
            font-size: 0.9rem;
        }
        .search-input {
            margin-bottom: 10px;
            padding: 8px 12px;
            width: 100%;
            max-width: 300px;
            border: 1px solid #ccc;
            border-radius: var(--radius);
            font-size: 1rem;
        }
        .user-profile {
            background-color: var(--lighter);
            padding: 15px;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            margin-bottom: 20px;
            text-align: center;
        }
        .user-profile h2 {
            margin-bottom: 10px;
        }
        .user-profile p {
            margin: 5px 0;
            font-size: 1rem;
        }
        /* Pagination styles */
        .pagination {
            margin-top: 10px;
            text-align: right;
        }
        .pagination button {
            background-color: var(--primary);
            color: white;
            border: none;
            padding: 5px 10px;
            margin-left: 5px;
            border-radius: var(--radius);
            cursor: pointer;
            font-size: 0.9rem;
        }
        .pagination button:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
        /* Tooltip styles */
        .feature-card[title] {
            position: relative;
        }
        .feature-card[title]:hover::after {
            content: attr(title);
            position: absolute;
            bottom: 110%;
            left: 50%;
            transform: translateX(-50%);
            background-color: #333;
            color: white;
            padding: 5px 8px;
            border-radius: var(--radius);
            white-space: nowrap;
            font-size: 0.8rem;
            z-index: 10;
            opacity: 0.9;
        }
    </style>
</head>
<body>
    <!-- Top Bar -->
    <%@ include file="topbar.jsp" %>

    <!-- Header/Navbar -->
    <%@ include file="navbar.jsp" %>

    <div class="container">
        <!-- User Profile Section -->
        <div class="user-profile">
            <h2>Welcome, <c:out value="${modelFirstName}" default="User"/></h2>
            <p>Email: user@example.com</p>
            <p>Membership: Standard</p>
        </div>
        <!-- Notifications -->
        <div class="notifications-card">
            <h2>Notifications</h2>
            <ul class="notifications-list" id="notificationsList">
                <li>Vehicle KA-01-AB-1234 has been parked.</li>
                <li>Slot B-05 is reserved for VIP.</li>
                <li>Vehicle MH-04-CD-5678 exited at 10:00 AM.</li>
            </ul>
        </div>

        <!-- Quick Actions -->
        <div class="card mt-3">
            <h2 class="card-title">Quick Actions</h2>
            <div class="features-grid">
                <a href="addVehicle" class="feature-card" title="Register a new vehicle">
                    <i class="fas fa-plus-circle"></i>
                    <h3>Add Vehicle</h3>
                    <p>Register a new vehicle</p>
                </a>
                <a href="parkVehicle" class="feature-card" title="Assign a parking slot">
                    <i class="fas fa-parking"></i>
                    <h3>Park Vehicle</h3>
                    <p>Assign a parking slot</p>
                </a>
                <a href="exitVehicle" class="feature-card" title="Process a vehicle exit">
                    <i class="fas fa-sign-out-alt"></i>
                    <h3>Vehicle Exit</h3>
                    <p>Process a vehicle exit</p>
                </a>
                <a href="parkingMap" class="feature-card" title="View occupancy map">
                    <i class="fas fa-map-marked-alt"></i>
                    <h3>Parking Map</h3>
                    <p>View occupancy map</p>
                </a>
                <a href="parkVehicle" class="feature-card" title="Book Parking Slot">
                    <i class="fas fa-calendar-check"></i>
                    <h3>Book Parking Slot</h3>
                    <p>Reserve your parking slot</p>
                </a>
            </div>
        </div>

        <!-- Recent Activities -->
        <div class="card mt-3">
            <h2 class="card-title">Recent Activities</h2>
            <input type="text" id="searchInput" class="search-input" placeholder="Search by vehicle number or status..." onkeyup="filterActivities()">
            <div class="table-responsive" style="max-height: 300px; overflow-y: auto;">
                <table id="activitiesTable">
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
                                        <a href="./vehicleDetails?id=${activity.id}" class="action-btn action-btn-view" title="View Details">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <c:if test="${activity.status == 'PARKED'}">
                                            <a href="./exitVehicle?id=${activity.id}" class="action-btn action-btn-edit" title="Process Exit">
                                                <i class="fas fa-sign-out-alt"></i>
                                            </a>
                                        </c:if>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="pagination" id="paginationControls"></div>
            <div class="text-right mt-2">
                <a href="./allActivities" class="btn btn-sm">View All Activities <i class="fas fa-arrow-right"></i></a>
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

        // Filter recent activities table rows based on search input
        function filterActivities() {
            const input = document.getElementById('searchInput');
            const filter = input.value.toLowerCase();
            const table = document.getElementById('activitiesTable');
            const trs = table.getElementsByTagName('tr');

            for (let i = 1; i < trs.length; i++) { // skip header row
                const tds = trs[i].getElementsByTagName('td');
                let show = false;
                for (let j = 0; j < tds.length; j++) {
                    if (tds[j]) {
                        const textValue = tds[j].textContent || tds[j].innerText;
                        if (textValue.toLowerCase().indexOf(filter) > -1) {
                            show = true;
                            break;
                        }
                    }
                }
                trs[i].style.display = show ? '' : 'none';
            }
        }

        // Pagination for recent activities table
        const rowsPerPage = 5;
        let currentPage = 1;

        function paginateTable() {
            const table = document.getElementById('activitiesTable');
            const trs = table.getElementsByTagName('tr');
            const totalRows = trs.length - 1; // exclude header
            const totalPages = Math.ceil(totalRows / rowsPerPage);

            // Hide all rows except header
            for (let i = 1; i < trs.length; i++) {
                trs[i].style.display = 'none';
            }

            // Show rows for current page
            const start = (currentPage - 1) * rowsPerPage + 1;
            const end = start + rowsPerPage;
            for (let i = start; i < end && i < trs.length; i++) {
                trs[i].style.display = '';
            }

            // Render pagination buttons
            const paginationControls = document.getElementById('paginationControls');
            paginationControls.innerHTML = '';

            if (totalPages <= 1) return;

            if (currentPage > 1) {
                const prevBtn = document.createElement('button');
                prevBtn.textContent = 'Prev';
                prevBtn.onclick = () => {
                    currentPage--;
                    paginateTable();
                };
                paginationControls.appendChild(prevBtn);
            }

            for (let i = 1; i <= totalPages; i++) {
                const pageBtn = document.createElement('button');
                pageBtn.textContent = i;
                pageBtn.disabled = (i === currentPage);
                pageBtn.onclick = () => {
                    currentPage = i;
                    paginateTable();
                };
                paginationControls.appendChild(pageBtn);
            }

            if (currentPage < totalPages) {
                const nextBtn = document.createElement('button');
                nextBtn.textContent = 'Next';
                nextBtn.onclick = () => {
                    currentPage++;
                    paginateTable();
                };
                paginationControls.appendChild(nextBtn);
            }
        }

        // Initialize pagination on page load
        window.onload = function() {
            paginateTable();
        };
    </script>
</body>
</html>
