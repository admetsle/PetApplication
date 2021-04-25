<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Petpeers-Add pets</title>

<style type="text/css">
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
    background-color: lightgrey;
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
                    <a href="<c:url value='index.jsp'/>">${"Login"}</i></a>
                </c:when>
                <c:otherwise>
                    <h3> ${checkuser.userName}<i class="arrow down"></i></h3>
                </c:otherwise>
            </c:choose>
        </button>
        <div class="dropdown-content">
            <a href="listownedpets">Owned Pets</a> 
            <a href="logout.jsp">Logout</a>
        </div>
    </div>
    <%@ include file="headerfooter.jsp" %>
<div class="main">    
<div align="center">
            
                <fieldset><legend><h3 style="color: pale-green;">Add Pets Here</h3></legend>
                <form:form action="pet/add" commandName="pet" method="post">
            
                    <table>
            <c:if test="${!empty pet.id}">
                <tr>
                    <td><font face="verdana" size="2px">Pet Id</font></td>
                    <td>:</td>
                    <td><form:input path="id" readonly="true" size="8"
                            disabled="true" /> <form:hidden path="petId" /> <%-- To hide the book id--%></td>
                </tr>
            </c:if>
            <tr>
                <td>Pet Type :</td>
                <td><input type="text" name="petType" placeholder="Dog/Cat/Birds/Others"></td>
            </tr>
            <tr>
                <td>Pet Breed :</td>
                <td><input type="text" name="petBreed"></td>
            </tr>
            <tr>
                <td>Pet Age :</td>
                <td><input type="number" name="petAge"></td>
            </tr>
            <tr>
                <td>Pet Price :</td>
                <td><input type="number" name="price"></td>
            </tr>
            <tr>
                <td>Contact Details :</td>
                <td><input type="text" name="contact" placeholder="Address/Phone No."></td>
            </tr>
            <tr><td><input type="hidden" name="petStatus" value="Buy" /></td></tr>
            <tr>
                <td><input type="submit" name="submit" value="Add Pet">
                </td>
            </tr>
        </table>
    </form:form>
            </fieldset>
    </div>
    </div>
    
</body>
</html>