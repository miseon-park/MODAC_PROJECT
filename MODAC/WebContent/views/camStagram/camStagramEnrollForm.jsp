<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><script type="text/javascript" src="/___vscode_livepreview_injected_script"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
		@import url('https://fonts.googleapis.com/css2?family=Hahmlet&family=Poor+Story&family=Do+Hyeon&display=swap');
		.title {
        	margin-top: 40px;
        	color: rgb(74,57,51);
        	font-family: 'Hahmlet', serif;
        	font-size: 35px;
		}
		#button1 {
    		background-color: #BDBDBD;
        	border: #BDBDBD;
        	color: white;
    	}
    	#button2 {
    		background-color: orange;
        	border: orange;
        	color: white;
    	}
    	.sidemenu {
    		font-family: 'Do Hyeon', sans-serif;
        	color: #4a3933;
        	font-size: 30px;
    	}
    	.sidemenu2 {
        	font-family: 'Do Hyeon', sans-serif;
        	color: #4a3933;
        	font-size: 20px;
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
        .form-control {
            margin: 5px;
        }
        .last {
            margin: auto;
		}
		.insert-area {
			width: 80%;
			margin: auto;
		}
		.foorm-control {
		    display: block;
		    width: 100%;
		    padding: 0.375rem 0.75rem;
		    font-size: 1rem;
		    font-weight: 400;
		    line-height: 1.5;
		    color: #495057;
		    background-color: #fff;
		    background-clip: padding-box;
		    border: 1px solid #ced4da;
		    border-radius: 0.25rem;
		    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
		}
		.fooorm-control {
		    display: block;
		    width: 100%;
		    padding: 0.375rem 0.75rem;
		    font-size: 1rem;
		    font-weight: 400;
		    line-height: 1.5;
		    color: #495057;
		    background-color: #fff;
		    background-clip: padding-box;
		    border: 1px solid white;
		    border-radius: 0.25rem;
		    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
		}
</style>

</head>
<body>
<%@ include file="../common/menubar.jsp" %>
        <div class="content">
            <div class="content1">
			<nav class="flex-column">
				<a class="sidemenu" aria-current="page" href="#"><i class="bi bi-fire"></i> &nbsp;??????????????????</a><br><br> 
                <a class="nav-link sidemenu2" href="<%=contextPath%>/list.cr">????????? ??????</a>
                <a class="nav-link sidemenu2" href="<%=contextPath%>/list.r">?????? ?????????</a>
                <a class="nav-link sidemenu2" href="<%=contextPath%>/list.cs">??????????????????</a>
			</nav>
            </div>
            <div class="content2">
              
              <form id="enroll-form" class="insert-area" action="<%=contextPath %>/insert.cs" method="post" enctype="multipart/form-data">
              	<input type="hidden" name="memberNo" value="<%=loginMember.getMemberNo() %>">
              	
              	<div class="fooorm-control">
				  <br>
	              <h3 class="title">?????? ????????????</h3>
	              <br>
                	
                    <input type="file" class="form-control" name="upfile" id="upfile" onchange="loadImg(this, 1);" required>      
                  
                    <div class="form-control" style="height:100%;">
	                   <div style="text-align:center;" >
		                 <img id="titleImg" width="80%" height="100%">
		                 <button type="button" class="btn-close" id="delete" aria-label="Close" style="vertical-align: bottom; display:none;"  onclick="deleteAttachment();"></button>
		               </div>
	                   <br>
	                   <textarea class="fooorm-control" name="content" style="height:500px;"></textarea>
               	    </div>
                 </div>
              
                 <br>
	             <div align="center">       
	               <button type="button" class="btn" id="button2" onclick="history.back();">????????????</button>
	               <button type="submit" class="btn" id="button1">????????????</button>
	             </div>
              </form>
              
              <script>
			      function loadImg(inputFile, num){
			          if(inputFile.files.length != 0){
		
			              let reader = new FileReader();
			              reader.readAsDataURL(inputFile.files[0]);
			              
			              // ?????? ????????? ?????????????????? ????????? ?????? ??????
			              reader.onload = function(e){
			             	  $("#titleImg").css("display","inline");
				        	  $("#titleImg").attr("src",null);
			                  $("#titleImg").attr("src",e.target.result);
			              }
			         	 $("#delete").css("display","inline");
			          }
			       }
			      
		      
			      function deleteAttachment(fileNo){
		        	 $("#titleImg").css("display","none");
		        	 $("#delete").css("display","none");
			      }
		      </script>
		      
              <br><br>
            </div>
        </div>

 


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
 
</body>
</html>