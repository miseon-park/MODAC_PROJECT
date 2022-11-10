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
		.navbar{
            width: 450px;
		}
		.navbar, .btn-group{
			margin-top: 20px;
            display: table;
            margin-left: auto;
            margin-right: auto;
		}
		.active{
			font-size: large;
			font-weight: 600;
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
                <h3>캠핑장 리뷰</h3>
				<br>
				<div>
				<nav class="navbar">
					<form class="container-fluid">
					  <div class="input-group">
						<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">검색옵션</button>
						<ul class="dropdown-menu">
						  <li><a class="dropdown-item" href="#">제목</a></li>
						  <li><a class="dropdown-item" href="#">작성자</a></li>
						  <li><a class="dropdown-item" href="#">제목+작성자</a></li>
						</ul>
						<input type="text" class="form-control" placeholder="검색어를 입력하세요" aria-label="Username" aria-describedby="basic-addon1">
						<button class="input-group-text" id="basic-addon1">검색</button>
					  </div>
					</form>
					<br>
				  </nav>
				  </div>
				
				<div class="list-area">
                <table class="table table-hover">
                    <thead>
                      <tr>
                        <th scope="col" style="text-align:center;">글번호</th>
                        <th scope="col" width="420px">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">등록일자</th>
                        <th scope="col" style="text-align:center;">조회수</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row" style="text-align:center;">1</th>
                        <td>Jacob</td>
                        <td>@fat</td>
                        <td>2020-02-02</td>
                        <td style="text-align:center;">10</td>
                      </tr>
                      <tr>
                        <th scope="row" style="text-align:center;">2</th>
                        <td>Larry the Bird</td>
                        <td>@twitter</td>
                        <td>2020-02-02</td>
                        <td style="text-align:center;">10</td>
                      </tr>
                    </tbody>
                  </table>
				</div>

				<div class="btn-group" aria-label="Basic example">
					<button type="button" class="btn"><<</button>
					<button type="button" class="btn">1</button>
					<button type="button" class="btn">2</button>
					<button type="button" class="btn">3</button>
					<button type="button" class="btn">>></button>
				</div>
            </div>

			
        </div>

 


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
 
</body>
</html>