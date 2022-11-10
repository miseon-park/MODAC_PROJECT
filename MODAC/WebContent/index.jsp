<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>


<style>

#where{
        background-color: rgb(230, 213, 184);
        text-align: center;
        width: 500px;
        height: 150px;
        margin: auto;
        width: 50%;
        line-height: 150px;
		color: rgb(74, 57, 51);
        font-size: 30px;
		border: 3px dotted rgb(74, 57, 51);
}

#buttons {
	text-align: center;
}

#btn-campInfo {
	background-color: rgb(240, 165, 0);
	color:white;
	font-size: 17px;
	width: 300px;
	height: 45px;
}
#btn-notice {
	background-color: gray;
	color: white;
	font-size: 17px;
	width: 300px;
	height: 45px;
	
}
#buttons button {
	border: 0;
	outline: 0;
	border-radius: 4px;
}


#gall-title{
	border-top: 2px solid rgb(240, 165, 0);
	border-bottom: 2px solid rgb(240, 165, 0);
	color: rgb(74, 57, 51);
	font-size: 25px;
	font-weight: bold;
	margin-left: 7%;
	margin-right: 7%;
	padding: 15px 10px 15px 50px;

}

#gall {
	border: 1px solid rgb(240, 165, 0);
	margin-top: 10px;
	margin-left: 10%;
	margin-right: 10%;
}

</style>



</head>
<body>

	<%@ include file="/views/common/menubar.jsp" %>


	<!-- 사이트 소개 이미지 -->

    <div id="where">
        " 오늘은 어디로 갈까? "
    </div>

	<br> <br>

	<div id="buttons">
		<button id="btn-campInfo" onclick="location.href=''">캠핑장 검색으로</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button id="btn-notice" onclick="location.href=''">모닥불 이야기로</button>
	</div>


	<br> <br> <br>

	<div id="gall-title">
		인기 갤러리
	</div>
	
	<br>

	<div id="gall">
		사진스타그램 top5 자리
	</div>



</body>
</html>