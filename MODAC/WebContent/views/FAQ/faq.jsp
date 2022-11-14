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
        .accordion{
            --bs-accordion-active-bg : rgb(230, 213, 184);
        }

        .accordion-button:not(.collapsed) {
            color: white;
        }
        
        #writeEdit{
            float: right;
        }
</style>
</head>
<body>

    <div class="content">
        <div class="content1">
            <a class="nav-link active" aria-current="page" href="#">공지사항</a>
                    <a class="nav-link" href="#">모닥불 소식</a>
                    <a class="nav-link" href="#">캠핑팁</a>
                    <a class="nav-link">Q&A</a>
                    <a class="nav-link">FAQ</a>
        </div>
        <div class="content2">
            <h3 style="text-align: center;">FAQ</h3>
            <br>
            <% if(loginUser != null && loginUser.getMemberLevel.equals(10)){ %>
              <div>
                  <button type="button" class="btn btn-warning" id="writeEdit">글 작성</button>
              </div>
            <% } %>
            <br><br>
            <div class="accordion" id="accordionExample">
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                      <%= f.getFaqTitle() %>
                    </button>
                  </h2>
                  <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                      <%= f.getFaqContent() %>
                    </div>
                  </div>
                </div>
    
              </div>

        </div>
    </div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>