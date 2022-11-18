<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 소식 글작성</title>
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
		      padding: 50px 50px 20px;
		      float: left;
        }
        .form-control {
          margin: 5px;
        }
        

        .form-select{
          width: 150px;
        }

        #qaPwd{
          width: 250px;
        }


</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
    <div class="content">
        <div class="content1">
            <nav class="flex-column">
                <a class="nav-link active" aria-current="page" href="<%=contextPath %>/noticeList"><h3>공지사항</h3></a><br><br>
                <a class="nav-link" href="<%=contextPath %>/noticeList">모닥불 소식</a> <br>
                <a class="nav-link" href="#">캠핑 팁</a> <br>
                <a class="nav-link" href="<%=contextPath %>/qaList">Q&A</a> <br>
                <a class="nav-link" href="<%=contextPath %>/faqList">FAQ</a> <br>
              </nav>
        </div>

        <div class="content2">
          <br>
          <h3>Q&A</h3>
          <br>
			
		  <form id="enroll-form" action="<%=contextPath %>/insert.qa" method="post">
	          <div class="form-control" id="form-control">
	          	<%-- <input type="hidden" name="userNo" value="<%=loginUser.getUserNo() %>"> --%>
	
	              <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요." aria-label="title">
	              <input type="file" class="form-control">
	              <textarea class="form-control" style="height:500px;" name="content"></textarea>
                <label>
                  <input type='checkbox' id='my_checkbox' onclick='toggleTextbox(this)'/> 비밀글
                </label>
                
                <input type='text' id='my_text' onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" disabled />
               
	          </div>
	          
	          <br><br>
		        
		        <div align="center">
		                
		          <button type="button" class="btn btn-secondary" class="last1" onclick="history.back();">이전으로</button>
		
		          <button type="submit" class="btn btn-warning" class="last1">글올리기</button>
		        </div>
		  </form>

        </div>
        

        
    </div>


    <script>
        function toggleTextbox(checkbox) {
  
              // 1. 텍스트 박스 element 찾기
              const textbox_elem = document.getElementById('my_text');
              
              // 2-1. 체크박스 선택여부 체크
              // 2-2. 체크박스 선택여부에 따라 텍스트박스 활성화/비활성화
              textbox_elem.disabled = checkbox.checked ? false : true;
              
              // 3. 텍스트박스 활성화/비활성화 여부에 따라
              // - 텍스트박스가 비활성화 된 경우 : 텍스트박스 초기화
              // - 텍스트박스가 활성화 된 경우 : 포커스 이동
              if(textbox_elem.disabled) {
                textbox_elem.value = null;
              }else {
                textbox_elem.focus();
              }
            }
    </script>


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>