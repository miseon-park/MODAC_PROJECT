<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 	import="java.util.ArrayList , com.modac.camStagram.model.vo.*, com.modac.common.model.vo.*"%>
<%
	ArrayList<CamStagram> list = (ArrayList<CamStagram>)request.getAttribute("list");
    Attachment at = (Attachment)request.getAttribute("at");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/___vscode_livepreview_injected_script"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
        .content1{
           width: 20%;
		   height : 1000px;
		   padding: 50px 20px 10px;
		   background-color: antiquewhite;
           float: left; 
        }

        .content2{
            width: 80%;
			padding: 10px 50px 20px;
            float: left; 
        }
		.navbar{
            width: 450px;
		}
		.navbar, .btn-group{
			margin-top: 20px;
            display: table;
            margin-left: auto;
            margin-right: auto;
		}
		.active{
			font-size: large;
			font-weight: 600;
		}
	    .date {
	        float : right;
	    }
	    .list-area {
	    	width: 80%;
			margin: auto;
			padding: 1%;
	    }
	    .image-box {
		    width:380px;
		    height:220px;
		    overflow:hidden;
		    margin:0 auto;
		}
		.image-thumbnail {
		    width:100%;
		    height:100%;
		    object-fit:cover;
		}
		.moveBtn{
	        color: white;
	        background-color: rgb(74,57,51);
	        border : none;
	        width: 80px;
	        border-radius: 10px 10px 10px 10px / 10px 10px 10px 10px
	    }
	    .pageBtn{
	        color: black;
	        background-color: gainsboro;
	        border-radius: 50%;
	        border: gainsboro;
	        width: 30px;
	        height: 30px;
	    }
	    .pageBtn:hover{
	        width: 30px;
	        height: 30px;
	        color: white;
	        background-color: orange;
	    }
	    div p {
		    display: inline-block;
		    width: 100%;
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		
		    /* 여러 줄 자르기 추가 스타일 */
		    white-space: normal;
		    line-height: 1.2;
		    height: 3.6em;
		    text-align: left;
		    word-wrap: break-word;
		    display: -webkit-box;
		    -webkit-line-clamp: 3;
		    -webkit-box-orient: vertical;
		}
	   
</style>

</head>
<body>
<%@ include file="../common/menubar.jsp" %>
        <div class="content">
            <div class="content1">
                <nav class="flex-column">
                    <a class="nav-link active" aria-current="page" href="#">모닥불이야기</a><br><br>
                    <a class="nav-link" href="#">캠핑장 리뷰</a>
                    <a class="nav-link" href="#">캠핑 레시피</a>
                    <a class="nav-link">캠핑스타그램</a>
                  </nav>
            </div>
            <div class="content2">
				<br>
                <h3>캠핑 스타그램</h3>
                
                <nav class="navbar">
					<form class="container-fluid">
                         <div class="input-group">
                            <select class="form-select" name ="f" aria-label="Default select example" style="width:25%;">
                                <option  ${(param.f == "POST_CONTENT")? "selected":""} value="POST_CONTENT">내용</option>
                                <option  ${(param.f == "MEMBER_NIC")? "selected":""} value="MEMBER_NIC">작성자</option>
                               </select>
                            <input type="text" name ="q" class="form-control" placeholder="검색어를 입력하세요" aria-label="Username" aria-describedby="basic-addon1" style="width: 60%;" value="${param.q}">
                            <input type="submit" class="input-group-text" id="basic-addon1" value="검색">
                        </div>
                        </form>
					<br>
				</nav>
                
	            <br>				
				<div class="list-area">
					<% if(loginMember != null) { %>
						<div align="right">
			                <a href="<%=contextPath %>/enrollForm.cs" class="btn btn-secondary last1">글쓰기</a> 
		            	</div>
		            <% } %>
		            <br>

					<div class="detail">
					<% if(!list.isEmpty()) {%>
						<% for(CamStagram cs : list) {%>
						<div class="card" style="width: 45%; margin:10px; display:inline-block!important;">
							<input type="hidden" name="csno" id="csno" value="<%=cs.getPostNo()%>"> 
							<div class="image-box" style="width: 100%;">
							<img src="<%=contextPath%>/<%=cs.getTitleImg()%>" class="image-thumbnail" width="200px" height="150px">
							</div>
							
							<div class="card-body">
								<span><%=cs.getMemberNic()%></span> <span class="date"><%=cs.getCreateDate()%></span>
								<br>
								<br>
								<p>
								<%=cs.getPostContent()%>
								</p>
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
									<path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
								</svg>
								<span></span>
	
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
									<path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
								</svg>
	
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
									<path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
									<path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
								</svg>
								<span></span>
	
							</div>
						</div>
						<% } %>
					<% } else { %>
						등록된 게시글이 없습니다.
					<% } %>
					</div>

					<script>
						$(function(){
							$(".card").click(function(){
								let csno = $(this).children().eq(0).val();
								location.href = '<%=contextPath%>/detail.cs?csno='+csno;
							})
						})
					</script>
			    </div>
			    <div align="center" class="paging-area">
		           <% if(currentPage != 1) {%>
		             <button class="moveBtn" onclick="doPageClick(<%=currentPage -1 %>)">&lt;이전</button>
		           <% } %>
		         
		           <% for(int i = startPage; i <= endPage; i++) { %>
		              <%if(i != currentPage) {%>
		                 <button  class="pageBtn" onclick="doPageClick(<%=i%>)"><%=i %></button>
		              <%} else {%>
		                 <button class="pageBtn" disabled><%= i %></button>
		              <%} %>
		           <% } %>
		         
		           <% if(currentPage != maxPage) { %>
		              <button class="moveBtn" onclick="doPageClick(<%=currentPage +1 %>)">다음&gt;</button>
		           <% } %>
		        </div>
		        
		        <script>
				   function doPageClick(currentPage){
					  location.href = "<%=contextPath%>/list.cs?currentPage="+currentPage;
				   }
			    </script>
			 </div>
        </div>
        
       
 


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
 
</body>
</html>