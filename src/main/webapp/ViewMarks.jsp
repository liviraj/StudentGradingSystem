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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<script src="bootstrap.min.js"></script>
<script src="jquery.min.js"></script>
<script src="js/jspdf.debug.js"></script>

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
	function viewMarks(id) {
		var idValue = id;
		location.href = "StudentMarkController?action=viewMark&studentId="
				+ idValue;
	}
</script>
<script>
	function exportToCSV(tableId) {
		var csv = [];
		var rows = document.getElementById(tableId).querySelectorAll("tr");

		for (var i = 0; i < rows.length; i++) {
			var row = [], cols = rows[i].querySelectorAll("td, th");

			for (var j = 0; j < cols.length; j++)
				row.push(cols[j].innerText);

			csv.push(row.join(","));
		}

		var csvContent = "data:text/csv;charset=utf-8," + csv.join("\n");
		var encodedUri = encodeURI(csvContent);
		var link = document.createElement("a");
		link.setAttribute("href", encodedUri);
		link.setAttribute("download", "table_data.csv");
		document.body.appendChild(link);
		link.click();
	}

	function exportToPDF(tableId) {
		var pdf = new jsPDF('p', 'pt', 'letter');
		var source = document.getElementById(tableId);

		var specialElementHandlers = {
			'#bypassme' : function(element, renderer) {
				return true;
			}
		};

		pdf.fromHTML(source, 15, 15, {
			'width' : 800,
			'elementHandlers' : specialElementHandlers
		}, function(dispose) {
			pdf.save('table_data.pdf');
		});
	}

	function demoFromHTML() {
		var pdf = new jsPDF('p', 'pt', 'letter');

		source = $('#marksTable')[0];

		specialElementHandlers = {
			// element with id of "bypass" - jQuery style selector
			'#bypassme' : function(element, renderer) {
				// true = "handled elsewhere, bypass text extraction"
				return true
			}
		};
		margins = {
			top : 80,
			bottom : 60,
			left : 40,
			width : 522
		};
		// all coords and widths are in jsPDF instance's declared units
		// 'inches' in this case
		pdf.fromHTML(source, // HTML string or DOM elem ref.
		margins.left, // x coord
		margins.top, { // y coord
			'width' : margins.width, // max width of content on PDF
			'elementHandlers' : specialElementHandlers
		},

		function(dispose) {
			// dispose: object with X, Y of the last line add to the PDF 
			//          this allow the insertion of new lines after html
			pdf.save('Test.pdf');
		}, margins);
	}
</script>
<script type="text/javascript">
$(document).ready(function () {
    // Setup - add a text input to each footer cell
    $('#marksTable thead tr')
        .clone(true)
        .addClass('filters')
        .appendTo('#marksTable thead');
 
    var table = $('#marksTable').DataTable({
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
	<div class="container">
		<center>
			<h1>Student Grading System</h1>
		</center>

		<center>
			<p>
				<font size="5">Student Marks Information</font>
			</p>
		</center>
		<center>
			<span style="color: red">${msg} </span>
		</center>


		<div class="row">
			<div class="col-md-10"></div>
			<div class="col-md-1">
				<form action="LogoutController">
					<input type="submit" name="submit" value="logout"
						class="btn btn-danger">
				</form>
			</div>
			<div class="col-md-1">
				<a href="StudentMarkController?action=cancel">
					<button class="btn btn-info" class="btn btn-info">Close</button>
				</a>
			</div>
		</div>


		<input type="hidden" name="confirm" id="confirm" value=""></input>
		<center>
			<label>Percentage : <span style="color: red">${percentage}</span></label><br>
			<label>CGPA : <span style="color: red">${cgpa}</span></label><br>
			<div class="row">
				<div class="col-md-10"></div>
				<div class="col-md-1">
					<button onclick="exportToCSV('marksTable')" class="btn btn-info">
						<i class="fas fa-download"></i> CSV
					</button>
				</div>
				<!-- <div class="col-md-1">
					<button onclick="exportToPDF('marksTable')" class="btn btn-info"><i class="fas fa-download"></i> PDF</button>
				</div> -->
				<div class="col-md-1">
					<button class="btn btn-info" id="convert">
						<i class="fas fa-download"></i> Certificate
					</button>
				</div>
			</div>
			<div id="result">
				<!-- Result will appear be here -->
			</div>
			<br>
			<table border="3" class="table" id="marksTable">
				<thead>
					<tr class="danger">
						<th>Department</th>
						<th>Semester</th>
						<th>Subject</th>
						<th>Mark</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${marks}" var="mark">
						<tr>
							<td><c:out value="${mark.department}"></c:out></td>
							<td><c:out value="${mark.semesterId}"></c:out></td>
							<td><c:out value="${mark.subjectName}"></c:out></td>
							<td><c:out value="${mark.mark}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
				<a href="StudentMarkController?action=cancel">
					<button style="position: relative; left: 40px" class="btn btn-info"
						class="btn btn-info">Close</button>
				</a>
			</div>
		</center>
		<script type="text/javascript"
			src="https://github.com/niklasvh/html2canvas/releases/download/0.5.0-alpha1/html2canvas.js"></script>
		<script>
			//convert table to image            
			function convertToImage() {
				html2canvas(document.getElementById("marksTable"), {
					onrendered : function(canvas) {
						var img = canvas.toDataURL("image/png");

						// Create a hidden link element
						var link = document.createElement("a");
						link.href = img;
						link.download = "Certificate.png";

						// Simulate a click on the link
						link.click();

						// Remove the link from the document
						document.body.removeChild(link);
					}
				});
			}
			//click event
			var convertBtn = document.getElementById("convert");
			convertBtn.addEventListener('click', convertToImage);
		</script>
	</div>
</body>
</body>
</html>