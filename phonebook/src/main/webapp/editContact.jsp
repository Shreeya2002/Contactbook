<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.dao.contactDAO"%>
    <%@page import="com.conn.DbConnect"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp" %>
</head>
<body style="background-color: #d7e7fa;">
<%@include file="component/navbar.jsp" %>
<%@page import="com.entity.contact"%>
<%
	if (user == null) {
		session.setAttribute("invalidMsg", "Please Register or Login for existing user.");
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="container-fluid">
<div class="row p-4	">
<div class="col-md-6 offset-md-3">
<div class="card">
<div class="card-body">
<h4 class="text-center text-success">Edit Contact</h4>
<% 
	String failMsg=(String)session.getAttribute("failMsg");

if(failMsg!=null){
	%>
<p class="text-danger text-center"><%=failMsg %></p>
<%
session.removeAttribute("failMsg");
}
%>

<form action="update" method="post">

<%
int cid=Integer.parseInt(request.getParameter("cid"));
contactDAO dao=new contactDAO(DbConnect.getConn());
contact c=dao.getContactByID(cid);
%>

<div class="form-group">
    <label for="exampleInputEmail1">Name</label>
    <input value="<%=c.getId()%>" name="id" type="hidden" class="form-control" >
    <input value="<%=c.getName()%>" name="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>

  <div class="form-group">
    <label for="exampleInputEmail1">Email</label>
    <input value="<%=c.getEmail()%>" name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  
  <div class="form-group">
    <label for="exampleInputEmail1">Contact Number</label>
    <input value="<%=c.getPhno()%>" name="phno" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  
  <div class="form-group">

    <textarea name="about"  class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"><%=c.getAbout()%></textarea>
  </div>
 
  
 <div class="text-center">
 <button type="submit" class="btn btn-primary">Edit Contact</button>
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