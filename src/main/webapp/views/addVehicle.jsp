<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Add Vehicle</title>
    <link rel="stylesheet" href="../style.css">
</head>
<body>
<h1>Add Vehicle</h1>

<form action="<c:url value='/parkflow/addVehicle' />" method="post">
    <label for="licensePlate">License Plate:</label>
    <input type="text" id="licensePlate" name="licensePlate" required><br><br>

    <label for="model">Model:</label>
    <input type="text" id="model" name="model" required><br><br>

    <label for="color">Color:</label>
    <input type="text" id="color" name="color"><br><br>

    <input type="submit" value="Add Vehicle">
</form>

<a href="<c:url value='/parkflow' />">Back to Menu</a>
</body>
</html>
