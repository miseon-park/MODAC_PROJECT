<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
        

        .form-select{
          width: 150px;
        }

</style>

</head>
<body>

    <div class="content">
        <div class="content1">
            <nav class="flex-column">
                <a class="nav-link active" aria-current="page" href="#"><h3>공지사항</h3></a><br><br>
                <a class="nav-link" href="#">모닥불 소식</a> <br>
                <a class="nav-link" href="#">캠핑 팁</a> <br>
                <a class="nav-link">Q&A</a> <br>
                <a class="nav-link">FAQ</a> <br>
              </nav>
        </div>

        <div class="content2">
          <br>
          <h3>모닥불 소식</h3>
          <br>

          <div class="form-control" id="form-control">
              <select class="form-select" aria-label="noticeSelect">
                <option selected>일반</option>
                <option value="1">필독</option>
              </select>

              <input type="text" class="form-control" id="title" placeholder="제목을 입력해주세요." aria-label="title">
              <input type="file" class="form-control">
              <textarea class="form-control" style="height:500px;"></textarea>
          </div>

        </div>
        
        <div align="center">
                
          <button type="button" class="btn btn-secondary" class="last1">이전으로</button>

          <button type="button" class="btn btn-secondary" class="last1">글올리기</button>
        </div>

        
    </div>


 


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>