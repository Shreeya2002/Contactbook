<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp" %>
<%@page import="com.entity.user" %>
</head>
<body style="background-color: #d7e7fa;">
<%@include file="component/navbar.jsp" %>

<%if(user==null)
{
	session.setAttribute("invalidMsg", "Please Register or Login for existing user.");
response.sendRedirect("login.jsp");	
}%>

<div class="container-fluid">
<div class="row p-4	">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center text-success">Add New Contact</h4>
<% String succMsg=(String)session.getAttribute("succMsg");
	String failMsg=(String)session.getAttribute("failMsg");
if(succMsg!=null){%>
	<p class="text-success text-center"><%=succMsg %></p>
<%
session.removeAttribute("succMsg");
}
if(failMsg!=null){
	%>
<p class="text-danger text-center"><%=failMsg %></p>
<%
session.removeAttribute("failMsg");
}
%>

<form action="addContact" method="post">

<%if(user!=null)
{%>
	<input type="hidden" value="<%=user.getId()%>" name="userid">
<%} %>
<div class="form-group">
    <label for="exampleInputEmail1">Name</label>
    <input name="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your name">
  </div>

  <div class="form-group">
    <label for="exampleInputEmail1">Email</label>
    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your Email">
  </div>
  
  <div class="form-group">
    <label for="exampleInputEmail1">Contact Number</label>
    <input name="phno" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your contact number">
  </div>
  
  <div class="form-group">

    <textarea name="about" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="About"></textarea>
  </div>
 
  
 <div class="text-center">
 <button type="submit" class="btn btn-primary">Save Contact</button>
 </div>
  
</form>
</div>
</div>
</div>
</div>
</div>

<br>
<br>
<br>
<br>
<br>
<%@include file="component/footer.jsp" %>
</body>
</html>