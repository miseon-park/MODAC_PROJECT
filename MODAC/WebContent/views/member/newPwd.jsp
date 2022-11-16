<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <title>비밀번호 재설정</title>
    <style>
        
        a{ text-decoration: none; }
        button{ cursor: pointer; }
        #wrapper{
            border: 5px solid #F0A500;
            margin: auto;
            width: 600px;
            height: 500px;
        }
        .clicked{
            background-color: white;
        }

        #find {
            /* border: 1px solid black; */
            text-align: center;
            margin: 0px;
            box-sizing: border-box;
            margin-left: -5px;
        }
        #find button {
            width: 295px;
            height: 80px;
            margin-right: 0px;
        }

        #idbtn {
            border: none;
            color: white;
            font-size: large;
            font-weight: bold;
            background-color: #F0A500;
            margin: 0px;
        }
        #pwdbtn {
            border: none;
            color: rgb(74, 57, 51);
            font-size: large;
            font-weight: bold;
            background-color: white;
            margin: 0px;
        }

        .content {
            text-align: center;
            /* border: 1px solid black; */
        
        }

        #newPwd-content{
            /* border: 1px solid black; */
            margin-top: 80px;
            /* text-align: center; */
            font-size: 20px
        }

        #divUpdatePwd{
            margin-bottom: 60px;
        }
        #divUpdatePwd>input{
            margin-left: 45px;
            width: 300px;
            height: 50px;
        }

        #divCheckPwd>input{
            margin-left: 15px;
            width: 300px;
            height: 50px;
        }

        #btn-area {
            margin-top: 40px;
            /* border: 1px solid red; */
        }
        
        #check {
            margin-bottom: 10px;
            font-size: 15px;
            padding: 0px;
        }

        #btn {
            text-align: center;
            margin-top: 0px;
            width: 300px;
            height: 60px;
            background-color: #F0A500;
            border: none;
            color: white;
            font-weight: bold;
        }

        
        #hidden-value {
            display: none;
        }

    </style>
    
</head>
<body>

    <%@ include file="../common/menubar.jsp" %>

    <script>
		let msg = "<%=alertMsg%>";
		if(msg != "null") {
			alert(msg);
			<% session.removeAttribute("alertMsg"); %>
		}
	</script>
	

	    <div id="wrapper">
	        <div id="find">
	                <button id="idbtn" class="button" onclick="location.href ='<%=contextPath %>/views/member/findIdPwd.jsp'">아이디찾기</button>
	                <button id="pwdbtn" class="button" onclick="location.href = '<%=contextPath%>/views/member/fineIdPwd.jsp'">비밀번호찾기</button>
	        </div>

            <div class="content">
                <form action="<%= contextPath%>/fineupdatePw.me" method="post">
                    
                    <div id="hidden-value">
                        <input type="hidden" value="${memberId }" name="memberId"/>
                        <input type="hidden" value="${memberName }" name="memberName"/>
                        <input type="hidden" value="${email }" name="email"/>
                        ${memberId },${memberName },${email }<br>
                    </div>
                    
                    <div id="newPwd-content">
                        <div id="divUpdatePwd">
                            <span>새 비밀번호</span><input name="updatePwd" id="updatePwd" type="text" placeholder="내용을 입력해주세요" required>
                        </div>
                        <div id="divCheckPwd">
                            <span>비밀번호 재입력</span><input name="checkPwd" id="checkPwd" type="text" placeholder="내용을 재입력해주세요" required>
                        </div>
                    </div>
                    <div id="btn-area">
                        <p class="check" id="check">${check}</p>
                        <button id="btn" class="button" type="submit" onclick="checking();">비밀번호 재설정</button>
                    </div>
                </form>
            </div>
	    </div>
    


    <script>

        function checking() {
            if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()) {
                $("#checks").text('비밀번호가 일치하지 않습니다.');
                $("#checks").css('color', 'red');
            } else {
                <%=contextPath %>
            }
        }

    </script>


    

</body>
</html>