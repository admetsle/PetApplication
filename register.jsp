<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Here!-PetWorld</title>


<style type="text/css">
body {
	font-family: comic sans ms;
	font-size: 12px;
	 margin: 60px; 
	background-color:silver;
		
}


</style> 

</head>
<body>
	<div align="center">
		 <fieldset> 
			<legend>
				<h1>Create New Account</h1>
			</legend><br>
			<form:form action="register.html" commandName="user" method="POST">
				<table>
					<c:if test="${!empty user.id}">
						<tr>
							<td><font face="comic sans ms" size="2px">User ID</font></td>
							<td>:</td>
							<td><form:input path="id" readonly="true" size="8"
								disabled="true" /> <form:hidden path="id" /> <%-- To hide the book id--%></td>
						</tr>
					</c:if>
					<tr>
						<td><font face="comic sans ms" size="2px">Name</font></td>
						<td>:</td>
						<td><input type="text" name="userName" />
					</tr>
					<tr>
						<td><font face="comic sans ms" size="2px">Mobile No.</font></td>
						<td>:</td>
						<td><input type="text" name="contactNo" />
					</tr>

					<tr>
						<td><font face="comic sans ms" size="2px">Email Id</font></td>
						<td>:</td>
						<td><input  type="text" name="email" /></td>
					</tr>
					<tr>
						<td><font face="comic sans ms" size="2px">Password</font></td>
						<td>:</td>
						<td><input  type="text" name="password" /></td>
					</tr>
					<tr>
						<td><input type="hidden" value="Buy" name="status"></td>						
					</tr>
					
					<tr align="center">
						<td ><br><input  type="submit" value="Register" /></td>
					</tr>
				</table>
			</form:form>
		 </fieldset> 
	</div>
</body>
</html>