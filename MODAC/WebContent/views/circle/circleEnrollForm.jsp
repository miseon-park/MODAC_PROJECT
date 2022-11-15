<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><script type="text/javascript" src="/___vscode_livepreview_injected_script"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
        

        .content2{
            width: 80%;
		      	padding: 10px 50px 20px;
            float: left; 
        }
        .form-control {
          margin: 5px;
        }
        .last {
          margin: auto;
		    }

</style>

</head>
<body>
<%@ include file="../common/menubar.jsp" %>
        <div class="content">

            <div class="content2">
				<br>
                <h3>캠핑장 리뷰</h3>
              <br>
              
              <form id="enroll-form" action="<%=contextPath %>/cinsert.bo" method="post">
              
              	<input type="hidden" name="memberNo" value="<%=loginMember.getMemberNo()%>">
	              
	              <div class="form-control">
	                  <input type="text" class="form-control" placeholder="제목을 입력해주세요." aria-label="title" name="title">
	                  <input type="file" class="form-control">
	                  <textarea class="form-control" style="height:500px;" placeholder="내용을 입력해 주세요" name="content"></textarea>
	
	                  <div align="center">
                    <button type="submit" class="btn btn-secondary" class="last1" >작성하기</button>

                     <button type="button" class="btn btn-secondary" class="last1"onclick="history.back();">목록으로</button>
	                  
	              </div>
                  
            </div>
	          </form>
	           
            </div>

			
        </div>
 


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
 
</body>
</html>