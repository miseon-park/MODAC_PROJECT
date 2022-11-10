<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
    <style>
        #wrapper{
            border: 10px solid #F0A500;
            width: 550px;
            height: 800px;
            margin: auto;
            padding-top: 50px;
        }
        h1{
            text-align: center;
            color: #F0A500;
        }
         #wrapper div{
            padding: 20px;
            padding-left: 50px;
        }

        span{
            font-size: 20px;
            box-sizing: border-box;
        }
        div>#id{
            margin-left: 90px;
            height: 30px;
        }

        div>#email, div>#nickname{
            margin-left: 90px;
            height: 30px;
            width: 260px;
        } 
        div>p{
            font-size: 2px;
            margin-top: 5px;
            color: gray;
        }

        div>#password{
            margin-left: 70px;
            height: 30px;
            width: 260px;
        }
        div>#checkpassword{
            margin-left: 20px;
            height: 30px;
            width: 260px;
        }
        div>#name{
            margin-left: 110px;
            height: 30px;
            width: 260px;

        }
        div>#checkId{
            width: 90px;
            height: 30px;
            background-color: #F0A500;
            color: white;
            border: none;
        }
        input[type=submit]{
            margin-top: 40px;
            margin-left: 130px;
            width: 300px;
            height: 50px;
            background-color: #F0A500;
            color: white;
            border: none;
            
        }



    </style>
</head>
<body>
    <div id="wrapper">
        <h1>회원가입</h1>
        <hr>
        <form action ="<%=contextPath %>/login.me"  method="post">
        <div id="insertId">
            <span>아이디</span>
            <input id="id" type="text" placeholder="아이디입력" required>
            <button id="checkId">아이디 확인</button>
            <p>영문자로 시작하는 5~15자 이내의 영문,숫자로 구성 가능</p>
        </div>
        <div>
            <span>비밀번호</span>
            <input id="password" type="password" placeholder="비밀번호" required>
            <p>5~20자 이내의 영문,숫자,특수문자(!@#$%^&*)로 구성가능</p>
        </div>
        <div>
            <span>비밀번호 확인</span>
            <input id="checkpassword" type="password" placeholder="비밀번호 확인" required>
        </div>
        <div>
            <span>이름</span>
            <input id="name"type="text" placeholder="이름" required>
        </div>
        <div>
            <span>이메일</span>
            <input id="email" type="text" placeholder="이메일" required>
        </div>
        <div>
            <span>닉네임</span>
            <input id="nickname" type="text" placeholder="닉네임" required>
            
        </div>
        <input type="submit" value="회원가입" required>
		</form>
    </div>
</body>
</html>