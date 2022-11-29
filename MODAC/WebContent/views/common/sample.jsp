<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.modac.member.model.vo.Member"%>

<%
    String contextPath = request.getContextPath();
	Member loginMember = (Member) session.getAttribute("loginMember"); 
	// 로그인 전 or  로그인 실패 : null
	// 로그인 성공 후 : 로그인한 회원의 정보가 담긴 member 객체 반환
	
	String alertMsg = (String) session.getAttribute("alertMsg");
	// 서비스 요청 전 : null
	// 서비스 요쳥 성공 후 : alert로 띄워줄 메시지 문구
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴바</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


<style>

@import url('https://fonts.googleapis.com/css2?family=Hahmlet&family=Poor+Story&family=Do+Hyeon&display=swap');

html{font-size: 10px}
body{font-size: 1.6rem}
*{margin: 0;padding: 0;}
ul li,
ol li{list-style: none;}
a{text-decoration: none;color: inherit;}


#header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding-top: 1rem;
	position: relative; 
	background-color: rgb(240,165,0);
	color: white;
	font-family: 'Do Hyeon', sans-serif;
	font-size: large;
}
#header #gnb{display: flex;z-index: 99;margin-left: auto;}
#header #gnb > .dept1 {position: relative; padding: 2rem 4rem;text-align: center; }
#header #gnb > .dept1 > a.active{color: white;}

#header #gnb .inner_menu {position: absolute;top: 100%;left:50%;transform: translateX(-50%);width:100%;padding-top:3rem;display: none}
#header #gnb  .dept2 {padding: 1rem 0;color: #555}
#header #gnb  .dept2 > a:hover,
#header #gnb  .dept2 > a:active,
#header #gnb  .dept2 > a:focus {color: rgb(240,165,0); text-decoration: none;}

#header .menu_bar {margin-left: auto;z-index: 9999;position: relative;}
#header .menu_bar.active span:nth-child(1){display: none}
#header .menu_bar.active span:nth-child(2){transform:rotate(130deg)}
#header .menu_bar.active span:nth-child(3){transform: rotate(45deg);top: 0px;position: absolute}
#header .menu_bar span{width: 22px;height: 2px;background: #555;display: block;margin: 6px}
.menu_open{position: fixed;width: 100%;height: 100vh;background: #fff;top: 0;left: 0;z-index: 999;padding: 3rem;display: none}
.menu_open > ul{display: flex;}
.menu_open > ul li{width: 20%;}

.hd_bg{background: #fff;width: 100%;height: 0;left: 0;z-index: 1;position: absolute;}

.visual{background:#ccd1f1;width: 100%;height: 100vh;}




</style>


</head>


<body>

	<!--header-->
	<div id="header">
		
		<ul id="gnb">
			<li class="dept1">
				<a href="#">캠핑장 검색</a>
				<ul class="inner_menu">
					<li class="dept2">
						<a href="#">&nbsp;</a>
					</li>
					<li class="dept2">
						<a href="#">&nbsp;</a>
					</li>
					<li class="dept2">
						<a href="#">&nbsp;</a>
					</li>
					<li class="dept2">
						<a href="#">&nbsp;</a>
					</li>
				</ul>
			</li>
			<li class="dept1">
				<a href="#">공지사항</a>
				<ul class="inner_menu">
					<li class="dept2">
						<a href="#">모닥불 소식</a>
					</li>
					<li class="dept2">
						<a href="#">캠핑 팁</a>
					</li>
					<li class="dept2">
						<a href="#">Q&A</a>
					</li>
					<li class="dept2">
						<a href="#">FAQ</a>
					</li>
				</ul>
			</li>
			<li class="dept1">
				<a href="#">모닥불 이야기</a>
				<ul class="inner_menu">
					<li class="dept2">
						<a href="#">캠핑장 리뷰</a>
					</li>
					<li class="dept2">
						<a href="#">레시피 자랑</a>
					</li>
					<li class="dept2">
						<a href="#">사진스타그램</a>
					</li>
					<li class="dept2">
						<a href="#">&nbsp;</a>
					</li>
				</ul>
			</li>
			<li class="dept1">
				<a href="#">중고장터</a>
				<ul class="inner_menu">
					<li class="dept2">
						<a href="#">&nbsp;</a>
					</li>
					<li class="dept2">
						<a href="#">&nbsp;</a>
					</li>
					<li class="dept2">
						<a href="#">&nbsp;</a>
					</li>
					<li class="dept2">
						<a href="#">&nbsp;</a>
					</li>
				</ul>
			</li>
			<li class="dept1">
				<a href="#">동아리 모집</a>
				<ul class="inner_menu">
					<li class="dept2">
						<a href="#">&nbsp;</a>
					</li>
					<li class="dept2">
						<a href="#">&nbsp;</a>
					</li>
					<li class="dept2">
						<a href="#">&nbsp;</a>
					</li>
					<li class="dept2">
						<a href="#">&nbsp;</a>
					</li>
				</ul>
			</li>
		</ul>

		<a href="#" class="menu_bar" style="visibility: hidden;">
			<span></span>
			<span></span>
			<span></span>
		</a>


		<div class="hd_bg"></div>

	</div>
	<!--//header-->

	<div class="visual">

	</div>



    <script>

$(document).ready(function() {
			var gnb = $('#gnb');

			// 마우스 over 시
			gnb.mouseenter(function() {
				$('.inner_menu').show();
				// menu bg
				var menuHeight = $('#header').outerHeight();
				var inmeHegiht = $('.inner_menu').outerHeight();
				$('.hd_bg').css({
					'top': menuHeight + 'px',
					height: inmeHegiht + 'px'
				});
			});

			// 마우스  leave 시
			gnb.mouseleave(function() {
				$('.inner_menu').hide();
				$('.hd_bg').css('height', '0')

			});

			//dept2 hover시 dept1 active
			$('.dept1').mouseenter(function() {
				$(this).children().addClass('active');
				$(this).siblings().children().removeClass('active')
			});
			$('.dept1').mouseleave(function() {
				$(this).children().removeClass('active');
			});
			
			/* 햄버거 메뉴 */
			$('.menu_bar').click(function(){
				$(this).toggleClass('active');
				$('.menu_open').slideToggle();
			});
		});

    </script>


</body>
</html>