<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    /* String contextPath = request.getContextPath(); */
    %>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <title>Document</title>
    <style>
        
        a{ text-decoration: none; }
        button{ cursor: pointer; }

        .wrapper{
            border: 5px solid #F0A500;
            margin:0 auto;
            width: 500px;
            height: 600px;
        }
        .clicked{
            background-color: white;
        }

        #findid{
            float: left;
            /* border: 1px solid black; */
            width: 250px;
            text-align : center;
            padding : 20px 0;
            
        }
        #findid>button{
            width: 240px;
            height: 70px;
            /* background-color: #F0A500; */
        }
        #findpwd{
            text-align : center;
            padding : 20px 0;
        }
        #findpwd>button{
            width: 240px;
            height: 70px;
        }
        

        #divid{
            /* display:inline; */
            text-align : center;
            margin-top: 50px;
        }
        #divid>input{
            margin-left: 20px;
            width: 200px;
            height: 30px;
        }

        #divname{
            text-align : center;
            margin-top: 50px;
        }
        #divname>input{
            margin-left: 40px;
            width: 200px;
            height: 30px;
        }

        #divemail{
            text-align : center;
            margin-top: 40px;
        }
        #divemail>input{
            margin-left: 20px;
            width: 200px;
            height: 30px;
        }

        #btn{
            text-align : center;
            padding : 20px 0;
            width: 300px;
            margin-left: 100px ;
            margin-top: 100px;
            background-color: #F0A500;
            border: none;
            color: white;
            font-weight: 400px;
        }

    </style>
    <%@ include file="../common/menubar.jsp" %>
</head>
<body>
    <div id="displayId">
        <div  class="wrapper">
            <div id="find">
                <div id="findid">
                    <button id="idbtn" onclick="" disabled>아이디찾기</button>
                </div>
                <div id="findpwd">
                    <button class="" onclick="toggleDisplayPWD()">비밀번호찾기</button>
                </div> 
            </div>
            <form id="findidform" action="<%=contextPath %>/findId.me" method="post" >
                <div id="divname">
                    <span>이름</span><input name="memberName" id="memberName" type="text" placeholder="이름을 입력해주세요">
                </div>
                <div id="divemail">
                    <span>이메일</span><input name="email" id="email" type="email" placeholder="이메일을 입력해주세요">
                </div>
                <div>
                    <p class="check" id="check">${check}</p><br/>
                    <button class="" id="btn" type="submit" onclick="id_search();">아이디찾기</button>
                </div>
            </form>
        </div>
    </div>



    <div id="displayPwd">
        <div class="wrapper">
            <div id="find">
                <div id="findid">
                    <button id="idbtn" onclick="toggleDisplayID()">아이디찾기</button>
                </div>
                <div id="findpwd">
                    <button class="button" disabled >비밀번호찾기</button>
                </div> 
            </div>
        <form action="<%=contextPath %>/findPw.me" method="post" class="content">
                <div id="divid">
                    <span>아이디</span><input name="memberId" id="memberId" class="form-control" type="text" placeholder="아아디를 입력해주세요" required>
                </div>
                <div id="divname">
                    <span>이름</span><input name="memberName" id="memberName" class="form-control" type="text" placeholder="이름을 입력해주세요" required>
                </div>
                <div id="divemail">
                    <span>이메일</span><input name="email" id="email" class="form-control" type="text" placeholder="이메일을 입력해주세요" required>
                </div>
                <div id="msg">
                    <p class="checks" id="check"></p>
                </div>
                <div id="btn-area">
                    <button id="btn" class="button" type="submit">비밀번호찾기</button>
                </div>
            </form>
        </div>
    </div>
    
    
        <script>
            $("#displayPwd").hide();
            
            const toggleDisplayPWD = () => {
                $("#displayPwd").show(); // display 속성을 block 으로 바꾼다.
                $("#displayId").hide(); // display 속성을 none 으로 바꾼다.
                }
            const toggleDisplayID = () => {
                
                $("#displayId").show(); // display 속성을 block 으로 바꾼다.
                $("#displayPwd").hide();
                }
        </script>
</body>
</html>