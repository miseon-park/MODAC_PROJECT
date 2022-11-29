<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<title>게시글 상세페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<style>
        /*-------------신고하기---------------*/
        /*모달 창 뒤*/
        #modal.modal-overlay { 
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;

            display: none;

            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        /*모달창*/
        #modal .modal-window {
            background: rgba( 69, 139, 197, 0.70 );
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 400px;
            height: 500px;
            position: relative;
            top: -100px;
            padding: 10px;
        }
        /*모달 제목*/
        #modal .title {
            
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;
            
        }
        #container #btn-modal{
            float: right;
        }

        /*모달 제목 글씨*/
        #modal .title h2 {
            display: inline;
            float: left;

        }
         /*모달창 닫기*/
        #modal .close-area {
            
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
            font-size: 30px;
        }
        
        /*모달창 내용*/
        #modal .content {
            
            margin-top: 20px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        #modal .content #reportTitle{
            width: 350px;
            height: 30px;
        }
        #modal .content #reportContent{
            width: 350px;
            height: 150px;
        }
        #allbutton{
            padding-top: 10%;
            float: right;
        }

</style>
<body>
                        <!-- ============================= 신고하기 ============================== -->
    <div id="container">
        <button id="btn-modal"  class="btn btn-outline-danger">신고하기</button>
        <div id="lorem-ipsum"></div>
    </div>

    <div id="modal" class="modal-overlay">
        <form action="<%=contextPath %>/report.ri" method="post">
            <div class="modal-window">
                <div class="title">
                    <h2>신고하기</h2>
                    <div class="close-area">X</div>
                </div>
                <hr>
                <div class="content">

 							<!-- <input type="hidden" name="sender"
                        value=" <%=loginMember.getMemberNo()%>"> -->
                    <input type="hidden" name="postNo" 
                        value="<%=m.getPostNo()%>">
                    <input type="hidden" name="count" value="<%-- <%= count%> --%>">
                    <p>신고 제목</p>
                    <input type="text" id="reportTitle" name="reportTitle"
                        placeholder="신고 제목 입력">
                    <p>신고 내용</p>
                    <textarea id="reportContent" name="reportContent"
                        style="resize: none;"></textarea>
                </div>
                <hr>
                <div id="allbutton">
                    <input id="cancel" type="button" value="취소"
                        class="btn btn-secondary">
                    <button id="report" type="submit" class="btn btn-danger">신고하기</button>
                </div>
            </div>
        </form>
    </div> 
    <% } %>

    <script>

        
        // 모달창열기
        const modal = document.getElementById("modal")
        const btnModal = document.getElementById("btn-modal")
        btnModal.addEventListener("click", e => {
            modal.style.display = "flex"
        })

        // X 누르면 닫기
        const closeBtn = modal.querySelector(".close-area")
        closeBtn.addEventListener("click", e => {
            modal.style.display = "none"
        })
        
        // 취소버튼으로 닫기
        const closeCancel = modal.querySelector("#cancel")
        closeCancel.addEventListener("click", e => {
            modal.style.display = "none"
        })

    </script>
</body>
</html>