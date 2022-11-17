<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.modac.circle.model.vo.*, com.modac.common.model.vo.*"%>
    <%
 	Circle c = (Circle)request.getAttribute("c");
 // 게시글번호, 카테고리명, 제목, 내용, 작성자아이디, 작성일
 
 	Attachment at = (Attachment)request.getAttribute("at");
 //파일번호, 원본명, 수정명, 저장경로
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	.content2 {
		width: 80%;
		padding: 10px 50px 20px;
		float: left;
	}
	.form-control {
		margin: 5px;
	}
	.last1 {
		margin: auto;
	}
	.date {
		float: right;
	}
	.insert-area {
		width: 80%;
		margin: auto;
	}
</style>
</head>
<%@ include file="../common/menubar.jsp" %>
       <div class="content">
       
                      
           <div class="content2">
			 <br>
               <h3>동아리 모집</h3>
             <br>

             <form id="enroll-form" action="<%=contextPath %>/cupdate.bo" method="post" enctype="multipart/form-data">
              
              	<input type="hidden" name="memberNo" value="<%=loginMember.getMemberNo()%>">
	              
	              <div class="form-control">
	                 <input type="text" class="form-control" value="<%=c.getPostTitle()%>" aria-label="title" name="title">
	                  <div>
	                  <%if(at!=null){ %>
						<%= at.getOriginName() %>
						<!-- 원본파일의 파일번호, 수정명을 hidden으로 넘길것. -->
						<input type="hidden" name="originFileNo" value="<%=at.getPhotoNo()%>">
						<input type="hidden" name="originFileName" value="<%=at.getNewName()%>">
					<%} %>
					  <input type="file" class="form-control" name="upfile">
					</div>
	                
	                  <textarea class="form-control" style="height:500px;" name="content" ><%=c.getPostContent()%></textarea>
	
	                  <div align="center">
                    <button type="submit" class="btn btn-secondary" class="last1" >수정하기</button>

                     <button type="button" class="btn btn-secondary" class="last1"onclick="history.back();">목록으로</button>
	                  
	              </div>
                  
            </div>
	          </form>
			</div>
            </div>
            <br>
            
            
            <br>
		    <br>
          </div>
      </div>

 


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
 
</body>
</html>