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
      <title>Dash board</title>
      <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
      <link rel="stylesheet" href="/main.css">
      <!-- change to match your file/naming structure -->
      <script src="/webjars/jquery/jquery.min.js"></script>
      <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
   </head>
   <body>
        <!--div class=navbar-brand><c:out value="${task.taskname}" /></div--!>
        
        <nav class="navbar bg-light">
 		 <div class="container-fluid">
		    <a class="navbar-brand" href="#">
   	   <img src="/images/discussion.jpeg" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
      <c:out value="${task.taskname}" />
    	</a>
  	</div>
	</nav>
      <div class="container"> 


		<form:form action="/tasks/update" method="post" modelAttribute="task">
			<input type="hidden" name="_method" value="put"/>
			<form:hidden path="id"/>
			<form:hidden path="tutor"/>
			<div class="p-2 d-flex justify-content-around input-group input-group-sm mb-3">
				<form:label path="taskname" class="col-sm-2 col-form-label">TaskName</form:label>
				<form:input path="taskname" class="form-control"/>
				<form:errors path="taskname"/>
			</div>

			<div class="p-2 d-flex justify-content-around input-group input-group-sm mb-3">
				<form:label path="address" class="col-sm-2 col-form-label">Location</form:label>
				<form:input path="address" class="form-control"/>
				<form:errors path="address"/>
			</div>
			
			<div class="p-2 d-flex justify-content-around input-group input-group-sm mb-3">
				<form:label path="description" class="col-sm-2 col-form-label">Description</form:label>
				<form:textarea path="description" class="form-control"/>
				<form:errors path="description"/>
			</div>
			
			<div class=form-row>
			<button class="buttons">Submit</button>
			<a href="/tasks/${task.id}/delete"><button>Delete</button></a> 
			<a href="/tasks"><button>Cancel</button></a>
		</div>
		</form:form>
	</div>
  </body>
</html>
      