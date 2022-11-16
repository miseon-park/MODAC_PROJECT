<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
        String contextPath = request.getContextPath();
	    String alertMsg = (String) session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <title>비밀번호 찾기</title>
    <style>
        
        a{ text-decoration: none; }
        button{ cursor: pointer; }
        #wrapper{
            border: 5px solid #F0A500;
            margin:0 auto;
            width: 500px;
            height: 500px;
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

        #divUpdatePwd{
            text-align : center;
            margin-top: 60px;
        }
        #divUpdatePwd>input{
            margin-left: 30px;
            width: 200px;
            height: 30px;
        }

        #divCheckPwd{
            text-align : center;
            margin-top: 50px;
            margin-bottom: 70px;
        }
        #divCheckPwd>input{
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

        
        #hidden-value {
            display: none;
        }

    </style>
    
</head>
<body>

    <script>
		let msg = "<%=alertMsg%>";
		if(msg != "null") {
			alert(msg);
			<% session.removeAttribute("alertMsg"); %>
		}
	</script>
	

	    <div id="wrapper">
	        <div id="fine">
	            <div id="fineid">
	                <button class="button" onclick="location.href ='<%=contextPath %>/views/member/fineId.jsp'">아이디찾기</button>
	            </div>
	            <div id="finepwd">
	                <button class="button" onclick="location.href = '<%=contextPath%>/views/member/findPwd.jsp'">비밀번호찾기</button>
	            </div> 
	        </div>


            <form action="<%= contextPath%>/fineupdatePw.me" method="post">
                
                <div id="hidden-value">
                    <input type="hidden" value="${memberId }" name="memberId"/>
		            <input type="hidden" value="${memberName }" name="memberName"/>
		            <input type="hidden" value="${email }" name="email"/>
                    ${memberId },${memberName },${email }<br>
                </div>
                
                <div id="divUpdatePwd">
                    <span>새 비밀번호</span><input name="updatePwd" id="updatePwd" class="form-control" type="text" placeholder="내용을 입력해주세요" required>
                </div>
                <div id="divCheckPwd">
                    <span>비밀번호 재입력</span><input name="checkPwd" id="checkPwd" class="form-control" type="text" placeholder="내용을 재입력해주세요" required>
                </div>
               
                <div id="msg">
                    <p class="checks" id="check"></p>
                </div>

                <div id="btn-area">
                    <button id="btn" class="button" type="submit" onclick="checking();">비밀번호찾기</button>
                </div>
            </form>
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