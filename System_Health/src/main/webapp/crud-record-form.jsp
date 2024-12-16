<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>CRUD Record Form</title>
    <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
    <style>
        /* image section */
        .image-section {
            background-image: url('https://i.ibb.co/c2kgZX2/modern-minimalist-office-black-white-1.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            border-top-left-radius: 20px; /* Rounded corners */
            border-bottom-left-radius: 20px; /* Rounded corners */
            height: 117%; /* Stretch to fill the height */
        }
        /* Card styles */
        .form-section .card {
            height: 100%;
            border-radius: 20px; /* Rounded corners for the card */
            background-color: white; /* Set card color to black */
            color: black; /* Set text color to white for contrast */
        }
        /* Header styles */
        .form-section .card-header {
            background-color: black; 
            border-top-left-radius: 20px; /* Match card corners */
            border-top-right-radius: 20px; /* Match card corners */
        }
        /* Flex container to maintain equal height */
        .row.full-height {
            height: 100vh; /* Make the row full height of the viewport */
        }
        
        /* Scrolling message styles */
        .scroll-container {
            width: 100%;
            overflow: hidden; /* Hide overflowing content */
            background-color: #f8f9fa; /* Light background color */
            color: #343a40; /* Darker text color */
            border-bottom: 2px solid #dee2e6; /* Line below the message */
            white-space: nowrap; /* Ensure messages stay on one line */
        }

        .scroll-content {
            display: inline-block;
            padding-left: 100%; /* Push content initially to the right */
            animation: scroll-left 150s linear infinite; /* Slower continuous scrolling */
        }

        /* Keyframes for smooth scrolling effect */
        @keyframes scroll-left {
            0% {
                transform: translateX(100%); /* Start offscreen to the right */
            }
            100% {
                transform: translateX(-100%); /* End offscreen to the left */
            }
        }
    </style>
</head>
<body>

    <!-- Scrolling message section -->
    <div class="scroll-container">
        <div class="scroll-content" id="randomMessage"></div>
    </div>

    <div class="container mt-5">
        <div class="row full-height">
            <!-- Left Column: Image Section -->
            <div class="col-md-5 image-section d-none d-md-block"></div>
            
            <!-- Right Column: Form Section -->
            <div class="col-md-7 form-section d-flex align-items-center">
                <div class="card w-100">
                    <div class="card-header text-white">
                        <h3 class="text-center mb-0">
                            ${report != null ? 'Edit CRUD Record' : 'Create New Report'}
                        </h3>
                    </div>
                    <div class="card-body">
                        <!-- Display Error Message if Present -->
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger" role="alert">
                                ${errorMessage}
                            </div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/${report != null ? 'update' : 'insert'}" method="post">
                            <input type="hidden" name="record_id" value="${report.record_id}" />
                            
                            <div class="form-group">
                                <label for="entity_type">Report Type</label>
                                <input type="text" class="form-control" id="entity_type" name="entity_type" value="${report.entity_type}" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="operation_type">Operation Status</label>
                                <input type="text" class="form-control" id="operation_type" name="operation_type" value="${report.operation_type}" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="initiated_by">Generated By</label>
                                <input type="text" class="form-control" id="initiated_by" name="initiated_by" value="${report.initiated_by}" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="operation_timestamp">Operation Timestamp</label>
                                <input type="datetime-local" class="form-control" id="operation_timestamp" name="operation_timestamp" 
                                       value="${report.operation_timestamp != null ? 
                                              report.operation_timestamp.toLocalDateTime().toString().substring(0,16) : ''}" required>
                                <small class="form-text text-muted">Format: yyyy-mm-dd hh:mm:ss</small>
                            </div>
                            
							<div class="form-group">
    							<label for="ip_address">IP Address</label>
    							<input type="text" class="form-control" id="ip_address" name="ip_address" value="${report.ip_address}" required
           							pattern="^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$"
           							title="Please enter a valid IPv4 address (0.0.0.0 - 255.255.255.255)">
    							<small class="form-text text-muted">Enter a valid IP address (e.g., 192.168.1.1)</small>
							</div>

                            
                            <div class="form-group">
                                <label for="operation_details">Operation Details</label>
                                <textarea class="form-control" id="operation_details" name="operation_details" rows="3" required>${report.operation_details}</textarea>
                            </div>
                            
                            <button type="submit" class="btn btn-success">
                                ${report != null ? 'Update' : 'Submit'}
                            </button>
                            <a href="${pageContext.request.contextPath}/listOperations" class="btn btn-secondary">Cancel</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Optional JavaScript for Bootstrap (if needed) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa6SAqlIiwK6Xj1KJebhZLhN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIyq43gK4eQmheHaJw3p1j3puJ7nhn1OZk+I7C1"
        crossorigin="anonymous"></script>

    <!-- JavaScript to handle random messages with timestamps -->
    <script>
        // List of random messages
        const messages = [
            "System alerts available!",
            "Remember to fill in all required fields.",
            "Have a productive day managing your records!",
            "Check out our latest feature updates!",
            "Security is our priority. Keep your data safe!",
            "Need help? Visit our documentation for guidance.",
            "Keep track of all changes to your records here.",
            "Data integrity is essential. Double-check your entries.",
            "Manage your records efficiently with our tools.",
            "Stay updated with the latest report features.",
            "Backup your data regularly to prevent loss."
        ];

        // Function to generate a random date and time
        function getRandomDateTime() {
            const start = new Date(2023, 0, 1); // Start from January 1, 2023
            const end = new Date();
            const randomDate = new Date(start.getTime() + Math.random() * (end.getTime() - start.getTime()));
            return randomDate.toLocaleString(); // Return formatted date and time
        }

        // Function to display continuous random messages
        function displayRandomMessages() {
            const randomMessageContainer = document.getElementById('randomMessage');
            randomMessageContainer.innerHTML = '';

            // Loop through the messages and concatenate them with random timestamps
            messages.forEach((message, index) => {
                const messageWithTimestamp = message + " (" + getRandomDateTime() + ")";
                const span = document.createElement('span');
                span.innerText = messageWithTimestamp + '   '; // Add spacing between messages
                randomMessageContainer.appendChild(span);
            });
        }

        // Start displaying messages as soon as the page loads
        displayRandomMessages(); // Call this function directly

    </script>

</body>

</html>
