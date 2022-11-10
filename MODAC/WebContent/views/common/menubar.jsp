<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴바</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<style>
    #mini a {
        text-decoration: none;
        color: gray;
    }
    #mini>ul {
        list-style-type: none;
        padding-left: 0px;
        
    }
    #miniCon li {
        display: inline;
        float: left;
        border-left: 1px solid #c0c0c0;
        padding: 0px 10px 0px 10px;
        margin: 5px 0px 5px 0px;
        line-height: 30px;
    }
    #miniCon li:first-child {
        border-left: none;
    }
    #mini {
        float: right;
        font-weight: 600;
    }

    #mainMenu, #subMenu1, #subMenu2{
        margin: 0;
        padding: 0;
        list-style-type: none;
    }

    #mainMenu > li {
        float: left;
        /* border: 1px solid red; */
        /* 임시 */
    }
    #mainMenu > li > a {
        display: block;
        padding: 8px 16px;
        text-align: center;
    }
    #mainMenu > li > a {
        font-size: medium;
        font-weight: 600;
        color: rgb(74,57,51);
        text-align: center;
        text-decoration: none;
        letter-spacing: 0.05em;
        display: block;
        padding: 12px 36px;
    }
    #subMenu1, #subMenu2 {
        position: absolute;
        background-color: rgb(240,165,0);
        
    }
    #subMenu1>li{
        padding: 11px 28px;
        border-bottom: 1px solid lightgray;
        text-align: center;
    }
    #subMenu2>li{
        padding: 11px 42px;
        border-bottom: 1px solid lightgray;
        text-align: center;
    }
    #subMenu1>li>a, #subMenu2>li>a {
        color: white;
        font-weight: 300;
        text-decoration: none;
    }
    div {
        border-top: 3px solid rgb(240,165,0);
        border-bottom: 3px solid rgb(240,165,0);
    }
</style>




</head>
<body>
	

    <nav id="mini" >
        <ul id="miniCon">
            <li><a href="views/member/login.jsp">로그인</a></li>
            <li><a href="">회원가입</a></li>
            <li><a href="">아이디·비밀번호 찾기</a></li>
        </ul>
    </nav>


    <br clear="both">
    <br>

    <div class="nav-area" align="center">
        <ul id="mainMenu">
            <li><a href="">캠핑장 검색</a></li>
            <li><a href="">공지사항</a>
                <ul id="subMenu1">
                    <li><a href="">모닥불 소식</a></li>
                    <li><a href="">캠핑 팁</a></li>
                    <li><a href="">Q&A</a></li>
                    <li><a href="">FAQ</a></li>
                </ul>
            </li>
            <li><a href="">모닥불 이야기</a>
                <ul id="subMenu2">
                    <li><a href="">캠핑장 리뷰</a></li>
                    <li><a href="">레시피 자랑</a></li>
                    <li><a href="">사진스타그램</a></li>
                </ul>
            </li>
            <li><a href="">중고장터</a></li>
            <li><a href="">동아리 모집</a></li>
            <li><a href=""><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-circle" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z"/>
              </svg></a></li>
        </ul>
    </div>






</body>
</html>