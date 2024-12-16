<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./CSS/AdminTable.css">
</head>
<body>

<table class ="table">
<thead>
<tr>
<th scope ="col">First Name</th>
<th scope ="col">Last Name</th>
<th scope ="col">NIC</th>
<th scope ="col">Account Type</th>
<th scope ="col">Account No</th>
<th scope ="col">Date of Birth</th>
<th scope ="col">Address</th>
<th scope ="col">Phone No</th>
<th scope ="col">Email</th>
<th scope ="col">Password</th>
</tr>
</thead>
<tbody>
</tbody>
<c:forEach var="cus" items="$(customer)">

<tr>
<td>$(cus.firstname)</td>
<td>$(cus.lastname)</td>
<td>$(cus.NIC)</td>
<td>$(cus.accounttype)</td>
<td>$(cus.accountno)</td>
<td>$(cus.dateofbirth)</td>
<td>$(cus.address)</td>
<td>$(cus.phoneno)</td>
<td>$(cus.email)</td>
<td>$(cus.password)</td>
<td>
<form action="singleDataButton" method="post">
<input type="hidden" name="email" value="$(cus.email)">
<button type = "submit">Data</button>
</form>
</td>

<form action="deleteCustomer" method="post">
<input type="hidden" name="email" value="$(cus.email)">
<button type = "submit">Delete</button>

</form>
</tr>


</c:forEach>






</table>

</body>
</html>