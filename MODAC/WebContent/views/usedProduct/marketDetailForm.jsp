<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.ArrayList, com.modac.usedProduct.model.vo.*"%>
<%
	Market m = (Market)request.getAttribute("m");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<style>
    #content{
        /*border: 3px solid mistyrose;*/
        box-sizing: border-box;
        width: 1200px;
        margin: auto;
    }
    .detailView{
        border: 1.5px solid gainsboro;
        box-sizing: border-box;
        width: 800px;
        margin: auto;
        margin-top: 50px;
        border-radius: 10px 10px 10px 10px / 10px 10px 10px 10px;
    }
    .detailView>p{
        font-size: 12px; 
        margin-top: 1px; 
        margin-right: 5px; 
        text-align: right;
        color: gray;
        font-weight: 500px;
    }
    .title{
    	margin-left: 200px; 
    	margin-top: 40px;
    }
    .titleInfo{
    	margin-left: 40px;
    }
    #updateDate{
    	background-color: orange;
    	border: orange;
    	color: white;
    	font-size: 13px;
    	border-radius: 10%;
    	margin-right: 10px;
    	border-radius: 10px 10px 10px 10px / 10px 10px 10px 10px;
    	width: 100px;
    	height: 25px;
    }
    #end{
    	background-color: gainsboro;
    	border: gainsboro;
    	color: white;
    	font-size: 13px;
    	border-radius: 10%;
    	border-radius: 10px 10px 10px 10px / 10px 10px 10px 10px;
    	width: 100px;
    	height: 25px;
    }
    .userInfo{
        margin-left: 30px;
        margin-top: 20px;
        height: 10px;
        margin-bottom: -10px;
    }
    .status, .update{
        float: right;
    	margin-right: 2.5%;
    }
    .status{
    	margin-top: 10px;
    	height: 40px;
    	width: 280px;
    	text-align: right;
    }
    .update{
    	margin-top: -10px;
    	color: gainsboro;
    }
    .content{
        /*border: 1px solid mistyrose;*/
        box-sizing: border-box;
        width: 780px;
        margin:auto;
    }
    a{
    	color: gray;
    	font-size: 5px;
    	display: inline-box;
    	width: 80px;
    }
    a:hover{
    	text-decoration : none !important
    }
    a:link { 
    	color: gainsboro; 
    }
    a:visited { 
    	color: gainsboro; 
    }
    .list{
    	color: white;
    	background-color: rgb(74,57,51);
    	border : none;
    	width: 80px;
    	border-radius: 10px 10px 10px 10px / 10px 10px 10px 10px;
    }
    #enrollBtn{
    	color: white;
    	background-color: orange;
    	border : none;
    	width: 80px;
    	border-radius: 10px 10px 10px 10px / 10px 10px 10px 10px;
    	margin: auto;
        margin-top: 30px;
        margin-left: 550px;
    }
    .imgView{
    	margin-left: 10px; 
    	border: 1px solid white;
    }
    
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <div id="content">
        <h2 class="title">중고장터</h2>
        
        <div class="detailView">
        	<% if(loginMember != null && loginMember.getMemberNic().equals(m.getMemberNo())){ %>
				<div class="status">
                	<a href="<%=contextPath%>/updateDate.mk?mno=<%=m.getPostNo()%>" class="btn btn-secondary btn-sm" id="updateDate">끌어올리기</a>
                	<a href="<%=contextPath%>/changeSale.mk?mno=<%=m.getPostNo()%>" class="btn btn-secondary btn-sm" id="end">판매완료</a>
            	</div>
			<% }else{ %>	
				<button class="ring" style="float: right;">신고하기</button> 
            <% } %>
            
            <br>
            <table class="titleInfo">
            	<tr>
            		<td style="color: orange; font-size: 13px;">
	            		<% if(m.getSale().equals("Y")) { %>
	            			<b>판매중</b>
	            		<% } else if(m.getSale().equals("N")) { %>
	            			<b>판매완료</b>
	            		<% } %> 
            		</td>
            		<td style="font-size:20px;">&nbsp;&nbsp;&nbsp;<b><%=m.getPostTitle()%></b></td>
            	</tr>
            </table>

            <table class="userInfo">
                <tr>
                    <td style="font-size:12px;"><b><%=m.getMemberNo()%></b></td>
                    <td style="font-size:4px; color: gainsboro;">&nbsp;&nbsp;<%=m.getCreateDate()%></td>
                </tr>
            </table>
            
            <% if(loginMember != null && loginMember.getMemberNic().equals(m.getMemberNo())){ %>
	            <div class="update">
	                <a href="<%=contextPath%>/updateForm.mk?mno=<%=m.getPostNo()%>">수정하기</a>
	                <a href="<%=contextPath%>/delete.mk?mno=<%=m.getPostNo()%>">삭제하기</a>
	            </div>
	        <% } %>
            
           <hr>
           	<div class="imgView">
				<img src="<%=contextPath %>/<%=list.get(0).getPath()+list.get(0).getNewName() %>" width="190" height="150">
				
				<%for(int i = 1; i< list.size(); i++) { %>
					<img src="<%=contextPath %>/<%=list.get(i).getPath()+list.get(i).getNewName()%>" width="190" height="150">
				<% } %>
			</div>
            
            <div class="content"><%=m.getPostContent()%></div>
            <br>
            
            <h5>댓글</h5>
            <hr>
            
            여기 댓글 기능 추가
        </div>
        
        <div class="btn">
            <a href="<%=contextPath%>/list.mk" class="btn btn-secondary btn-sm" id="enrollBtn">목록</a>
        </div>
    </div>
    
    <br><br><br><br><br>
</body>
</html>