<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
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
<%		
		String memberId = loginMember.getMemberId();
        String memberName = loginMember.getMemberName();
        String memberNic = loginMember.getMemberNic();
        String email = loginMember.getEmail();
        
      
       
    %>
    <br><br>
 <div class="content">
            <div class="content1">

                    <a class="nav-link" aria-current="page" href="#" style="text-align: center;color: orange;">개인정보 변경</a>
                    <br><br>
                    <a class="nav-link" href="#" style="text-align: center;">북마크 모음</a>
                    <br><br>
                    <a class="nav-link" href="#"style="text-align: center;">자기글 모음</a>




            </div>


            <div class="content2">
                <h3>마이페이지</h3> 


            <form class="dt" id="mypage-form" action="<%=contextPath %>/update.me" method="post">
                <h5 class="h5">개인정보 변경</h5>
                <hr>
                <div class="form-floating mb-3">
                    <label for="floatingInput">ID</label>
                    <input type="text" class="form-control" name="memberId" id="floatingInput" value="<%=memberId %>" readonly>

                  </div>
                  <div class="form-floating mb-3">
                    <label for="floatingInput">NAME*</label>
                    <input type="text" class="form-control" name="memberName" id="floatingInput" value="<%=memberName %>">

                  </div>
                  <div class="form-floating mb-3">
                    <label for="floatingInput">NICKNAME*</label>
                    <input type="text" class="form-control" name="memberNic" id="floatingInput" value="<%=memberNic %>">

                  </div>
                  <div class="form-floating mb-3">
                    <label for="floatingInput">EMAIL*</label>
                    <input type="email" class="form-control" name="email" id="floatingInput" value="<%=email %>">

                  </div>

                <br>
                <div align="center">
                    <button type="submit" class="btn btn-secondary btn-sm">정보변경</button>
                    <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#updatePwdForm">비밀번호 변경</button>
                    <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
                   </div>  
                   

            </form>
            </div>
            </div>
            
  <div id = "updatePwdForm" class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
    
      <div class="modal-header">
        <h5 class="modal-title">비밀번호 변경</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body" align="center">
      	<form action="<%=contextPath%>/updatePwd.me" method="post">
      		<input type = "hidden" name="userId" value="<%=memberId%>">
      		<table>
      			<tr>
      				<td>현재 비밀번호</td>
      				<td><input type="password" name="memberPwd" required></td>
      			</tr>
      			<tr>
      				<td>변경할 비밀번호</td>
      				<td><input type="password" name="updatePwd" required></td>
      			</tr>
      			
      			<tr>
      				<td>변경할 비밀번호 재입력</td>
      				<td><input type="password" name="checkedPwd" required></td>
      			</tr>
      		</table>
      		<br>
      		<button type = "submit" class = "btn btn-secondary btn-sm" onclick="return validatePwd();">비밀번호변경</button>	
      		
      	</form>
      	
      	<script>
      		function validatePwd(){
      		if($("input[name=updatePwd]").val() != $("input[name=checkedPwd]").val()){
      			alert("비밀번호가 일치하지 않네요");
      			
      			return false;
      			}
      		}
      	</script>
      	     
      </div>
      
    </div>
  </div>
</div>

<div id = "deleteForm" class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
    
      <div class="modal-header">
        <h5 class="modal-title">회원탈퇴</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

 <div class="modal-body" align="center">
 		<b>탈퇴 후 복구가 불가능합니다.<br>
 			정말로 탈퇴하시겠습니까?<br><br></b>
      	<form action="<%=contextPath%>/delete.me" method="post">
      		
      		<table>
      			
      			<tr>
      				
      				
      				<td>현재 비밀번호</td>
      				<td><input type="password" name="memberPwd" required></td>
      			</tr>
      			
      		</table>
      		<br>
      		<button type = "submit" class = "btn btn-danger btn-sm">탈퇴하기</button>	
      		
      	</form>
      	
      	
      	
      
      	
      
       
        
      </div>
      
    </div>
  </div>
</div>


</body>
</html>