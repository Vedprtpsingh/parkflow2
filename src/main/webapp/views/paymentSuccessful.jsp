<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Successful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            text-align: center;
        }
        .success-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }
        .success-icon {
            color: #4CAF50;
            font-size: 64px;
            margin-bottom: 20px;
        }
        h1 {
            color: #333;
        }
        .details {
            margin: 30px 0;
            text-align: left;
            padding: 0 50px;
        }
        .detail-row {
            display: flex;
            justify-content: space-between;
            margin: 10px 0;
            border-bottom: 1px solid #eee;
            padding-bottom: 5px;
        }
        .barrier-btn {
            background-color: #4CAF50;
            color: white;
            padding: 15px 30px;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .barrier-btn:hover {
            background-color: #45a049;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }
        .modal-content {
            background-color: white;
            margin: 15% auto;
            padding: 20px;
            border-radius: 5px;
            width: 50%;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            animation: modalFadeIn 0.5s;
        }
        @keyframes modalFadeIn {
            from {opacity: 0; transform: translateY(-50px);}
            to {opacity: 1; transform: translateY(0);}
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }
        .close:hover {
            color: black;
        }
    </style>
</head>
<body>
    <%
        // This would typically come from your payment processing logic
        String transactionId = request.getParameter("transactionId");
        String amount = request.getParameter("amount");
        String date = request.getParameter("date");
        
        if(transactionId == null) transactionId = "TX" + System.currentTimeMillis();
        if(amount == null) amount = "300.00";
        if(date == null) {
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            date = sdf.format(new java.util.Date());
        }
    %>

    <div class="container">
        <div class="success-card">
            <div class="success-icon">✓</div>
            <h1>Payment Successful!</h1>
            <p>Your transaction has been completed successfully.</p>
            
            <div class="details">
                <div class="detail-row">
                    <span>Transaction ID:</span>
                    <span><%= transactionId %></span>
                </div>
                <div class="detail-row">
                    <span>Amount:</span>
                    <span><%= amount %></span>
                </div>
                <div class="detail-row">
                    <span>Date:</span>
                    <span><%= date %></span>
                </div>
            </div>
            
            <button class="barrier-btn" onclick="confirmBarrierOpen()">Open Barrier</button>
        </div>
    </div>
    
    <!-- Success Popup Modal -->
    <div id="successModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>Payment Confirmed</h2>
            <p>Your payment has been successfully processed.</p>
            <p>The barrier will open now. Please proceed safely.</p>
        </div>
    </div>
    
    <script>
        // Display success modal when page loads
        window.onload = function() {
            document.getElementById('successModal').style.display = 'block';
        };
        
        // Close the modal
        function closeModal() {
            document.getElementById('successModal').style.display = 'none';
        }
        
        // Open the barrier (this would call your backend service)
        function confirmBarrierOpen() {
            // Here you would make an AJAX call to your backend to open the barrier
            // For demonstration, we'll just show an alert
            alert("Opening barrier. Please proceed.");
            
            // In a real implementation, you might do something like:
            /*
            fetch('/api/openBarrier', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    transactionId: '<%= transactionId %>'
                })
            })
            .then(response => response.json())
            .then(data => {
                if(data.success) {
                    alert("Barrier is now open. Please proceed.");
                } else {
                    alert("Error opening barrier: " + data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert("Error connecting to barrier system. Please contact staff.");
            });
            */
        }
        
        // Close modal when clicking outside of it
        window.onclick = function(event) {
            var modal = document.getElementById('successModal');
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
</body>
</html>