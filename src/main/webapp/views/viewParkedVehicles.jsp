<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Parked Vehicles</title>
    <link rel="stylesheet" href="../style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #3498db;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        @media screen and (max-width: 600px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }
            th {
                position: absolute;
                top: -9999px;
                left: -9999px;
            }
            tr {
                margin-bottom: 15px;
            }
            td {
                border: none;
                position: relative;
                padding-left: 50%;
                text-align: right;
            }
            td:before {
                position: absolute;
                top: 12px;
                left: 12px;
                width: 45%;
                padding-right: 10px;
                white-space: nowrap;
                font-weight: bold;
                text-align: left;
                content: attr(data-label);
            }
        }
    </style>
</head>
<body>
<h1>Currently Parked Vehicles</h1>

<c:if test="${not empty message}">
    <p style="color: green;">${message}</p>
</c:if>
<c:if test="${not empty error}">
    <p style="color: red;">${error}</p>
</c:if>

<table>
    <thead>
    <tr>
        <th>License Plate</th>
        <th>Vehicle Type</th>
        <th>Slot Number</th>
        <th>Entry Time</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="record" items="${vehicles}">
        <tr>
            <td data-label="License Plate">${record.licensePlate}</td>
            <td data-label="Vehicle Type">${record.model}</td>
            <td data-label="Slot Number">Unknown</td>
            <td data-label="Entry Time">${record.parkedAt}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<a href="/parkflow">Back to Menu</a>
</body>
</html>
