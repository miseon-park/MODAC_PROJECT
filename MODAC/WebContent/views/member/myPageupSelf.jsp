<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList , com.modac.usedProduct.model.vo.Market , com.modac.common.model.vo.PageInfo, com.modac.member.model.dao.MemberDao" %>

<% ;
ArrayList<Market> mlist = (ArrayList<Market>)request.getAttribute("list"); 
PageInfo pi = (PageInfo)request.getAttribute("pi");

int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Hahmlet&family=Poor+Story&family=Do+Hyeon&display=swap');
    .content>div{

            float: left; 
        }

         .content1 {
		width: 15%;
		height: 1000px;
		padding: 50px 20px 10px;
		background-color: whitesmoke;
		float: left;
	}

        .content2 {
		width: 85%;
		padding: 10px 200px 20px;
		float: center;
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
           
         font-size: medium;
        font-weight: 600;

        }
        #navi>li>ul>a:hover{
             font-size: medium;
        font-weight: 600;

        }
        
        #navi>li>a:hover+ul{/*???????????? ?????????
            ???????????? ?????????????????? ???????????? ??????????????? ????????? ??????*/
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
                    <li><a class="nav-link" aria-current="page" href="<%=contextPath%>/myPage.me" style="text-align: center;font-family: 'Do Hyeon', sans-serif;
       
        font-size: 30px; ">???????????? ??????</a></li>
                  	<br><br><br><br>
                   <li>
             		<a href="" class="nav-link" style="text-align: center;font-family: 'Do Hyeon', sans-serif;
       
        font-size: 30px; color:orange">????????? ??????</a>
             		<ul>
                    <li><a class="nav-link" href="<%=contextPath%>/myPagecSelf.me"style="text-align: center;font-family: 'Do Hyeon', sans-serif;
       
        font-size: 20px;">?????????</a></li>
                  	<li><a class="nav-link" href="<%=contextPath%>/myPagecrSelf.me"style="text-align: center;font-family: 'Do Hyeon', sans-serif;
       
        font-size: 20px;">????????? ??????</a></li>
                    <li><a class="nav-link" href="<%=contextPath%>/myPagecpSelf.me"style="text-align: center;font-family: 'Do Hyeon', sans-serif;
        
        font-size: 20px;">?????? ?????????</a></li>
                    <li><a class="nav-link" href="<%=contextPath%>/myPageupSelf.me"style="text-align: center;font-family: 'Do Hyeon', sans-serif;
        
        font-size: 20px; color:orange">????????????</a></li>
                    </ul>
                    
                 </li>
                    
                   
                    
                    
 				</ul>



            </div>
             <div class="content2">
            <h3 style=" 
      
      color: rgb(74,57,51);
      font-family: 'Hahmlet', serif;
      font-size: 35px;">????????????</h3>
			<br>
			<div>
			<br>
				<table class="table table-hover list">
					<thead>
						<tr>
							<th scope="col" style="text-align: center;">?????????</th>
							<th scope="col" width="420px">??????</th>
							<th scope="col">?????????</th>
							<th scope="col">????????????</th>
							<th scope="col">?????????</th>
						</tr>
					</thead>
					<tbody>
						<% if(mlist.isEmpty()) {%>
						<tr>
							<th colspan="5">???????????? ???????????? ????????????.</th>
						</tr>
						<% } else { %>
							<% for(Market m : mlist) {%>
								<tr>
									<th scope="row" style="text-align: center;"><%= m.getPostNo() %></th>
									<td><%= m.getPostTitle() %></td>
									<td><%= m.getMemberNic() %></td>
									<td><%= m.getCreateDate() %></td>
									<td><%= m.getReadCount() %></td>
								</tr>
							<% } %>
						<% } %>
					</tbody>
					</tbody>
				</table>
				<div align="center" class = "paging-area">
 		<%if(currentPage !=1){ %>
 		<button class="moveBtn" onclick="doPageClick(<%=currentPage-1 %>)">&lt;??????</button>
 		
 		<%} %>
 		
 		<% for(int i = startPage; i<=endPage; i++){ %>
 			<%if(i != currentPage){ %>
 			<button class="pageBtn" onclick="doPageClick(<%=i %>)"><%=i %></button>
 			
 			<%} else{ %>
 				<button class="pageBtn" disabled style="background-color: orange; color: white;"><%=i %></button>
 			<%} %>
 		<%} %>
 		
 		<%if(currentPage != maxPage){ %>
 		<button class="moveBtn" onclick="doPageClick(<%=currentPage+1 %>)">&gt;??????</button>
 		
 		<%}  %>
 		
 		
 	</div>
			</div>
			<script>
				$(function(){
					$(".list>tbody>tr").click(function(){
						let mno = $(this).children().eq(0).text();
						location.href= '<%=contextPath%>/detail.mk?mno='+mno;
					});
				})
			</script>
			
			<br><br>
			
			
 			<script>
 				function doPageClick(currentPage){
 					location.href = "<%=contextPath%>/myPageupSelf.me?currentPage="+currentPage;
 				}
 			</script>
 	
 	
 	
 		
 		
				
			</div>
			</div>
			
 	
 			
			

			
		
            
            <script>
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>

</body>
</html>