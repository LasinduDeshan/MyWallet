<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Update Profile</h1>
<div class = "form-floating mb-3">
<label for = "floatingInput">First Name</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="firstname" value="$(param.firstname)">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Last Name</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="lastname" value="$(param.lastname)">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">NIC</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="NIC" value="$(param.NIC)">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Account Type</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="accounttype" value="$(param.accounttype)">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Account No</label>
<input type = "text" class = "form-control" id = "floatingInput" name="accountno" value="$(param.accountno)">
 
</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Date of Birth</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="dateofbirth" value="$(param.dateofbirth)">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Address</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="address" value="$(param.address)">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Phone no</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="phoneno" value="$(param.phoneno)">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Email</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="email" value="$(param.email)">

</div>
<br>
<div class = "form-floating mb-3">
<label for = "floatingInput">Password</label>
<input type = "text" class = "form-control" id = "floatingInput" name="password" value="$(param.password)">
 
</div>
<button type="submit" class="btn btn-secondary">Submit</button>
</body>
</html>