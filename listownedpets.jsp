<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC â€œ-//W3C//DTD HTML 4.01//ENâ€ â€œhttp://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of Owned pets</title>
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
        body {
            font-family: verdana;
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
           a, a:AFTER {
            color: blue;
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
            <a href="listownedpets">Owned Pets</a> 
            <a href="logout.jsp">Logout</a>
        </div>
    </div>
<%@ include file="headerfooter.jsp" %>
<div class="main" align="center">
    
    <h3>List of Owned Pets </h3>
    <c:if test="${!empty petList}">
    <table class="petTable">
    <tr>
        <th width="40">Pet Id</th>
        <th width="80">Pet Type</th>
        <th width="80">Pet Age </th>
        <th width="100">Pet Breed</th>
        <th width="80">Pet Price</th>
     
       
    </tr>
 <c:forEach items="${petList}" var="pet">
        <tr>
                <td>${pet.petId}</td>
                <td>${pet.petType}</td>
                <td>${pet.petAge}</td>
                <td>${pet.petBreed}</td>
                <td>${pet.price}</td>                                            
              
        </tr>
    </c:forEach>
    </table>
</c:if>
</div>
</body>
</html>