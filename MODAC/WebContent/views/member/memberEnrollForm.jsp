<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
/*     String contextPath = request.getContextPath();
    
    String alertMsg = (String) session.getAttribute("alertMsg");  */
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

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
            width: 100px;
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

            border: none;
            
        }



    </style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
    <div id="wrapper">
        <h1>회원가입</h1>
        <hr>

        <form id="enroll-form"action ="<%=contextPath %>/insert.me"  method="post">
        <div id="insertId">
            <span>아이디</span>
            <input id="id" type="text" placeholder="아이디입력" name="memberId" required >

            <button type="button" id="checkId" onclick="idCheck();">아이디 확인</button>

            <p>영문자로 시작하는 5~15자 이내의 영문,숫자로 구성 가능</p>
        </div>
        <div>
            <span>비밀번호</span>
            <input id="password" type="password" placeholder="비밀번호" name="memberPwd" min="5" max="20" required >
            <p>5~20자 이내의 영문,숫자,특수문자(!@#$%^&*)로 구성가능</p>
        </div>
        <div>
            <span>비밀번호 확인</span>
            <input id="checkpassword" type="password" placeholder="비밀번호 확인" required>
        </div>
        <div>
            <span>이름</span>
            <input id="name"type="text" placeholder="이름" name="memberName" required >
        </div>
        <div>
            <span>이메일</span>
            <input id="email" type="text" placeholder="이메일" name="email" required >
        </div>
        <div>
            <span>닉네임</span>
            <input id="nickname" type="text" placeholder="닉네임" name="memberNic" required>
            
        </div>
            <input type="submit" id="inserCheck" value="회원가입" name="insertCheck" disabled>
		</form>
    </div>
    <script>
        function idCheck(){
            let $memberId = $("#enroll-form input[name=memberId]");

            $.ajax({
                url : "<%=request.getContextPath() %>/idCheck.me",
                data : {checkId : $memberId.val()},
                success : function(result){
                    if(result=="NNNNN"){
                        alert("이미존재하는 아이디 입니다")
                        $memberId.focus();
                    }else{
                        if(confirm("사용가능한 아이디 입니다. 사용하시겠습니까?")){
                            $("#inserCheck").removeAttr("disabled")
                            $memberId.attr("readonly",true);
                        } else {
                        	
                        }
                    }
                },
                error : function(req,err,gg){
                    console.log(req,err,gg,"아이디 중복체크");
                }
            })
        }
    </script>
</body>
</html>