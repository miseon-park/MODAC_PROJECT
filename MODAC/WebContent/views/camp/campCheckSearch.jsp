<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.modac.camp.model.vo.Camp"%>
<%
	ArrayList<Camp> clist = (ArrayList<Camp>) request.getAttribute("clist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장 검색</title>

<style>

    #search-area {
        /* border: 1px solid black; */
        background-color: rgb(230, 213, 184);
        width: 1000px;
        margin:  auto;
        padding: 50px 50px;
    }
    
    span {
        color: rgb(74,57,51);
        font-size: large;
        font-weight: bold;
    }


    #loacation-s {
        margin-top: 30px;
        margin-bottom: 30px;
        
    }
    #loacation-s>span {
        margin-left: 40px;
    }
    #loc1 {
        width: 200px;
        height: 30px;
        margin-left: 80px;
    }
    #loc2 {
        width: 300px;
        height: 30px;
        margin-left: 30px;
    }



    #facility-s>span {
        margin-left: 10px;
    }

    #facility-s table {
        margin-left: 30px;
        margin-top: 20px;        
    }

    

    table {
        border-spacing: 10px;
    }
    .them {
        font-size: 16px;
        font-weight: bold;
        color: rgb(74,57,51);
        padding-right: 25px;
        border-right: 1px solid darkgray;
    }
    td {
        padding-bottom: 15px;
    }

  



    #btn-area>input {
        background-color: rgb(240, 165, 0);
        border: none;
        color: white;
        width: 300px;
        height: 40px;
    }




    #result {
        border: 1px solid black;
        width: 1200px;
        margin: auto;
    }


	.list-area{
		border: 1px solid black;
		text-align: center;
	}



</style>

