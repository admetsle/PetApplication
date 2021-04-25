<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PET Details</title>
<style type="text/css">.dropbtn {
	position: fixed;
	background-color: lightblue;
	font-family: comic sans ms;
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
     
}

.dropdown {
	position: relative;
	display: inline-block;
	float: right;
	width: 20%;
    margin-top: 15px;
}

.dropdown-content {
	display: none;
	position: absolute;
	width: 20%;
	background-color: lightgrey;
	min-width: 200px;
	z-index: 1;
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
	background-color: lightblue;
}
 .main {
    margin-top: 30px;
  margin-bottom: 30px;
  height: 300px; /* Used in this example to enable scrolling */
}

</style>
</head>
<body>
<div class="dropdown">
		<button class="dropbtn">
			<c:choose>
				<c:when test="${empty checkuser.userName}">
					<a href="<c:url value='index.jsp'/>">${"Login"}</a>
				</c:when>
				<c:otherwise>
					<h3>${checkuser.userName}</h3>
				</c:otherwise>
			</c:choose>
		</button>
		<div class="dropdown-content">
			<a href="listownedpets.jsp">Owned Pets</a> 
			<a href="logout.jsp">Logout</a>
		</div>
	</div>
<%@ include file="headerfooter.jsp" %>
<div class="main" align="center">
<c:if test="${!empty petList}">
<fieldset><legend><h3>Details of pet, you wish to buy!</h3></legend>
    <table class="petTable">
        <tr><td>Pet Id</td><td>:</td><td>${petList.petId}</td></tr>
        <tr><td>Pet Type</td><td>:</td><td>${petList.petType}</td></tr>
        <tr><td>Pet Age </td><td>:</td><td>${petList.petAge}</td></tr>
        <tr><td>Pet Breed</td><td>:</td><td>${petList.petBreed}</td></tr>
        <tr><td>Pet Price</td><td>:</td><td>${petList.price}</td></tr>
    
        <tr><td>Contact Details</td><td>:</td><td>${petList.contact}</td></tr>       
		<tr><td><a href="<c:url value='/buypet/${petList.petId}'/>"><button>Buy this pet</button></a></td></tr>
		
</table>
</fieldset>
</c:if>
</div>
<br><br><div class="message"><span class="bgcolor" >${message}</span></div>
</body>
</html>
