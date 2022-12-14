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
      <title>Classes</title>
      <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
      <link rel="stylesheet" href="/main.css">
      <!-- change to match your file/naming structure -->
      <script src="/webjars/jquery/jquery.min.js"></script>
      <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
   </head>
   <body>
		<h1>
		   <div class="container d-flex justify-content-between bgcolorheader">
			   <div>
			      Hello
			      <c:out value="${tutor.tutorname}" />
			   </div>
			   <div>
			      <a href="/logout" class="col-sm">Log Out</a> 
			   </div>
			</div>   
		</h1>

         <div class="container bgcolor" height="800">
         <div class="row">
            <p class=col_sm>Task Schedule</p>
            <a href="tasks/new"><button>New Task</button></a> 
         </div>
         <table class="table table-striped">
            <thead>
               <tr>
                  <td scope="col">Task Name</td>
                  <td scope="col">Location</td>
                  <td scope="col">Action</td>
               </tr>
            </thead>
            <tbody>
               <c:forEach var="task" items="${mytasks}">
                  <tr>
                     <td scope="col">
          
                        	<a href="/tasks/${task.id}/view" class="hreftext"><c:out value="${task.taskname}"/></a>
                       	
                     </td>
                     <td scope="col">
                        	<c:out value="${task.address}"/>
                     </td>
                     <td scope="col">
                        <a href="/tasks/${task.id}/edit" class="hreftext">Edit</a>
                     </td>
                  </tr>
        	 </c:forEach>

             <c:forEach var="task" items="${othertasks}">
                  <tr>
                     <td scope="col">
                        <a href="/tasks/${task.id}/view"><c:out value="${task.taskname}"/></a>
                     </td>
                     <td scope="col">
                        	<c:out value="${task.address}"/>

               </c:forEach>
            </tbody>
         </table>
 
      </div>
   </body>
</html>