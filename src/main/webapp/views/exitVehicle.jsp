<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Exit Vehicle - ParkFlow</title>
    <link rel="stylesheet" href="../style.css">
</head>
<body>
    <%@ include file="topbar.jsp" %>
    <%@ include file="navbar.jsp" %>
    
    <div class="container">
        <h1>Exit Vehicle</h1>
        <!-- Add form or details for vehicle exit here -->
        <button class="exit-button" onclick="location.href='processExit.jsp'">Click Here For Exit</button>
    </div>
    
    <%@ include file="footer.jsp" %>
</body>
</html>