   
       
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
              
               
            <form class="dt">
                <h5 class="h5">개인정보 변경</h5>
                <hr>
                <div class="form-floating mb-3">
                    <label for="floatingInput">ID</label>
                    <input type="text" class="form-control" name="userId" id="floatingInput" readonly>
                   
                  </div>
                  <div class="form-floating mb-3">
                    <label for="floatingInput">NAME*</label>
                    <input type="text" class="form-control" name="userName" id="floatingInput" >
                   
                  </div>
                  <div class="form-floating mb-3">
                    <label for="floatingInput">NICKNAME*</label>
                    <input type="text" class="form-control" name="userNic" id="floatingInput" >
                   
                  </div>
                  <div class="form-floating mb-3">
                    <label for="floatingInput">EMAIL*</label>
                    <input type="email" class="form-control" name="eamil" id="floatingInput" >
                   
                  </div>
                  
                <br>
                <div align="center">
                    <button type="submit" class="btn btn-secondary btn-sm">정보변경</button>
                    <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#updatePwdForm">비밀번호 변경</button>
                    <button type="button" class="btn btn-secondary btn-sm">회원탈퇴</button>
                   </div>  
                
            </form>
           
            
             
           
      
          
        
       
      
        
        </div>
	
</body>
</html>