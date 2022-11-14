<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
        
    a{ text-decoration: none; }
    button{ cursor: pointer; }
    #wrapper{
        border: 5px solid #F0A500;
        margin:0 auto;
        width: 500px;
        height: 400px;
    }
    .clicked{
        background-color: white;
    }

    #fineid{
        float: left;
        /* border: 1px solid black; */
        width: 250px;
        text-align : center;
        padding : 20px 0;
    }
    #fineid>button{
        width: 250px;
        height: 70px;
        /* background-color: #F0A500; */
    }
    #finepwd{
        
        text-align : center;
        padding : 20px 0;
    }
    #finepwd>button{
        width: 247px;
        height: 70px;
    }

    #newPwd{
        text-align : center;
        margin-top: 50px;
    }
    #newPwd>input{
        margin-left: 30px;
        width: 200px;
        height: 30px;
    }

    #pwdCheck{
        text-align : center;
        margin-top: 50px;
    }
    #pwdCheck>input{
        margin-left: 30px;
        width: 200px;
        height: 30px;
    }

    #msg {
        /* border: 1px solid black; */
        text-align: center;
        margin-top: 30px;
        margin-bottom: 0px ;
    }

   #btn-area {
        text-align : center;
        padding : 20px 0;
        width: 300px;
        background-color: #F0A500;
        margin: auto;
        margin-top: 5px;
        padding: 0%;
   }

    #btn{
       background-color: #F0A500;
       border: none;
       color: white;
       font-weight: 400px;
       width: 300px;
       height: 50px;
       margin: 0px 0px 0px 0px;
       font-weight: bolder;
       
    }
</style>


</head>
<body>

	<h1>되나요옹</h1>


	<div id="wrapper">
	    <div id="fine">
	        <div id="fineid">
	            <button class="button">아이디찾기</button>
	        </div>
	        <div id="finepwd">
	            <button class="button">비밀번호찾기</button>
	        </div> 
	    </div>
	    <div id="newPwd">
	        <span>새 비밀번호</span><input name="memberId" id="memberId" class="form-control" type="text" placeholder="아아디를 입력해주세요" required>
	    </div>
	    <div id="pwdCheck">
	        <span>비밀번호 재입력</span><input name="memberName" id="memberName" class="form-control" type="text" placeholder="이름을 입력해주세요" required>
	    </div>
        <div id="msg">
            <p class="checks" id="check"></p>
        </div>
	    <div id="btn-area">
	        <button id="btn" class="button" type="submit">재설정</button>
	    </div>
	</div>
</body>
</html>