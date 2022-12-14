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
    <title>Tutoring App -to track the tasks</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
     <link rel="stylesheet" href="/main.css">    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
         <h1 class="container bgcolorheader"> Welcome to Tutoring Platform </h1>    
		
		<div class="container container-fluid text-bg-primary p-3 bgcolor">
    
        <div class="row">
            <form:form action="/register" method="post" modelAttribute="tutor" class="col-sm">
                <h2>New Tutor Registration</h2>
                <div>
                    <form:label path="tutorname" class="col-form-label label">Name</form:label>
                    <form:input path="tutorname" class="form-control"/>
                    <form:errors path="tutorname" class="form-control errormesg"/>
                </div>
                <div>
                    <form:label path="email" class="col-form-label label">Email</form:label>
                    <form:input path="email" class="form-control"/>
                    <form:errors path="email" class="form-control errormesg"/>
                </div>
                <div>
                    <form:label path="password" class="col-form-label label">Password</form:label>
                    <form:input path="password" type="password" class="form-control"/>
                    <form:errors path="password" class="form-control errormesg"/>
                </div>
                <div>
                    <form:label path="confirmPass" class="col-form-label label">Confirm Password</form:label>
                    <form:input path="confirmPass" type="password" class="form-control"/>
                    <form:errors path="confirmPass" class="form-control errormesg"/>
                </div>
                <button class="buttons btn btn-primary btnmargin">Register</button>
            </form:form>
            <form:form action="/login" method="post" modelAttribute="loginUser" class="col-sm">
                <h2>Already a member? Log in here!</h2>
                <div>
                    <form:label path="email" class="col-form-label label">Email</form:label>
                    <form:input path="email" class="form-control"/>
                    <form:errors path="email" class="form-control errormesg"/>
                </div>
                <div>
                    <form:label path="password" class="col-form-label label">Password</form:label>
                    <form:input path="password" type="password" class="form-control"/>
                    <form:errors path="password" class="form-control errormesg"/>
                </div>
                <button class="buttons btn btn-primary btnmargin">Log in</button>
            </form:form>
        </div>
    </div>
</body>
</html>