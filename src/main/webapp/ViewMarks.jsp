<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>view</title>
<style type="text/css">
h1{
		background-color: floralwhite;
	}
</style>
 <link rel="stylesheet" href="bootstrap.min.css">
<script src="bootstrap.min.js"></script>
<script src="jquery.min.js"></script>
<script>
	function viewMarks(id){
		var idValue = id;	
		location.href="StudentMarkController?action=viewMark&studentId="+idValue; 
	}
</script>
</head>
<body>
<div class="container">
<center><h1>Student Grading System</h1></center>
	
	<center><p><font size="5">Student Marks Information</font></p></center>
	<center><span style="color: red">${msg} </span></center>
	<form action="LogoutController">
				<input type="submit" name="submit" value="logout" style="position:relative; left: 1000px" class="btn btn-danger">
	</form>
	<input type="hidden" name="confirm" id="confirm" value=""></input>
	<center><table border="3" class="table">
		<tr class="danger">
		<th>Department</th>
		<th>Semester</th>
		<th>Subject</th>
		<th>Mark</th>
		</tr>
			<c:forEach items="${marks}" var="mark">
			<tr>
				<td><c:out value="${marks.department}"></c:out></td>
				<td><c:out value="${marks.semesterId}"></c:out></td>
				<td><c:out value="${marks.dob}"></c:out></td>
				<td><c:out value="${marks.gender}"></c:out></td>
			</tr>
			</c:forEach>
			</table></center></div>
</body>
</body>
</html>