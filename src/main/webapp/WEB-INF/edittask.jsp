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
         <h1 class="container bgcolorheader">
   		   <div class="container d-flex justify-content-between bgcolorheader">
			   <div>
			      <c:out value="${task.taskname}" />
			   </div>
			   <div>
			      <a href="/logout" class="col-sm">Log Out</a> 
			   </div>
			</div>  
		</h1>
      <div class="container ontainer1">
         <div class="container bgcolor row1 d-flex flex-row mb-3" height="800">
            <div>
               <img src="/images/discussion.jpeg" alt="Logo" width="200" height="200" class="d-inline-block align-text-top">
            </div>
            <div>
               <form:form action="/tasks/update" method="post" modelAttribute="task" width="800" height="200">
                  <input type="hidden" name="_method" value="put"/>
                  <form:hidden path="id"/>
                  <form:hidden path="tutor"/>
                  <div class="p-2 input-group">
                     <form:label path="taskname" class="col-form-label label">TaskName</form:label>
                     <form:input path="taskname" class="form-controL"/>
                     <form:errors path="taskname" class="form-control errormesg"/>
                  </div>
                  <div class="p-2 input-group">
                     <form:label path="address" class="col-form-label label">Location</form:label>
                     <form:input path="address" class="form-control"/>
                     <form:errors path="address" class="form-control errormesg"/>
                  </div>
                  <div class="p-2 input-group">
                     <form:label path="description" class="col-form-label label">Description</form:label>
                     <form:textarea path="description" class="form-control textarea" id="addon-wrapping"/>
                     <form:errors path="description" class="form-control errormesg"/>
                  </div>
                  		
               <div class="form-row  d-flex mb-3 justify-content-around">
                  <button class="buttons btn btn-primary">Submit</button>
               </div>
               
            </div>

         </form:form>
       </div>
         <div class="form-row  d-flex mb-3 justify-content-start">
         <div class="p-2">
            <a href="/tasks/${task.id}/delete"><button class="buttons btn btn-primary btnmargin">Delete</button></a> 
            </div>
            <div class="p-2">
            <a href="/tasks"><button class="buttons btn btn-primary btnmargin">Cancel</button></a>
            </div>
         </div>
      </div>
   </body>
</html>