<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        
        a{ text-decoration: none; }
        button{ cursor: pointer; }
        #wrapper{
            border: 5px solid #F0A500;
            margin:0 auto;
            width: 500px;
            height: 500px;
        }
        .clicked{
            background-color: white;
        }
        #fineid{
            float: left;
            /* border: 1px solid black; */
            width: 250px;
            text-align : center;
            padding : 20px 0;
        }
        #fineid>button{
            width: 250px;
            height: 70px;
            /* background-color: #F0A500; */
        }
        #finepwd{
            
            text-align : center;
            padding : 20px 0;
        }
        #finepwd>button{
            width: 247px;
            height: 70px;
        }


        #divname{
            text-align : center;
            margin-top: 50px;
        }
        #divname>input{
            margin-left: 30px;
            width: 200px;
            height: 30px;
        }
        #divemail{
            text-align : center;
            margin-top: 40px;
        }
        #divemail>input{
            margin-left: 20px;
            width: 200px;
            height: 30px;
        }

        #btn{
            text-align : center;
            padding : 20px 0;
            width: 300px;
            margin-left: 100px ;
            margin-top: 100px;
            background-color: #F0A500;
            border: none;
            color: white;
            font-weight: 400px;
        }
    </style>
    
</head>
<body>

    <div id="wrapper">
        <div id="fine">
            <div id="fineid">
                <button class="button">아이디찾기</button>
            </div>
            <div id="finepwd">
                <button class="button">비밀번호찾기</button>
            </div> 
        </div>

        <div id="divname">
            <span>이름</span><input name="memberName" id="memberName" type="text" placeholder="이름을입력해주세요">
        </div>
        <div id="divemail">
            <span>이메일</span><input name="email" id="email" type="text" placeholder="이메일을입력해주세요">
        </div>
        <div>
            <button class="button" id="btn" type="submit">아이다찾기</button>
        </div>
    </div>


    

</body>
</html>