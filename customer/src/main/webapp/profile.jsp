<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>My Profile</h1>



<c:set var = "cus" value = "$(customer)"/>
<fieldset disabled>
<div class = "form-floating mb-3">
<label for = "floatingInput">First Name</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="firstname" value="$(firstname)">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Last Name</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="lastname" value="$(lastname)">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">NIC</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="NIC" value="$(NIC)">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Account Type</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="accounttype" value="$(accounttype)">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Account No</label>
<input type = "text" class = "form-control" id = "floatingInput" name="accountno" value="$(accountno)">
 
</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Date of Birth</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="dateofbirth" value="$(dateofbirth)">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Address</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="address" value="$(address)">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Phone no</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="phoneno" value="$(phoneno)">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Email</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="email" value="$(email)">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Password</label>
<input type = "text" class = "form-control" id = "floatingInput" name="password" value="$(password)">
 </div>
 </fieldset>
 <form method ="post" action ="update.jsp">
 
 <input type = "hidden" name="name" value="$(cus.firstname)">
 <input type = "hidden" name="name" value="$(cus.lastname)">
 <input type = "hidden" name="name" value="$(cus.NIC)">
 <input type = "hidden" name="name" value="$(cus.accounttype)">
 <input type = "hidden" name="name" value="$(cus.accountno)">
 <input type = "hidden" name="name" value="$(cus.dateofbirth)">
 <input type = "hidden" name="name" value="$(cus.address)">
 <input type = "hidden" name="name" value="$(cus.phoneno)">
 <input type = "hidden" name="name" value="$(cus.email)">
 <input type = "hidden" name="name" value="$(cus.password)">
 
 <input type ="submit" value="Update">
 
 
 <form action="deleteCustomer" method="post">
<input type="hidden" name="email" value="$(cus.email)">
<button type = "submit">Delete</button>

</form>
 

</form>

</body>
</html>