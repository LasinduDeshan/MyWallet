<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="addCustomer" method="post">
<h1>Welcome to Sign Up</h1>

<div class = "form-floating mb-3">
<label for = "floatingInput">First Name</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="firstname">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Last Name</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="lastname">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">NIC</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="NIC">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Account Type</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="accounttype">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Account No</label>
<input type = "text" class = "form-control" id = "floatingInput" name="accountno">
 
</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Date of Birth</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="dateofbirth">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Address</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="address">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Phone no</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="phoneno">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Email</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="email">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Password</label>
<input type = "text" class = "form-control" id = "floatingInput" name="password">
 
</div>
<br>

<button type="submit" class="btn btn-secondary">Submit</button>
<br>
<p>Already have an account? <a href="login.jsp">Sign In</a></p>
</form>
</body>
</html>

