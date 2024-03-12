<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap.min.css">
<script src="bootstrap.min.js"></script>
<script src="jquery.min.js"></script>

<title>server registration</title>
<style type="text/css">
h1{
		background-color: floralwhite;
	}
</style>
<script>
var val1=$("#sel1").val();
if(val1=='' || val1==0)
	{
 	$(document).ready(function(){
  		$('#sel1').val("---select---");
  		$('#sel2').val("---select---");
  		$('#sel3').val("---select---");
  	});
	}
else{
  	$(document).ready(function(){
  		$('#sel1').val('${details.gender}');
  		$('#sel2').val('${details.department}');
  		$('#sel3').val('${details.semester}');
  	});
}
  </script>
  <script>
  /* function validate()	
  {
	  var name=$("#name").val();
	  var team=$("#sel1").val();
	  var place=$("#sel2").val();
	  var salary=$("#salary").val();
	  
	   if(name==null || name=='')
		  {
		   	$("#sname").html("Name Requried");
		  	$("#errname").show();
		  	$("#errteam").hide();
		  	$("#errplace").hide();
		  	$("#errsalary").hide();
			return false;
		  	
		  }
	  else if (team==null || team=='') {
		  $("#steam").html("Team Requried");
		  	$("#errname").hide();
		  	$("#errteam").show();
		  	$("#errplace").hide();
		  	$("#errsalary").hide();
		  	return false;
	}
	  else if(place==null || place==''){
		  $("#splace").html("place Requried");
		  $("#errname").hide();
		  	$("#errteam").hide();
		  	$("#errplace").show();
		  	$("#errsalary").hide();
		  	return false;
	  }
	  else if(salary==null || salary==''){
		  $("#ssalary").html("salary Requried");
		  $("#errname").hide();
		  	$("#errteam").hide();
		  	$("#errplace").hide();
		  	$("#errsalary").show();
		  	return false;
	  }
	   return true;
  } */
  </script>
  </head>

<body>
<form action="StudentController" method="post" name="rform" >
<center><h1>Student Grading System</h1></center>
<div class="container">
<input  type="hidden" name="studentId" value="${details.studentId}">
	<h2>Student Registration</h2>
	
	<div class="col-xs-4">
	<div>
	<label>Roll No<span style="color: red">*</span></label><br><span style="color: red">${msg}</span>
	<div id="errname">
		<span style="color: red" id="sname"></span>
	</div>
	<input id="rollNo" class="form-control" type="text" name="rollNo" value="${details.rollNo}"  placeholder="Enter roll no">
	<br>
	
	<label>Name<span style="color: red">*</span></label><br><span style="color: red">${msg}</span>
	<div id="errname">
		<span style="color: red" id="sname"></span>
	</div>
	<input id="name" class="form-control" type="text" name="name" value="${details.name}"  placeholder="Enter student name">
	
	<br>
	
	<label>Date Of Birth<span style="color: red">*</span></label><br><span style="color: red">${msg}</span>
	<div id="errname">
		<span style="color: red" id="sname"></span>
	</div>
	<input id="dob" class="form-control" type="date" path="dob" class= "date" name="dob" pattern="dd-MM-yyyy"  value="${details.dob}"/>
	
	<br>
	
	<label>Gender<span style="color: red">*</span></label>
	<div class="form-group">
	<div id="errteam">
		<span style="color: red" id="steam"></span>
	</div>
    <select  class="form-control" name="gender" id="sel1"  value="${details.gender}"> 
        <option value="" hidden>---select---</option>
        <option value="Male">Male</option>
        <option value="Female">Female</option>
       </select>
      </div>
      
	<br>
	
	<label>Father Name<span style="color: red">*</span></label><br><span style="color: red">${msg}</span>
	<div id="errname">
		<span style="color: red" id="sname"></span>
	</div>
	<input id="fatherName" class="form-control" type="text" name="fatherName" value="${details.fatherName}"  placeholder="Enter father name">
	
	<br>
	
	<label>Department<span style="color: red">*</span></label>
	<div class="form-group">
	<div id="errplace">
		<span style="color: red" id="splace"></span>
	</div> 
        <select  class="form-control" name="department" id="sel2"  value="${details.department}">
        	<option value="" hidden>---select---</option>																																																																																																																																																																																																																																																																																																											>---select---</option>
        	<option value="BCA">BCA</option>
        	<option value="BSc">BSc</option>
        	<option value="BBA">BBA</option>
        </select>
      </div>
	<br>
	
	<label>Semester<span style="color: red">*</span></label>
	<div class="form-group">
	<div id="errplace">
		<span style="color: red" id="splace"></span>
	</div> 
        <select  class="form-control" name="semester" id="sel3"  value="${details.semester}">
        	<option value="" hidden>---select---</option>																																																																																																																																																																																																																																																																																																											>---select---</option>
        	<option value="1">1</option>
        	<option value="2">2</option>
        	<option value="3">3</option>
        	<option value="4">4</option>
        	<option value="5">5</option>
        	<option value="6">6</option>
        </select>
      </div>
		<br>
		<label>Pass-Out Year<span style="color: red">*</span></label>
	<div class="form-group">
	<div id="errplace">
		<span style="color: red" id="splace"></span>
	</div> 
        <select  class="form-control" name="semester" id="sel3"  value="${details.completedYear}">
        	<option value="" hidden>---select---</option>																																																																																																																																																																																																																																																																																																											>---select---</option>
        	<option value="2020">2020</option>
        	<option value="2021">2021</option>
        	<option value="2022">2022</option>
        	<option value="2023">2023</option>
        </select>
      </div>
		<br>
		<div class="col-xs-2">
		<input  class="btn btn-info" type="submit" name="submit"  value="${name}" onclick="return validate()"></input>
		</div>
      <button  class="btn btn-info" type="reset" style="position: relative;left: 40px">Reset</button>
      <button  class="btn btn-info" style="position: relative;left: 50px" type="submit" value="Cancel" name="submit">Cancel</button>
	</div>
	</div>
	</div>
</form>
</body>
</html>