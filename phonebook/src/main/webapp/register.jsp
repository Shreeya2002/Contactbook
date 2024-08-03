<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp" %>
</head>
<body style="background-color: #d7e7fa;">
<%@include file="component/navbar.jsp" %>
<div class="container-fluid">
<div class="row p-4	">
<div class="col-md-6 offset-md-3">
<div class="card">
<div class="card-body">
<h4 class="text-center text-success">Register</h4>

<% String sucessMsg=(String)session.getAttribute("sucessMsg");
	String errorMsg=(String)session.getAttribute("errorMsg");
if(sucessMsg!=null){%>
	<p class="text-success text-center"><%=sucessMsg %></p>
<%
session.removeAttribute("sucessMsg");
}
if(errorMsg!=null){
	%>
<p class="text-danger text-center"><%=errorMsg %></p>
<%
session.removeAttribute("errorMsg");
}
%>

<form action="register" method="post">
<div class="form-group">
    <label for="exampleInputEmail1">Name</label>
    <input name="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your name">
  </div>

  <div class="form-group">
    <label for="exampleInputEmail1">Email</label>
    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your Email">
  </div>
  
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
 <div class="text-center">
 <button type="submit" class="btn btn-primary">Submit</button>
 </div>
  
</form>
</div>
</div>
</div>
</div>
</div>

<div style="margin-top:180px;">
<%@include file="component/footer.jsp" %>
</div>
</body>
</html>