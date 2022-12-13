<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>View Tasks</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<a href="/logout">logout</a>
		
		<div class="container">
			<h1><c:out value="${task.taskname}"/> with <c:out value="${task.tutor.tutorname}"/></h1>
			<div>
				<label class="labels"> Address </label>
				<span ><c:out value="${task.address}"/></span>
			</div>
			<div>
				<label class="labels"> Description :</label>
				<span style="color: darkgreen;"><c:out value="${task.description}"/></span>
			</div>
		</div>
	
	</div>

</body>
</html>