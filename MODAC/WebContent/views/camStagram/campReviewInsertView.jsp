<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        .content3{
          background-color: antiquewhite;
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
                <h3>캠핑스타그램</h3>
              <br>
              <div class="form-control content3">
                  <input type="file" class="form-control">
                  <textarea class="form-control" style="height:500px;"></textarea>

              </div>
              <br>
              <div align="center">
                
                <button type="button" class="btn btn-secondary" class="last1">이전으로</button>

                <button type="button" class="btn btn-secondary" class="last1">글올리기</button>
              </div>
              <br>


				<br>
            </div>

			
        </div>

 


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
 
</body>
</html>