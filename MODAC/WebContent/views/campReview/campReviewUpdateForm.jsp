<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.modac.campReview.model.vo.*, com.modac.common.model.vo.Attachment"%>
<%
	CampReview cr = (CampReview)request.getAttribute("cr");
	ReviewTag rt = (ReviewTag)request.getAttribute("rt");
	Attachment at = (Attachment)request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head><script type="text/javascript" src="/___vscode_livepreview_injected_script"></script>
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
        .form-control {
          margin: 5px;
        }
        .last {
          margin: auto;
		}
		.insert-area {
			width: 80%;
			margin: auto;
		}
		.foorm-control {
	    display: block;
	    width: 100%;
	    padding: 0.375rem 0.75rem;
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: 1.5;
	    color: #495057;
	    background-color: #fff;
	    background-clip: padding-box;
	    border: 1px solid #ced4da;
	    border-radius: 0.25rem;
	    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
		}
		.fooorm-control {
	    display: block;
	    width: 100%;
	    padding: 0.375rem 0.75rem;
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: 1.5;
	    color: #495057;
	    background-color: #fff;
	    background-clip: padding-box;
	    border: 1px solid white;
	    border-radius: 0.25rem;
	    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
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
           <h3>캠핑장 리뷰</h3>
           <br>
           <div class="insert-area">
           
           <form id="enroll-form" action="<%=contextPath %>/update.cr" method="post" enctype="multipart/form-data">
          	 <input type="hidden" name="crno" value="<%=cr.getPostNo() %>">
            
             <div class="foorm-control">
             	<input type="text" class="form-control" placeholder="제목을 입력해주세요." name="title" aria-label="title" value="<%=cr.getPostTitle()%>">
                
					<% if(at != null){ %>
						<%= at.getOriginName() %>
						<!-- 원본파일의 파일번호, 수정명을 hidden으로 넘길것. -->
						<input type="hidden" name="originFileNo" value="<%=at.getPhotoNo() %>">
						<input type="hidden" name="originFileName" value="<%=at.getNewName() %>">
					<% } %>
						<input type="file" name="upfile">
                
               	<div class="form-control" style="height:100%;">
                	<div style="text-align:center">
                     <% if(cr.getTitleImg() != null ) { %>
	               		 <img src="<%=contextPath%>/<%=cr.getTitleImg()%>" width="600px" height="100%">
	               		 <button type="button" class="btn-close" aria-label="Close" style="vertical-align: bottom;" onclick="deleteAttachment();"></button>
	                 <% } %>
	                 </div>
	                  	 <br>
	               		 <textarea class="fooorm-control" name="content" style="height:100%;"><%=cr.getPostContent()%></textarea>
                </div>
                
                <div class=" btn-group-sm foorm-control" role="group" aria-label="Basic checkbox toggle button group">
                 <input type="checkbox" class="btn-check"  name="tag" value="1" id="btncheck1" autocomplete="off">
                 <label class="btn btn-outline-primary" for="btncheck1">#사장님이 친절해요</label>
                 
                 <input type="checkbox" class="btn-check"  name="tag" value="2" id="btncheck2" autocomplete="off">
                 <label class="btn btn-outline-primary" for="btncheck2">#시설이 깔끔해요</label>
                 
                 <input type="checkbox" class="btn-check"  name="tag" value="3" id="btncheck3" autocomplete="off">
                 <label class="btn btn-outline-primary" for="btncheck3">#주변 경관이 좋아요</label>
                
                 <input type="checkbox" class="btn-check"  name="tag" value="4" id="btncheck4" autocomplete="off">
                 <label class="btn btn-outline-primary" for="btncheck4">#매너시간이 잘 지켜져요</label>
                 
                 <input type="checkbox" class="btn-check"  name="tag" value="5" id="btncheck5" autocomplete="off">
                 <label class="btn btn-outline-primary" for="btncheck5">#사이트 공간이 넓어요</label>
                 
                 <input type="checkbox" class="btn-check"  name="tag" value="6" id="btncheck6" autocomplete="off">
                 <label class="btn btn-outline-primary" for="btncheck6">#주변 볼거리가 많아요</label>
                </div>
             </div>
             <% if(rt != null){ %>
				<input type="hidden" name="originTagNo" value="<%= rt.getTagNo()%>">
				<% } %>
             <script>
			   <% if(rt != null) {%>
		            $(function(){
		                let tag = "<%= rt.getTagNo()%>"
		                $("input[type=checkbox]").each(function(){
		                    // 순차적으로 접근한 input 요소의 value값이 interest에 포함될경우
		                    // -> 해당 input 요소에 checked 속성을 부여할것.
		                    if(tag.search($(this).val()) != -1){ 
		                        // interest문자열로부터 현재 체크박스의 value가 포함되어있지 않다면 -1을 반환
		                        $(this).attr("checked", true);
		                    }
		                })
		            })
	           <% }%>
		        </script>
             <br> 
             <div align="center">
                <button type="button" class="btn btn-secondary" class="last1" onclick="history.back();">목록으로</button>
                <button type="submit" class="btn btn-secondary" class="last1">수정하기</button>
             </div>
             <br>
       	   </form>
       	   
          </div>
        </div>
      </div>
      <script>
	      function deleteAttachment(fileNo){
	         $.ajax({
	            url : "<%= request.getContextPath() %>/delete.cr",
	            data : {file_no : file_no},
	            success : function(result){
	               //삭제성공시
	               if(result == 1){
	                  alert("삭제에 성공했습니다");
	                  location.reload();
	               }else{
	                  alert("삭제에 실패했습니다.");
	               }  
	            } 
	         })
	      }
      </script>



 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
 
</body>
</html>