</head>
<body>

    <%@ include file = "../common/menubar.jsp" %>

    <h2 style="color: rgb(74,57,51);" align="center">캠핑장 검색</h2>

    <div id="search-area">
        <div id="loacation-s">
            <span>지역 검색</span>
            <select id="loc1" onchange="changeLocation(this)">
                <option value="z">전체/도/시</option>
                <option value="a">강원도</option>
                <option value="b">경기도</option>
                <option value="c">경상남도</option>
                <option value="d">경상북도</option>
                <option value="e">전라남도</option>
                <option value="f">전라북도</option>
                <option value="g">충청남도</option>
                <option value="h">충청북도</option>
                <option value="i">제주도</option>
                <option value="j">광주시</option>
                <option value="k">서울시</option>
                <option value="l">세종시</option>
                <option value="m">대전시</option>
                <option value="n">인천시</option>
                <option value="o">대구시</option>
                <option value="p">울산시</option>
                <option value="q">부산시</option>
            </select>

            <select name="" id="loc2">
                <option>전체/시/군/기타</option>
            </select>
        </div>

        <br>

        <form name="searchForm" action="campSearch.ca">
            <div id="facility-s">
                <span>테마 및 편의 시설</span>
                <table>
                    <tr>
                    <td class="them">자연경관</td>
                    <td><input type="checkbox" name="item1" id="valley" value="계곡"><label for="valley">계곡</label></td>
                    <td><input type="checkbox" name="item1" id="ocean" value="바다"><label for="ocean">바다</label></td>
                    <td><input type="checkbox" name="item1" id="mountain" value="산"><label for="mountain">산</label></td>
                    <td><input type="checkbox" name="item1" id="river" value="강"><label for="river">강</label></td>
                    </tr>
                    <tr>
                        <td class="them">지형</td>
                        <td><input type="checkbox" name="item2" id="grass" value="잔디"><label for="grass">잔디</label></td>
                        <td><input type="checkbox" name="item2" id="deck" value="데크"><label for="deck">데크</label></td>
                        <td><input type="checkbox" name="item2" id="rock" value="파쇄석"><label for="rock">파쇄석</label></td>
                        <td><input type="checkbox" name="item2" id="soil" value="맨흙"><label for="soil">맨흙</label></td>
                        <td><input type="checkbox" name="item2" id="etc" value="기타"><label for="etc">기타</label></td>
                    </tr>
                    <tr>
                        <td class="them">편의시설</td>
                        <td><input type="checkbox" name="item3" id="toilet" value="공용화장실"><label for="toilet">공용화장실</label></td>
                        <td><input type="checkbox" name="item3" id="shower" value="공용샤워실"><label for="shower">공용샤워실</label></td>
                        <td><input type="checkbox" name="item3" id="wifi" value="와이파이"><label for="wifi">와이파이</label></td>
                        <td><input type="checkbox" name="item3" id="cook" value="개수대(취사장)"><label for="cook">개수대(취사장)</label></td>
                        <td><input type="checkbox" name="item3" id="elec" value="전기"><label for="elec">전기</label></td>
                        <td><input type="checkbox" name="item3" id="store" value="매점"><label for="store">매점</label></td>
                    </tr>
                    <tr>
                        <td class="them">반려동물 동반</td>
                        <td><input type="checkbox" name="pet" id="pet-yes" value="가능" onclick="petCheck(this);"><label for="pet-yes">가능</label></td>
                        <td><input type="checkbox" name="pet" id="pet-no" value="불가능" onclick="petCheck(this);"><label for="pet-no">불가능</label></td>
                    </tr>
                </table>
                
                <br>

                <div id="btn-area" align="right">
                    <input type="submit" id="searchBtn" value="검색">
                </div>
            </div>

        </form>

    </div>

    <br> <br>

    <div id="result">

		<table class="list-area" align="center">
			<thead>
				<tr>
					<th>캠핑장 이름</th>
					<th width="400">캠핑장 주소</th>
					<th width="100">캠핑장 경관</th>
				</tr>
			</thead>
			<tbody>
				
				<% if(clist.isEmpty()) { %>
					<!-- 리스트가 비어있는 경우 -->
					<tr>
						<td colspan="5">존재하는 공지사항이 없습니다.</td>
					</tr>
				<% } else { %>
					<% for(Camp c : clist) { %>
						<tr>
							<td><%=c.getCampName() %></td>
							<td><%=c.getAddress() %></td>
							<td><%=c.getNaturalAttri() %></td>
							<td><%=c.getNaturalAttri2() %></td>
						</tr>
					<% } %>
				<% } %>
				
				
			</tbody>
		</table>
		
    </div>


    <script>
        // 지역 검색
        function changeLocation(e) {
            var loc2_a = ['강릉시','동해시','원주시','양양군','영월군','인제군','철원군','평창군','홍천군','횡성군'];
            var loc2_b = ['남양주시','안산시','양주시','용인시','화성시','포천시','가평군','양평군','연천군'];
            var loc2_c = ['김해시','밀양시','사천시','남해군','함안군','합천군'];
            var loc2_d = ['구미시','영천시','포항시','고령군','영덕군','울진군','청도군','칠곡군'];
            var loc2_e = ['광양시','목포시','여수시','고흥군','곡성군','구례군','담양군','무안군','영암군','장성군'];
            var loc2_f = ['군산시','남원시','익산시','정읍시','고창군','부안군','순창군','완주군','임실군','장수군'];
            var loc2_g = ['논산시','당진시','서산시','아산시','부여군','청양군','태안군','홍성군'];
            var loc2_h = ['제천시','청주시','충주시','보은군','옥천군','음성군','진천군'];
            var loc2_i = ['제주시'];
            var loc2_j = ['남구'];
            var loc2_k = ['마포구','은평구'];
            var loc2_l = ['세종시'];
            var loc2_m = ['서구','유성구'];
            var loc2_n = ['계양구','남동구','강화군'];
            var loc2_o = ['동구','달성군'];
            var loc2_p = ['중구','울주군'];
            var loc2_q = ['기장군'];
            var loc2_z = ['전체/시/군/기타']
            var target = document.getElementById("loc2");

            var d;

            switch(e.value) {
                case 'a' : d = loc2_a; break;
                case 'b' : d = loc2_b; break;
                case 'c' : d = loc2_c; break;
                case 'd' : d = loc2_d; break;
                case 'e' : d = loc2_e; break;
                case 'f' : d = loc2_f; break;
                case 'g' : d = loc2_g; break;
                case 'h' : d = loc2_h; break;
                case 'i' : d = loc2_i; break;
                case 'j' : d = loc2_j; break;
                case 'k' : d = loc2_k; break;
                case 'l' : d = loc2_l; break;
                case 'm' : d = loc2_m; break;
                case 'n' : d = loc2_n; break;
                case 'o' : d = loc2_o; break;
                case 'p' : d = loc2_p; break;
                case 'q' : d = loc2_q; break;
                case 'z' : d = loc2_z; break;
            }

            target.options.length = 0;

            for(x in d) {
                var opt = document.createElement("option");
                opt.value = d[x];
                opt.innerHTML = d[x];
                target.appendChild(opt);
            }
        }

        
        // 반려동물 동반 하나만 체크
        function petCheck(element) {
            var checkboxes = document.getElementsByName("pet");
            checkboxes.forEach((e) => {
                e.checked = false;
            })
            element.checked = true;
        } 






    </script>
