<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<button onclick="test();">검색</button>
	<table id="resulttable" border = "1" style = "text-align:center">
		<thead>
			<tr>
				<th>LOCATION_1</th>
				<th>LOCATION_2</th>
				<!-- <td>CAMP_NAME</td>
                        <td>ADDRESS</td>
                        <td>CAMP_NO</td>
                        <td>CAMP_CALL</td>
                        <td>CAMP_WEB</td>
                        <td>CAMP_CONTENT</td> -->
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>
	<script>
		function test() {
			$.ajax({
				url : "option.ci",
				success : function(result) {

					let str = "";

					for (let i = 0; i < result.length; i++) {
						str += "<tr>" + "<td>" + result[i].location_1 + "</td>"
								+ "<td>" + result[i].location_2 + "</td>"
						//    +"<td>"+ result[i].CAMP_NAME +"</td>"
						//    +"<td>"+ result[i].ADDRESS +"</td>"
						//    +"<td>"+ result[i].CAMP_NO +"</td>"
						//    +"<td>"+ result[i].CAMP_CALL +"</td>"
						//    +"<td>"+ result[i].CAMP_WEB +"</td>"
						//    +"<td>"+ result[i].CAMP_CONTENT +"</td>"
						str + "</tr>";
					}

					$("#resulttable tbody").html(str);
				},
				error : function() {
					console.log("으악");
				}
			});
		}
	</script>
</body>
</html>