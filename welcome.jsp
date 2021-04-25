<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PetWorld - Welcome to the world for Pet Lovers</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.dropbtn {
	position: fixed;
	background-color: lightblue;
	color: black;
	padding: 10px 59px;
	font-size: 12px;
	border: none;
	 top:0;
     right:0;
      margin-top: 0px;
     margin-right: 0px;
     line-height: 0px;
     	width: 20%;
     		font-weight: bold;
     	
     
}

.dropdown {
	position: relative;
	display: inline-block;
	float: right;
	width: 20%;
    margin-top: 15px;
    	font-weight: bold;
    		font-size: 12px;
    	
    
}

.dropdown-content {
	display: none;
	position: absolute;
	width: 20%;
	background-color: silver;
	min-width: 100%;
	z-index: 1;
		font-weight: bold;
			font-size:12px;	
}

.dropdown-content a {
	color: black;
	padding: 14px 16px;
	text-decoration: none;
	display: block;
	top:15%;
}

.dropdown-content a:hover {
	background-color: lightblue;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: silver;
}

body {
	font-family: comic sans ms;
	font-size: 12px;
	margin: 40px;
	

}


.petTable, .petTable td {
	border-collapse: collapse;
	border: 1px solid #aaa;
	margin: 2px;
	padding: 2px 2px 2px 10px;
	font-size: 12px;
}

.petTable th {
	font-weight: bold;
	font-size: 12px;
	background-color: lightblue;
	color: black;
}
.design{
color : black;
background-color: lightblue;
}

a, a:AFTER {
	color: blue;
}

.main {
	padding: 16px;
	margin-bottom: 30px;
	height: 800px; /* Used in this example to enable scrolling */
}


</style>
</head>
<body >
	<%@ include file="headerfooter.jsp"%>
	<div class="dropdown">
		<button class="dropbtn">
			<c:choose>
				<c:when test="${empty checkuser.userName}">
					<a href="<c:url value='index.jsp'/>">${"Login "}</a>
				</c:when>
				<c:otherwise>
					<h3>${checkuser.userName}<i class="arrow down"></i></h3>
				</c:otherwise>
			</c:choose>
		</button>
		<div class="dropdown-content">
			<a href="listownedpets">Owned Pets</a> 
			<a href="logout.jsp">Logout</a>
		</div>
	</div>
	
	<div class="main" align="center">
	<h1 class="design">Welcome to My World..Buy Me!!!</h1>
		<h2>List of all Pets</h2>
		<c:if test="${!empty petList}">
			<table class="petTable">
				<tr>
					<th width="40">Pet Id</th>
					<th width="80">Pet Type</th>
					<th width="60">Pet Age</th>
					<th width="80">Pet Breed</th>
					<th width="80">Pet Price</th>
					<th width="120">Contact Details</th>
					<th width="80">Pet Status</th>
				</tr>
				<c:forEach items="${petList}" var="pet">
					<tr>
						<td>${pet.petId}</td>
						<td>${pet.petType}</td>
						<td>${pet.petAge}</td>
						<td>${pet.petBreed}</td>
						<td>${pet.price}</td>
						<td>${pet.contact}</td>

						<td><c:set var="status" value="${pet.petStatus}" /> <c:choose>
								<c:when test="${status == 'Buy'}">
									<a href="<c:url value='/getbuypet/${pet.petId}'/>"><button>${"Buy"}</button></a>
								</c:when>
								<c:when test="${status == 'Sold'}">
   								  ${"Sold Out"}
 							</c:when>
							</c:choose></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
	<br>
	<br>
	<div class="message">
		<span class="bgcolor">${message}</span>
	</div>


</body>
</html>