<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <script>
        //joinform_check 함수로 유효성 검사
function joinform_check() {
    //변수에 담아주기
    var id = document.getElementById("id");
    var password = document.getElementById("password");
    var checkpassword = document.getElementById("checkpassword");
    var name = document.getElementById("name");
    var email = document.getElementById("email");
    var nickname = document.getElementById("nickname");
  
    if (id.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
      alert("아이디를 입력하세요.");
      id.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
      return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
    };
    var idCheck = /^[a-zA-Z0-9]+{5,15}$/;
    if(!idCheck.test(id.value)){
        alert("영문자로 시작하는 5~15자 이내의 영문, 숫자로 구성 가능합니다.")
    }
  
    if (password.value == "") {
      alert("비밀번호를 입력하세요.");
      password.focus();
      return false;
    };
  
    //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
    var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*])(?=.*[0-9]).{5,15}$/;
    if (!pwdCheck.test(password.value)) {
      alert("비밀번호는 영문자+숫자+특수문자 조합으로 5~15자리 사용해야 합니다.");
      password.focus();
      return false;
    };
  
    if (repwd.value !== pwd.value) {
      alert("비밀번호가 일치하지 않습니다..");
      repwd.focus();
      return false;
    };
  
    if (uname.value == "") {
      alert("이름을 입력하세요.");
      uname.focus();
      return false;
    };
  
  
    var reg = /^[0-9]+/g; //숫자만 입력하는 정규식
  
    if (email_id.value == "") {
      alert("이메일 주소를 입력하세요.");
      email_id.focus();
      return false;
    }
  
  
    //입력 값 전송
    document.join_form.submit(); //유효성 검사의 포인트   
  }
  
    </script>
</body>
</html>