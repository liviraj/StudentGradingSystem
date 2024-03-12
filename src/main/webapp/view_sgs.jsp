<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>view</title>
<style type="text/css">
h1 {
	background-color: floralwhite;
}
</style>
<link rel="stylesheet" href="bootstrap.min.css">
<script src="bootstrap.min.js"></script>
<script src="jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<!-- Include DataTables CSS files -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/fixedheader/3.2.3/css/fixedHeader.dataTables.min.css">

<!-- Include DataTables JS files -->
<script type="text/javascript"
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/fixedheader/3.2.3/js/dataTables.fixedHeader.min.js"></script>
<script>
	function msg1(id){
		var idValue = id;
		var c=confirm("Are You Sure");
		if(c==true)
			{
				location.href="StudentController?action=delete&studentId="+idValue; 
			}/* else{
				location.reload();
			} */
		
	}
	
	function addMarks(id){
		var idValue = id;	
		location.href="StudentMarkController?action=addMark&studentId="+idValue; 
	}
	
	function viewMarks(id){
		var idValue = id;	
		location.href="StudentMarkController?action=viewMark&studentId="+idValue; 
	}
</script>

<script type="text/javascript">
$(document).ready(function () {
    // Setup - add a text input to each footer cell
    $('#example thead tr')
        .clone(true)
        .addClass('filters')
        .appendTo('#example thead');
 
    var table = $('#example').DataTable({
        orderCellsTop: true,
        fixedHeader: true,
        initComplete: function () {
            var api = this.api();
 
            // For each column
            api
                .columns()
                .eq(0)
                .each(function (colIdx) {
                    // Set the header cell to contain the input element
                    var cell = $('.filters th').eq(
                        $(api.column(colIdx).header()).index()
                    );
                    var title = $(cell).text();
                    $(cell).html('<input type="text" placeholder="' + title + '" />');
 
                    // On every keypress in this input
                    $(
                        'input',
                        $('.filters th').eq($(api.column(colIdx).header()).index())
                    )
                        .off('keyup change')
                        .on('change', function (e) {
                            // Get the search value
                            $(this).attr('title', $(this).val());
                            var regexr = '({search})'; //$(this).parents('th').find('select').val();
 
                            var cursorPosition = this.selectionStart;
                            // Search the column for that value
                            api
                                .column(colIdx)
                                .search(
                                    this.value != ''
                                        ? regexr.replace('{search}', '(((' + this.value + ')))')
                                        : '',
                                    this.value != '',
                                    this.value == ''
                                )
                                .draw();
                        })
                        .on('keyup', function (e) {
                            e.stopPropagation();
 
                            $(this).trigger('change');
                            $(this)
                                .focus()[0]
                                .setSelectionRange(cursorPosition, cursorPosition);
                        });
                });
        },
    });
});
</script>
</head>
<body>
	<div>
		<center>
			<h1>Student Grading System</h1>
		</center>

		<center>
			<p>
				<font size="5">Student Information</font>
			</p>
		</center>
		<center>
			<span style="color: red">${msg} </span>
		</center>
		<div class="row">
			<div class="col-md-11"></div>
		
		<div class="col-md-1">
			<form action="LogoutController">
				<input type="submit" name="submit" value="logout" class="btn btn-danger">
			</form>
			<input type="hidden" name="confirm" id="confirm" value=""></input>
		</div>
		</div>
		<br>
		<table id="example" class="table">
			<thead>
				<tr class="danger">
					<th>Roll No</th>
					<th>Name</th>
					<th>Date Of Birth</th>
					<th>Gender</th>
					<th>Father Name</th>
					<th>Semester</th>
					<th>Department</th>
					<th>Pass-Out Year</th>
					<th colspan="1"><a href="StudentController?action=add">Add
							New</a></th>
				</tr>
			</thead>
			<c:forEach items="${details}" var="detail">
				<tr>
					<td><c:out value="${detail.rollNo}"></c:out></td>
					<td><c:out value="${detail.name}"></c:out></td>
					<td><c:out value="${detail.dob}"></c:out></td>
					<td><c:out value="${detail.gender}"></c:out></td>
					<td><c:out value="${detail.fatherName}"></c:out></td>
					<td><c:out value="${detail.semester}"></c:out></td>
					<td><c:out value="${detail.department}"></c:out></td>
					<td><c:out value="${detail.completedYear}"></c:out></td>
					<td><a
						href="StudentController?action=update&studentId=<c:out value="${detail.studentId}"/>"><button>Update</button></a>
						<a><button onclick="msg1(${detail.studentId})">Delete</button></a>
						<a><button onclick="addMarks(${detail.studentId})">Add
								Marks</button></a> <a><button onclick="viewMarks(${detail.studentId})">View
								Marks</button></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</body>
</html>
