<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList , com.modac.campReview.model.vo.CampReview , com.modac.common.model.vo.PageInfo, com.modac.member.model.dao.MemberDao" %>

<% ;
ArrayList<CampReview> rlist = (ArrayList<CampReview>)request.getAttribute("list");
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
                    <a class="nav-link" href="<%=contextPath%>/myPageSelf.me"style="text-align: center;">자기글 모음</a>
                    <a class="nav-link" href="<%=contextPath%>/myPagecrSelf.me"style="text-align: center;color: orange;">캠핑장 리뷰</a>




            </div>
            <h3>자기글 모음</h3>
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
							<th scope="col" style="text-align: center;">조회수</th>
						</tr>
					</thead>
					<tbody>
						<%MemberDao memberDao = new MemberDao();
						System.out.println(memberDao +" "+loginMember);
							ArrayList<CampReview> list = memberDao.crselectList(loginMember.getMemberId());
							for(int i=0; i<list.size(); i++){
									
							
							%>
							<tr>
								<td><%=list.get(i).getPostNo() %></td>
								<td><%=list.get(i).getPostTitle() %></td>
								<td><%=list.get(i).getMemberNic() %></td>
								<td><%=list.get(i).getCreateDate()%></td>
								<td><%=list.get(i).getReadCount() %></td>
							
							</tr>
							
							<%} %>
					</tbody>
				</table>
			</div>
			<script>
				$(function(){
					$(".list>tbody>tr").click(function(){
						let crno = $(this).children().eq(0).text();
						location.href= '<%=contextPath%>/detail.cr?crno=' + crno;
					});
				})
			</script>
			
			<br><br>
 	
 	
 		
 		
				
			</div>
			
 	
 			
			

			
		
            
            <script>
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>

</body>
</html>