<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes  -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New task</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class=container>
	<h1>Create a new Project</h1>
	<a href="/classes"><button>Cancel</button></a>
	<form:form action="/tasks/create" method="post" modelAttribute="task">
		<div class="form-group">
			<form:label path="taskname">Name</form:label>
			<form:input path="taskname"/>
			<form:errors path="taskname"/>
		</div>
		<div class="form-group">
			<form:label path="address">Location</form:label>
			<form:input path="address"/>
			<form:errors path="address"/>
		</div>

		<div class="form-group">
			<form:label path="description">Description</form:label>
			<form:textarea path="description"></form:textarea>
			<form:errors path="description"/>
		</div>
		
		<button>Submit</button>
	</form:form>
<a href="/tasks"><button>Cancel</button></a>
</div>	
</body>
</html>