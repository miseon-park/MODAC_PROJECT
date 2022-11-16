<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<body>
	<form action = "JoinService" method = "post">
		<table border = "1px solid black">
		  <tr>
			<td>ID</td>
			<td>
			  <input type = "text" name = "id" class = "input_id">
			  <font id = "checkId" size = "2"></font>
			</td>				
		  </tr>
		  <tr>
			<td>PW</td>
			<td><input type = "password" name = "pw" class = "pw" id = "password_1"></td>
		  </tr>
		  <tr>
			<td>PW 확인</td>
			<td colspan = "2">
			  <input type = "password" name = "pw2" class = "pw" id = "password_2">
			  <font id = "checkPw" size = "2"></font>
			</td>
		  </tr>
		  <tr>
			<td>이름</td>
			<td><input type = "text" name = "name"></td>
		  </tr>
		  <tr>
			<td>닉네임</td>
			<td><input type = "text" name = "display_name"></td>
		  </tr>
		  <tr>
			<td>전화번호</td>
			<td><input type = "text" name = "phone"></td>
		  </tr>
		  <tr>
			<td>주소</td>
			<td><input type = "text" name =  "address"></td>
		  </tr>
		  <tr>
			<td>성별</td>
			<td>
			  <span>남자</span>
			  <input type = "radio" name = "sex" value = "man">
			  <span>여자</span>
			  <input type = "radio" name = "sex" value = "woman">
			</td>	
		  </tr>
		  <tr>
			<td colspan = "2" align = "center"><input type = "submit" value = "가입하기"></td>
		  </tr>
		</table>
	  </form>
	  
	  <script src = "js/jquery-3.6.0.min.js"></script>
	  <script>
		  $('.input_id').focusout(function(){
			  let userId = $('.input_id').val(); // input_id에 입력되는 값
			  
			  $.ajax({
				  url : "IdCheckService",
				  type : "post",
				  data : {userId: userId},
				  dataType : 'json',
				  success : function(result){
					  if(result == 0){
						  $("#checkId").html('사용할 수 없는 아이디입니다.');
						  $("#checkId").attr('color','red');
					  } else{
						  $("#checkId").html('사용할 수 있는 아이디입니다.');
						  $("#checkId").attr('color','green');
					  } 
				  },
				  error : function(){
					  alert("서버요청실패");
				  }
			  })
			   
		  })
	   </script>
</body>
</html>