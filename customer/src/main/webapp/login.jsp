<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action ="login" method="post">

<h1>Sign In</h1>

<div class = "mb-3">
<label for = "floatingInput">Email Address</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="email">

</div>
<br>
<div class = "mb-3">
<label for = "floatingInput">Password</label> 
<input type = "text" class = "form-control" id = "floatingInput" name="password">

</div>
<br>
<button type="submit" class="btn btn-secondary">Submit</button>


</form>

</body>
</html>