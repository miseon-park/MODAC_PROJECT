<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모닥불 소식 메인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
    .content>div{
            height: 100%;
            float: left; 
        }

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
                <nav class="flex-column">
                    <a class="nav-link active" aria-current="page" href="#"><h3>공지사항</h3></a> <br><br>
                    <a class="nav-link" href="#">모닥불 소식</a> <br>
                    <a class="nav-link" href="#">캠핑팁</a> <br>
                    <a class="nav-link">Q&A</a> <br>
                    <a class="nav-link">FAQ</a>
                </nav>
            </div>
            <div class="content2">
                <h3 style="text-align: center;">공지사항</h3>
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
                        <button type="button" class="btn btn-warning" id="writeEdit">글 작성</button>
                    </div>
                <% } %>

                <br><br><br>
                <table class="table table-hover" style="text-align: center;">
                    <thead>
                      <tr>
                        <th scope="col" width="40px;" >글번호</th>
                        <th scope="col" width="550px;">제목</th>
                        <th scope="col" width="150px;">작성자</th>
                        <th scope="col" width="100px;">등록일자</th>
                        <th scope="col" width="80px;">조회수</th>
                      </tr>
                    </thead>
                    <tbody>
                        <% if(list.isEmpty()){ %>
                            <!-- 리스트가 비어있는 경우 -->
                            <tr>
                                <td colspan="5">존재하는 공지사항이 없습니다.</td>
                            </tr>
                        <% }else{ %>
                            <% if( <!-- 필독일때 목록 리스트 불러오기-->) {%>

                            <% }else{ %>
                                <!--일반 게시글 목록 불러오기-->
                            <% }%>
                        <% } %>
                      <tr style="background-color: rgb(250, 241, 241)">
                        <th scope="row"><span class="badge text-bg-danger">공지</span></th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td></td>
                      </tr>
                      <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                        <td></td>
                      </tr>
                    </tbody>
                  </table>
            </div>
        </div>

 


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>