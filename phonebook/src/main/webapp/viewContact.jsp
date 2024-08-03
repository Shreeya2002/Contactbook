
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dao.contactDAO"%>
<%@ page import="java.util.List"%>
<%@page import="com.conn.DbConnect"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@include file="component/allCss.jsp"%>
<%@page import="com.entity.contact"%>

<style type="text/css">
.crd-ho:hover {
	background-color: #E6FBFE;
}
</style>

</head>
<body style="background-color: #d7e7fa;">
	<%@include file="component/navbar.jsp"%>
	<%
	if (user == null) {
		session.setAttribute("invalidMsg", "Please Register or Login for existing user.");
		response.sendRedirect("login.jsp");
	}
	%>

	<%
	String succMsg = (String) session.getAttribute("succMsg");
	String failMsg=(String)session.getAttribute("failedMsg"); 
	if (succMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=succMsg%></div>
	<%
	session.removeAttribute("succMsg");
	}
	if(failMsg!=null){
		%>
	<p class="text-danger text-center"><%=failMsg %></p>
	<%
	session.removeAttribute("failedMsg");
	}
	%>


	<div class="container-fluid">
		<div class="row p-4">


			<%
			if (user != null) {

				contactDAO dao = new contactDAO(DbConnect.getConn());
				List<contact> contact = dao.getAllContact(user.getId());

				for (contact c : contact) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<h5 class="card-header"><%=c.getName()%></h5>
					<div class="card-body">
						<h5 class="card-title"><%=c.getPhno()%></h5>
						<p class="card-text"><%=c.getEmail()%></p>
						<p class="card-text"><%=c.getAbout()%></p>
						<a href="editContact.jsp?cid=<%=c.getId()%>"
							class="btn btn-success">Edit</a> 
						<a href="delete?cid=<%=c.getId()%>" class="btn btn-danger">Delete</a>
						<div class="text-center"></div>
					</div>
				</div>
			</div>

			<%
			}
			}
			%>


		</div>
	</div>




	<div style="margin-top: 330px;">
		<%@include file="component/footer.jsp"%>
	</div>
</body>
</html>