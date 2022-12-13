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
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
    
    	<h1 class="text-center text-info">Tutors Platform</h1>
        <div class="row">
            <form:form action="/register" method="post" modelAttribute="tutor" class="col-sm">
                <h2>New Tutor</h2>
                <div>
                    <form:label path="tutorname">Name</form:label>
                    <form:input path="tutorname"/>
                    <form:errors path="tutorname" class="text-danger"/>
                </div>
                <div>
                    <form:label path="email">Email</form:label>
                    <form:input path="email"/>
                    <form:errors path="email" class="text-danger"/>
                </div>
                <div>
                    <form:label path="password">Password</form:label>
                    <form:input path="password" type="password"/>
                    <form:errors path="password" class="text-danger"/>
                </div>
                <div>
                    <form:label path="confirmPass">Confirm Password</form:label>
                    <form:input path="confirmPass" type="password"/>
                    <form:errors path="confirmPass" class="text-danger"/>
                </div>
                <button>Register</button>
            </form:form>
            <form:form action="/login" method="post" modelAttribute="loginUser" class="col-sm">
                <h2>Already a member? Log in here!</h2>
                <div>
                    <form:label path="email">Email</form:label>
                    <form:input path="email"/>
                    <form:errors path="email" class="text-danger"/>
                </div>
                <div>
                    <form:label path="password">Password</form:label>
                    <form:input path="password" type="password"/>
                    <form:errors path="password" class="text-danger"/>
                </div>
                <button>Log in</button>
            </form:form>
        </div>
    </div>
</body>
</html>