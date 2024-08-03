<%@page import="java.sql.Connection"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="com.entity.user" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp" %>

<style>
.back-img{
background: url("img/phone2.jpg");
width:100%;
height:90vh;
background-repeat:no-repeat;
background-position: center center;
background-size: cover;
}
</style>

</head>
<body>
<%@include file="component/navbar.jsp" %>




<div class="container-fluid back-img text-right text-warning">
<h1>Welcome to Contact Buddy</h1>
</div>

<%@include file="component/footer.jsp" %>
</body>
</html>