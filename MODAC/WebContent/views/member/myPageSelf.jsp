<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .content>div{

            float: left; 
        }

        .content1{
            margin-top: 50px;

            height: 500px;
           width: 15%;


        }

        .content2{
            width: 85%;
            padding-left: 30px;

        }
        .h5{
            text-align: center;
            margin-top: 50px;
        }
        .outer{
            margin-top: 20px;
            display: table;
            margin-left: auto;
            margin-right: auto;
        }
        .th{
            background-color: lightgray;
        }
        .dt{
            border: #000 solid 1px;
            width: 600px;
            height : 400px;


            margin-top: 70px;
            display: table;



        }
        .nav-link {
            text-decoration: none;
            color: black;
        }

</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
   <br><br>
 <div class="content">
            <div class="content1">

                    <a class="nav-link" aria-current="page" href="<%=contextPath%>/myPage.me" style="text-align: center;">개인정보 변경</a>
                    <br><br>
                    <a class="nav-link" href="#" style="text-align: center;">북마크 모음</a>
                    <br><br>
                    <a class="nav-link" href="<%=contextPath%>/myPageSelf.me"style="text-align: center;color: orange;">자기글 모음</a>




            </div>
            </div>

</body>
</html>