<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.ArrayList, com.modac.usedProduct.model.vo.Market, 
    com.modac.common.model.vo.PageInfo"  
%>
<% ArrayList<Market> list = (ArrayList<Market>)request.getAttribute("list"); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고장터</title>
<!--jquery-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!--부트스트랩 그리드-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
    #content{
        border: 1px solid skyblue;
        box-sizing: border-box;
        width: 1200px;
        margin: auto;
    }
    #content{
        border: 1px solid white;
        box-sizing: border-box;
    }
    .postSelect{
        margin-left: 200px;
        border: white;
        width: 100px;
    }
    .search{
        border: 1px solid;
        box-sizing: border-box;
        width: 800px;
        color: white;
        text-align: center;
        display: inline-block;
        margin-left: 200px;
    }
    .postList{
        border: 1px solid;
        box-sizing: border-box;
        width: 87%;
        color: white;
        margin-top: 30px;
        margin-left: 80px;
        margin-right: 80px;
        margin-bottom: 30px;
    }
    table {
        height: 300px;
        width: 200px;
        float: left;
        margin-left: 40px;
        margin-bottom: 50px;
    }
    table, tr, td {
        /*border: 1px solid skyblue;*/
    }
    span {
        font-size: 0.6em;
    }
    #enrollBtn{
        float: right;
        background-color: orange;
        border-color: orange;
        border-radius: 5%;
        width: 100;
        margin-top: 2.5%;
        margin-right: 15px;
        border-radius: 10px 10px 10px 10px / 10px 10px 10px 10px
    }
    #enrollBtn:hover{
    	color: black;
    	background-color: gainsboro;
    	border-color: gainsboro;
    }
    .sale{
    	font-size: 13px;
    	color: orange;
    }
    .right{
        text-align: right;
        color: gray;
        font-size: 12px;
    }
    .day{
    	text-align: right;
        color: gray;
        font-size: 12px;
    }
    .postNum{
        color: black;
        height: 5px;
        font-size: 3px;
    }
    .title{
        text-align: center;
        color: #4a3933;
        font-size: 15px;
    }
    .nic{
        color: brown;
        font-size: 14px;
    }
    #check{
        width: 85%;
    }
    div[id=check]{
        float: left;
    }
    select{
        width: 70px;
        margin-top: 0.6%;
        font-size: 0.8em;
        height: 27px;
        margin-left: -3%;
    }
    .moveBtn{
    	color: white;
    	background-color: rgb(74,57,51);
    	border : none;
    	width: 80px;
    	border-radius: 10px 10px 10px 10px / 10px 10px 10px 10px
    }
    .pageBtn{
    	color: black;
    	background-color: gainsboro;
    	border-radius: 50%;
    	border: gainsboro;
    	width: 30px;
    	height: 30px;
    }
    .pageBtn:hover{
    	width: 30px;
    	height: 30px;
    	color: white;
    	background-color: orange;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <div id="content">

        <h1 style="text-align:center;">중고장터</h1>
        <br>
		
		
		<div class="postSelect" > 
            <input type="checkbox" id="saleView" name="saleView" value="saleView1"  checked><span>판매완료 제외</span>
        </div>
		
        

        <div class="search">
            <div class="put" style="text-align:center;">
                <div class="input-group input-group-sm mb-3" id="check">
                    <span class="input-group-text" id="inputGroup-sizing-sm">돋보기</span>
                    <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                </div>
               
	               <form action="saleView.mk">
	               		<select class="sort" name="sort" id="sort" onchange="this.form.submit()">
		                    <option name="sort" value="sortOfDate" id="sortOfDate">최신순</option>
		                    <option name="sort" value="sortOfCount" id="sortOfCount">조회순</option>
		                </select>
	               </form>
            </div>    
            
            
            <% if(loginMember != null) {%>
            	<a href="<%=contextPath%>/enroll.mk" class="btn btn-secondary btn-sm" id="enrollBtn">게시글 작성</a>
			<% } %>
            
        </div>
       
        <div class="postList" style="display: inline-block;">
        	<% if(!list.isEmpty()) { %>
        		<% for(Market m : list) { %>
		            <table class="postTable">
                        <thead>
                            <tr height="10px">
		                        <td class="sale">
		                        	<% if(m.getSale().equals("Y")) { %>
				            			<b>판매중</b>
				            		<% } else { %>
				            			<b>판매완료</b>
				            		<% } %> 	
		                        </td>
		                        <td class="right">조회수&nbsp;&nbsp;<%=m.getReadCount()%></td>
		                    </tr>
                        </thead>
		               <tbody>
                            <tr>
		                        <td class="thumbnail" colspan="2">
			                        <img src="<%=contextPath %>/<%=m.getTitleImg()%>" width="200px" height="200px">
		                        </td>
		                    </tr>
		                    <tr height="16px">
		                        <td class="title" colspan="2"><b><%=m.getPostTitle()%></b></td>
		                    </tr> 
                       </tbody>
		               <tfoot>
                            <tr height="10px">
                                <td class="nic"><%=m.getMemberNo()%></td>
                                <td class="day"><%=m.getCreateDate()%></td>
		                    </tr>
		                    <tr>
		                    	<td class="postNum" colspan="2"><%=m.getPostNo()%></td>
		                    </tr>
                       </tfoot> 
		            </table>
            	<% } %>
            <% }else { %>
            		등록된 게시물이 없습니다. 게시물을 작성해보세요!
            <% } %>
        </div>
        
	    <script>
		    $(document).ready(function(){
		        $("#saleView").change(function(){
		            if($("#saleView").is(":checked")){
		            	
		            }else{
		            	location.href='<%=contextPath%>/list.mk';
		            }
		        });
		    });
	    
	    	//게시글 번호
		    $(function(){
	            $(".postTable>tbody").click(function(){
	            	let mno = $(this).parent().find('tfoot').find('td').eq(2).text(); //게시글 번호
	                location.href= '<%=contextPath%>/detail.mk?mno='+mno;
	            });
	        });
	        
     		//판매중 체크박스 
//     		function onlySaleView(){
//     			if($('#saleView').is(':checked')){
<%--     				location.href='<%=contextPath%>/list.mk'; --%>
//     			}
//     		};
    		
    		//체크박스 value값 data에 저장
//     		let DATA;
//     		$("#saleView").click(function(){
//     			$("input:checkbox[name=saleView]").each(function(){
// 	    			if($(this).is("checked")){
// 	    				DATA = $(this).val();
// 	    			}
//     			});
//     		})
    		
    		// 서버에서 받아온 데이터 체크하기
//    			$("#saleView").click(function(){
//    				let DATA = "${data['saleView']}";
//    		         console.log(DATA);
// 	    		$("input:checkbox[name=saleView][value='saleView1']").attr("checked", true);
//     		});
    		
    		
     		//셀렉박스 
     		$(function() {
		    	$("select[name=sort]").val((("${market.sort}" == '') ? "" : "${market.sort}")).prop("selected", true); 
		    });
	    </script>	    
	    <br><br>
	    
    	<!-- 페이징바 -->
    	<div align="center" class="paging-area">
			<% if(currentPage != 1) {%>
				<button class="moveBtn" onclick="doPageClick(<%=currentPage -1 %>)">&lt;이전</button>
			<% } %>
			
			<% for(int i = startPage; i <= endPage; i++) { %>
				<%if(i != currentPage) {%>
					<button  class="pageBtn" onclick="doPageClick(<%=i%>)"><%=i %></button>
				<%} else {%>
					<button class="pageBtn" disabled><%= i %></button>
				<%} %>
			<% } %>
			
			<% if(currentPage != maxPage) { %>
				<button class="moveBtn" onclick="doPageClick(<%=currentPage +1 %>)">&gt;다음</button>
			<% } %>
		</div>
    
    </div>
    	<script>
			function doPageClick(currentPage){
				location.href ="<%=contextPath%>/saleView.mk?currentPage="+currentPage+"&sort=${sort}";
			}
		</script>
    	
    
    
    
    
<br><br><br><br>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>