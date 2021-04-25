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
}

.navbar-top a {
	float: left;
	font-size: 16px;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.dropdown {
	float: right;
	overflow: hidden;
}

.dropdown .dropbtn {
	font-size: 16px;
	border: none;
	outline: none;
	color: white;
	padding: 14px 16px;
	background-color: inherit;
	font-family: inherit;
	margin: 0;
}

.navbar-top a:hover, .dropdown:hover .dropbtn {
	background-color: green;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	float: none;
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.dropdown-content a:hover {
	background-color: silver;
}

.dropdown:hover .dropdown-content {
	display: block;
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
	margin-bottom: 30px;
}
</style>
</head>
<body>

	<div class="navbar-top">
		<a href="listallpets">Home</a> 
		<a href="https://en.wikipedia.org/wiki/Pet">News</a>
		<a href="addpet">Add Pet</a> 
		<a href="getbuypet">Buy pet</a>
		<div class="dropdown">
			<button class="dropbtn">
				<%= request.getParameter("userName") %> <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<a href="listownedpets">Owned Pets</a> 
				<a href="logout">Logout</a>
			</div>
		</div>
	</div>

	<div class="navbar">
		<a href="contact.jsp">Contact</a> 
		<a href="mailto:petpeers@example.com">Mail</a> 
		<a href="about.jsp">About</a>
		<a>Copyright &copy; 2020 Petpeers </a>
	</div>
</body>
</html>
