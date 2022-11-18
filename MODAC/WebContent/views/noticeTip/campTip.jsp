<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
    .content>div{
            height: 100%;
            float: left; 
        }

        .content1{
           width: 15%;
           padding: 20 30 20;
           text-align: center;
           background-color: rgb(230, 213, 184);
           color: rgb(74,57,51);
        }

        .content2{
            width: 80%;
            padding-left: 200px;
            padding-right: 100px;
        }

        .searchbar{
            margin-top: 20px;
            display: table;
            margin-left: auto;
            margin-right: auto;
        }

        #writeEdit{
            float: right;
        }
</style>

</head>
<body>
    <div class="content">
        <div class="content1">

        </div>
        <div class="content2">
            <h3 style="text-align: center;">캠핑 팁</h3>
            <br>
            <div class="searchbar">
                <nav class="navbar">
                    <form class="container-fluid">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="검색어를 입력하세요" aria-label="Username" aria-describedby="basic-addon1" style="width: 450px;">
                            <button class="input-group-text" id="basic-addon1">검색</button>
                        </div>
                    </form>
                </nav>
            </div>
            
            <% if(loginUser != null && loginUser.getMemberLevel.equals(10)){ %>
                <div>
                    <a type="button" class="btn btn-warning" id="writeEdit" href="">글 작성</a>
                </div>
            <% } %>

            <br><br>
            <hr>

            <div class="container text-center">
                <div class="row">
                  <div class="col">
                    <img src="..." class="rounded float-start" alt="...">
                    <p>title</p>
                    <p>content</p>
                    <p>date</p>
                  </div>
                  <div class="col">
                    <img src="..." class="rounded float-start" alt="...">
                  </div>
                </div>
              </div>

        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>