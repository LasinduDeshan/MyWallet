<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Loan Applications</title>
<link rel="stylesheet" href="./style/tStyle.css">
</head>
<body>

	<div class="head">
    	<h2>Student Loan Applications</h2>
    	<form  method ="post" action="loanIndex.jsp">
    		<button id="pPage"> Loan Section </button>
    	</form>
    </div>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Account Number</th>
            <th>NIC</th>
            <th>Loan Nickname</th>
            <th>Tuition Fee</th>
            <th>Course Duration</th>
            <th>Institution Name</th>
            <th>Study Program</th>
            <th>Monthly Living Expenses</th>
            <th>Part-Time Job</th>
            <th>Loan Duration</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>

        <c:forEach var="loans" items="${stdLoan}">
        <tr>
            <td>${loans.stdLoanAppID}</td>
            <td>${loans.accountNumber}</td>
            <td>${loans.nicNumber}</td> 
            <td>${loans.loanNickname}</td>
            <td>${loans.tuitionFee}</td>
            <td>${loans.courseDuration}</td>
            <td>${loans.institutionName}</td>
            <td>${loans.studyProgram}</td>
            <td>${loans.monthlyLivingExpenses}</td>
            <td>${loans.partTimeJob}</td>
            <td>${loans.loanDuration}</td>
            <td>
                <form action="updataLoan_det.jsp" method="post">
                  	<input type="hidden" name="stdLoanAppID" value="${loans.stdLoanAppID}">
                    <input type="hidden" name="accountNumber" value="${loans.accountNumber}">
                    <input type="hidden" name="nicNumber" value="${loans.nicNumber}">
                    <input type="hidden" name="loanNickname" value="${loans.loanNickname}">
                    <input type="hidden" name="tuitionFee" value="${loans.tuitionFee}">
                    <input type="hidden" name="courseDuration" value="${loans.courseDuration}">
                    <input type="hidden" name="institutionName" value="${loans.institutionName}">
                    <input type="hidden" name="studyProgram" value="${loans.studyProgram}">
                    <input type="hidden" name="monthlyLivingExpenses" value="${loans.monthlyLivingExpenses}">
                    <input type="hidden" name="partTimeJob" value="${loans.partTimeJob}">
                    <input type="hidden" name="loanDuration" value="${loans.loanDuration}">

                    <button type="submit" class="uBtn" id="uBtn">Update</button>
                </form>
            </td>
            <td>
                <form action="deleteLoans" method="post">
                    <input type="hidden" name="stdLoanAppID" value="${loans.stdLoanAppID}">
                    <button type="submit" class="dBtn" id="dBtn">Delete</button>
                </form>
            </td>
        </tr>
        </c:forEach>
    </table>

</body>
</html>

