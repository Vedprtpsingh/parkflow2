<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment</title>
    <link rel="stylesheet" href="../style.css" />
</head>
<body>
    <h1>Make a Payment</h1>
    <form action="/parkflow/processPayment" >
        <div class="input-group">
            <label for="paymentAmount">Amount:</label>
            <input type="number" id="paymentAmount" name="paymentAmount" step="10" min="300" value="300" required />
        </div>
        <div class="input-group">
            <label for="paymentMethod">Payment Method:</label>
            <select id="paymentMethod" name="paymentMethod" required>
                <option value="">-- Select Payment Method --</option>
                <option value="credit_card">Credit Card</option>
                <option value="debit_card">Debit Card</option>
                <option value="other">UPI</option>
                <option value="cash">QR Code</option>
            </select>
        </div>
        <button type="submit">Pay Now</button>
    </form>
    <c:if test="${not empty success}">
        <p class="success">${success}</p>
    </c:if>
    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>
    <a href="/parkflow">Back to Menu</a>
</body>
</html>