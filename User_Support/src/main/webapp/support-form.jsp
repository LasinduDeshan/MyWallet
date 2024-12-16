<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Support Request Form</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <style>
        body {
            background-color: #f0f0f0; /* Ash color for background */
        }

        /* Card Styles */
        .bordered-card {
            border: 2px solid #007bff; /* Bootstrap primary color */
            border-radius: 20px; /* Rounded corners */
            padding: 20px; /* Padding inside the card */
            background-color: white; /* Black background */
            color: black; /* White text for contrast */
            height: 100%; /* Make card take full height of its container */
        }

        /* Utility Classes */
        .hidden {
            display: none; /* Utility class for hiding elements */
        }

        /* Image Column Styles */
        .image-column {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%; /* Ensure the image column fills the height */
        }

        .image-column img {
            width: 100%; /* Image takes full width of the column */
            height: 100%; /* Image takes full height of the column */
            object-fit: cover; /* Ensures the image covers the container without distortion */
            border-radius: 20px; /* Rounded corners to match the card */
        }

        /* Row Styles */
        .row.full-height {
            display: flex;
            align-items: stretch; /* Stretch columns to have equal height */
            height: auto; /* Let the content determine the height */
        }
    </style>
    <script>
        function showSection(section) {
            // Hide all sections
            document.getElementById("faqSection").classList.add("hidden");
            document.getElementById("contactSection").classList.add("hidden");
            document.getElementById("bankSection").classList.add("hidden");

            // Show the selected section
            document.getElementById(section).classList.remove("hidden");
        }
    </script>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #343a40;">
            <div class="container">
                <a class="navbar-brand" href="#">Customer Support</a>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath()%>/list">Support Requests</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    
    <div class="container mt-5">
        <!-- Call to Action Message -->
        <div class="row mb-4">
            <div class="col-md-12 text-center">
                <h3 style="color: #007bff; font-weight: bold;">Get in touch and let us know how we can help you</h3>
                <p style="color: #6c757d; font-size: 1.1em;">We are here to assist you with any questions or issues you might have.</p>
            </div>
        </div>

        <!-- Navigation Buttons -->
        <div class="row mb-3">
            <div class="col-md-12 text-center">
                <button class="btn btn-primary mr-2" onclick="showSection('faqSection')">FAQ</button>
                <button class="btn btn-primary mr-2" onclick="showSection('contactSection')">Contact Support Agent</button>
                <button class="btn btn-primary" onclick="showSection('bankSection')">Visit the Bank</button>
            </div>
        </div>

        <!-- FAQ Section -->
        <div id="faqSection" class="hidden"> 
            <div class="row full-height">
                <div class="col-md-6">
                    <div class="card bordered-card h-100">
                        <div class="card-body">
                            <h2 class="text-center">Frequently Asked Questions</h2>
                            <hr>
                            <p><strong>Q1:</strong> What is the support process?</p>
                            <p><strong>A:</strong> You can submit your queries via the support request form, and our team will respond within 24 hours.</p>
                            <p><strong>Q2:</strong> How can I reset my password?</p>
                            <p><strong>A:</strong> You can reset your password by clicking on the "Forgot Password" link on the login page.</p>
                            <p><strong>Q3:</strong> Where can I find my account details?</p>
                            <p><strong>A:</strong> You can view your account details by logging into your account and visiting the "Account Info" section.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 image-column h-100">
                    <img src="https://via.placeholder.com/600x400?text=FAQ" alt="FAQ Image" />
                </div>
            </div>
        </div>

        <!-- Contact Section -->
        <div id="contactSection" class="hidden"> 
            <div class="row full-height">
                <div class="col-md-6">
                    <div class="card bordered-card h-100">
                        <div class="card-body">
                            <c:if test="${support != null}">
                                <form action="update" method="post">
                                    <input type="hidden" name="id" value="<c:out value='${support.id}' />" />
                            </c:if>
                            <c:if test="${support == null}">
                                <form action="insert" method="post">
                            </c:if>
                            
                            <h2 class="text-center">
                                <c:if test="${support != null}">Edit Support Request</c:if>
                                <c:if test="${support == null}">Add New Support Request</c:if>
                            </h2>
                            <hr>
                            
                            <div class="form-group">
                                <label>Customer Name:</label>
                                <input type="text" name="customerName" value="<c:out value='${support.customerName}' />" class="form-control" required />
                            </div>
                            
                            <div class="form-group">
                                <label>NIC Number:</label>
                                <input type="text" name="nicNumber" value="<c:out value='${support.nicNumber}' />" class="form-control" required />
                            </div>
                            
                            <div class="form-group">
                                <label>Question Type:</label>
                                <select name="questionType" class="form-control">
                                    <option value="loginIssue" <c:if test="${support.questionType == 'loginIssue'}">selected</c:if>>Login Issue</option>
                                    <option value="accountDeactivation" <c:if test="${support.questionType == 'accountDeactivation'}">selected</c:if>>Account Deactivation</option>
                                    <option value="cardIssue" <c:if test="${support.questionType == 'cardIssue'}">selected</c:if>>Card Issue</option>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label>Question Description:</label>
                                <textarea name="questionDescription" class="form-control" required><c:out value='${support.questionDescription}' /></textarea>
                            </div>
                            
                            <button type="submit" class="btn btn-success">Save</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 image-column h-100">
                    <img src="https://via.placeholder.com/600x400?text=Contact" alt="Contact Image" />
                </div>
            </div>
        </div>

        <!-- Visit Bank Section -->
        <div id="bankSection" class="hidden"> 
            <div class="row full-height">
                <div class="col-md-6">
                    <div class="card bordered-card h-100">
                        <div class="card-body">
                            <h2 class="text-center">Visit Our Branches</h2>
                            <hr>
                            <p>We have several branches located across the country. You can find a branch near you by visiting our website and checking the 'Branches' section.</p>
                            <p>Our branches are open from 9 AM to 5 PM, Monday to Friday.</p>
                            <p>We look forward to serving you at your nearest branch!</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 image-column h-100">
                    <img src="https://via.placeholder.com/600x400?text=Branch" alt="Branch Image" />
                </div>
            </div>
        </div>
    </div>
</body>
</html>
