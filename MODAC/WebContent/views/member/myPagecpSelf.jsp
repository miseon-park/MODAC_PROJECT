<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList , com.modac.recipe.model.vo.Recipe , com.modac.common.model.vo.PageInfo, com.modac.member.model.dao.MemberDao" %>

<% ArrayList<Recipe> cplist = (ArrayList<Recipe>)request.getAttribute("list");
PageInfo pi = (PageInfo) request.getAttribute("pi");
int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();














//2. 현재 사용자가 요청한 페이지에 보여줄 페이징바객체 전달
//request.setAttribute("pi", pi);
%>

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
        .nav-link {
            text-decoration: none;
            color: black;
        }
         #navi{
           /* border : 1px solid blue;*/
            list-style-type: none;
            margin: 0;
            
                padding :0;
                height: 100%;
        }
        #navi >li{
            /*border: 1px solid blue;*/
            float: left;
           
            text-align: center;
        }
        
          #navi a:hover{
            font-size: 16px;
            color:  rgb(240,165,0);
        }
        #navi>li>ul{
            list-style-type: none;
            padding: 0;
            display: none;
        }
        #navi>li>ul>a{
            font-size: 11px;

        }
        #navi>li>ul>a:hover{
            font-size: 13px;

        }
        
        #navi>li>a:hover+ul{/*동위레벨 선택자
            평소에는 안보여지다가 마우스가 올라갈때만 효과를 부여*/
            display: block;
        }
        #navi>li>ul:hover{
            display: block;
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

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
   <br><br>
 <div class="content">
            <div class="content1">

                    <ul id="navi">
                    <li><a class="nav-link" aria-current="page" href="<%=contextPath%>/myPage.me" style="text-align: center;">개인정보 변경</a></li>
                   <li>
             		<a href="" class="nav-link" style="text-align: center; color: orange;">자기글 모음</a>
             		<ul>
                    <li><a class="nav-link" href="<%=contextPath%>/myPagecSelf.me"style="text-align: center; ">동아리 모음</a></li>
                  	<li><a class="nav-link" href="<%=contextPath%>/myPagecrSelf.me"style="text-align: center;">캠핑리뷰 모음</a></li>
                    <li><a class="nav-link" href="<%=contextPath%>/myPagecpSelf.me"style="text-align: center;color: orange;">캠핑레시피 모음</a></li>
                    <li><a class="nav-link" href="<%=contextPath%>/myPageupSelf.me"style="text-align: center;">중고 모음</a></li>
                    </ul>
                    
                 </li>
                    
                   
                    
                    
 				</ul>


            </div>
            <h3>레시피 모음</h3>
			<br>
			<div>
			<br>
				<table class="table table-hover list">
					<thead>
						<tr>
							<th scope="col" style="text-align: center;">글번호</th>
							<th scope="col" width="420px">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">등록일자</th>
							<th scope="col">조회수</th>
							
							
						</tr>
					</thead>
					<tbody>
						<% if(cplist.isEmpty()) {%>
						<tr>
							<th colspan="5">존재하는 게시글이 없습니다.</th>
						</tr>
						<% } else { %>
							<% for(Recipe cp : cplist) {%>
								<tr>
									<th scope="row" style="text-align: center;"><%= cp.getPostNo() %></th>
									<td><%= cp.getPostTitle() %></td>
									<td><%= cp.getMemberNic() %></td>
									<td><%= cp.getCreateDate() %></td>
									<td><%= cp.getReadCount() %></td>
									
								</tr>
							<% } %>
						<% } %>
					</tbody>
					
				</table>
				<br>
			<div align="center" class = "paging-area">
 		<%if(currentPage !=1){ %>
 		<button class="moveBtn" onclick="doPageClick(<%=currentPage-1 %>)">&lt;이전</button>
 		
 		<%} %>
 		
 		<% for(int i = startPage; i<=endPage; i++){ %>
 			<%if(i != currentPage){ %>
 			<button class="pageBtn" onclick="doPageClick(<%=i %>)"><%=i %></button>
 			
 			<%} else{ %>
 				<button disabled class="pageBtn"><%=i %></button>
 			<%} %>
 		<%} %>
 		
 		<%if(currentPage != maxPage){ %>
 		<button class="moveBtn" onclick="doPageClick(<%=currentPage+1 %>)">&gt;다음</button>
 		
 		<%}  %>
 		
 		
 	</div>
			</div>
			<script>
				$(function(){
					$(".list>tbody>tr").click(function(){
						let bno = $(this).children().eq(0).text();
						
								
						location.href = '<%=contextPath%>/detail.r?rno='+rno;
					});
				})
			</script>
			
			
 			<script>
 				function doPageClick(currentPage){
 					location.href = "<%=contextPath%>/myPagecpSelf.me?currentPage="+currentPage;
 				}
 			</script>
 	
 	
 		
 		
				
			</div>
			
 	
 			
			

			
		
            
            <script>
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>

</body>
</html>