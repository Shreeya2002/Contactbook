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
<div class="row p-3">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center text-success">Login</h4>

<%
String invalidMsg=(String)session.getAttribute("invalidMsg");
if(invalidMsg!=null){%>
	<p class="text-danger text-center"><%=invalidMsg %></p>
<%
session.removeAttribute("invalidMsg");
}
%>

<%
String logMsg=(String)session.getAttribute("logMsg");
if(logMsg!=null){%>
	<p class="text-warning text-center"><%=logMsg %></p>
<%
session.removeAttribute("logMsg");
}
%>

<form action="login" method="post">
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
<div style="margin-top:280px;">
<%@include file="component/footer.jsp" %>
</div>
</body>
</html>