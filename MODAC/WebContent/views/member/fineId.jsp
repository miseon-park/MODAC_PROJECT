<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.modac.member.model.vo.Member"%>
    <%
    	String contextPath =request.getContextPath();
    %>
    
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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

        #divid{
            text-align : center;
            margin-top: 50px;
        }
        #divid>input{
            margin-left: 30px;
            width: 200px;
            height: 30px;
        }

        #divname{
            text-align : center;
            margin-top: 50px;
        }
        #divname>input{
            margin-left: 30px;
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
    
</head>
<body>
    <div id="wrapper">
        <div id="fine">
            <div id="fineid">
                <button class="button" onclick="location.href = '<%=contextPath %>/views/member/fineId.jsp'">???????????????</button>
            </div>
            <div id="finepwd">
                <button class="button" onclick="location.href = '<%=contextPath %>/views/member/finePwd.jsp'">??????????????????</button>
            </div> 
        </div>
        
        <form action="<%=contextPath %>/fineId.me" method="post">
	        <div id="divname">
	            <span>??????</span><input name="memberName" id="memberName" type="text" placeholder="????????? ??????????????????">
	        </div>
	        <div id="divemail">
	            <span>?????????</span><input name="email" id="email" type="text" placeholder="???????????? ??????????????????">
	        </div>
	        <div>
	            <p class="check" id="check">${check}</p><br/>
	            <button class="button" id="btn" type="submit" onclick="id_search();">???????????????</button>
	        </div>
        </form>
	
        <script>
            $("#memberName").focusout(function(){
                if($('#memberName').val() == ""){
                        $('#check').text('????????? ??????????????????.');
                        $('#check').css('color', 'red');
                
                }else{
                    $('#check').hide();
                }
            });
           
            $("#email").focusout(function(){
                if($('#email').val() == ""){
                        $('#check').text('???????????? ??????????????????');
                        $('#check').css('color', 'red');
                }else{
                    $('#check').hide();
                }
            });
            
    </script>
    </div>    

    

</body>
</html>