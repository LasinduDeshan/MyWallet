<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Support Request List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #343a40;">
            <div class="container">
                <a class="navbar-brand" href="#">Customer Support</a>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath()%>/new">Create New Support Request</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    
    <div class="container mt-5">
        <h3 class="text-center">List of Support Requests</h3>
        <hr>
        
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Customer Name</th>
                    <th>NIC Number</th>
                    <th>Question Type</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="support" items="${listSupport}">
                    <tr>
                        <td><c:out value="${support.id}" /></td>
                        <td><c:out value="${support.customerName}" /></td>
                        <td><c:out value="${support.nicNumber}" /></td>
                        <td><c:out value="${support.questionType}" /></td>
                        <td>
                            <a href="edit?id=<c:out value='${support.id}' />" class="btn btn-primary btn-sm">Edit</a>
                            <a href="delete?id=<c:out value='${support.id}' />" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
