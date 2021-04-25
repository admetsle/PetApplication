<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	margin: 0;
	font-family: Arial, Helvetica, sans-serif;
}

.navbar-top {
	overflow: hidden;
	background-color: #333;
	font-family: Arial, Helvetica, sans-serif;
	position: fixed;
		top: 0;
		width:80%;
	
}

.navbar-top a {
	float: left;
	font-size: 16px;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}
.navbar-top a:hover {
	background: silver;
	color: black;
}


.navbar {
	overflow: hidden;
	background-color: #333;
	position: fixed;
	bottom: 0;
	width: 100%;
}

.navbar a {
	float: left;
	display: block;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

.navbar a:hover {
	background: silver;
	color: black;
}

.navbar a.active {
	background-color: #4CAF50;
	color: white;
}


	.main {
  padding: 16px;
    margin-top: 30px;
  margin-bottom: 30px;
  height: 1500px; /* Used in this example to enable scrolling */
}
.websitename a:hover{
		background-color: White;
		color:black;
	
}
</style>
</head>
<body>

	<div class="navbar-top">
	<!-- <div class="websitename" style="font-size:16px">
		<a href="#">PetWorld- World for pet lovers!</a></div> -->
		<a href="<c:url value='listallpets'/>">Home</a> 
		
		<a href="https://en.wikipedia.org/wiki/Pet">News</a>
		<a href="<c:url value='addpet'/>">Add Pet</a> 
	</div>

	<div class="navbar">
		<a href="contact.jsp">Contact</a> 
		<a href="mailto:petworld@yahoo.com">Mail</a> 
		<!-- <a href="about.jsp">About</a> -->
		<div class="copyright">
		<a>Copyright &copy; 2020 Petpeers </a>
		</div>
	</div>
</body>
</html>
