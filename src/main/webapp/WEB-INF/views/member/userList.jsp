<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="listCount" value="${ requestScope.listCount }"/>
<c:set var="startPage" value="${ requestScope.startPage }"/>
<c:set var="endPage" value="${ requestScope.endPage }"/>
<c:set var="maxPage" value="${ requestScope.maxPage }"/>
<c:set var="currentPage" value="${ requestScope.currentPage }"/>

<!DOCTYPE html>
<html>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	//jQuery 로 이벤트 처리 : 검색 from 을 보이게 안보이게 처리함
	/**
	 * jQuery(document.ready(){}); => 이페이지가 브라우저에 읽어들이기가 완료되면 {}안의 내용이 자동 실행됨
	 jQuery 는 $ 로 표기해도 됨. 위의 구문은 줄여서 $(function(){}); 사용해도 됨
	 => 자바스크림트로는 window.onload = function(){};
	 */
	$(function() {
		//작성된 이벤트 처리 코드는 실행 대기 상태가 됨
		//jQuery("태그선택자").실행할메소드(전달값, ...);
		$("input[name=item]").on("change", function() {
			//change 이벤트가 발생한 radio 와 연결된 폼만 보이게하고, 나머지 폼들은 안보이게 처리함
			$("input[name=item]").each(function(index) {
				//해당 index 번째 radio 가 checked 인지 확인하고
				if ($(this).is(":checked")) {
					$("form.sform").eq(index).css("display", "block");
				} else {
					$("form.sform").eq(index).css("display", "none");
				}
			});
		});

	});

	//로그인 가능/제한 라디오 체크를 변경했을 때 실행되는 함수임
	function changeLogin(element) {
		//선택한 radio의 name 속성의 이름에서 user_id 분리 추출함
		var user_id = element.name.substring(8);
		console.log("changeLogin : " + user_id);
		if (element.checked == true && element.value == "false") {
			//로그인 제한을 체크했다면
			console.log("로그인 제한 체크함");
			location.href = "${ pageContext.servletContext.contextPath }/loginok.do?user_id=" + user_id + "&login_ok=N";
		} else {
			console.log("로그인 제한 해제함");
			location.href = "${ pageContext.servletContext.contextPath }/loginok.do?user_id=" + user_id + "&login_ok=Y";
		}
	}
</script>
<style>
	.sform{
		display : none;
	}
	th{
		background-color:rgba(0, 0, 0, 0.2);	
    	padding: 15px;
	}
	.th{
		border-bottom: 3px solid black;
	}
	.td{
		border-bottom: 1px solid black;
	}
	
	/* 페이지 */
#ss2{
	width: 70%; 
	min-width: 100%; 
	margin-right:auto; 
	margin-left:auto; 
	height: 1000px;
}

/*   겉 테두리  */
#se{
	position:relative; 
	margin: auto;
	width: 100%;
	max-width: 1350px;
	height: 2110px;
 	background: white;
 	border-radius: 30px;
 	border: 3px solid black;
 	flex-wrap: wrap; 
 	transition: all ease-in-out 0.3s;
 
 	
  }	
</style>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="ss2">
	<div id="se">
<nav>
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
</nav>


<div>
	<h1 align="center">회원 관리 페이지</h1>
	<center>
		<!-- 항목별 검색기능 -->
		<fieldset id="ss">
			<legend>검색할 항목을 선택하세요.</legend>
			<input  type="radio" name="item" id="user_id">회원 아이디 &nbsp;
			<input type="radio" name="item" id="ulogok">로그인제한 &nbsp;
		</fieldset>
		<!-- 회원 아이디로 검색 폼 -->
		<form action="${ pageContext.servletContext.contextPath }/msearch.do" method="post" , id="idform" class="sform">
			<input type="hidden" name="action" value="user_id">
			<fieldset>
				<br>
				<legend>검색할 아이디를 입력하세요.</legend>
				<input type="search" name="keyword"> &nbsp; 
				<input style="background-color: white;" type="submit" value="검색">
			</fieldset>
		</form>
							
		<!-- 로그인제한으로 검색 폼 -->
		<form action="${ pageContext.servletContext.contextPath }/loginsearch.do" method="post" id="lokform" class="sform">
			<input type="hidden" name="action" value="loginok">
			<fieldset>
				<br>
				<legend>검색할 로그인 제한/가능을 선택하세요.</legend>
				<input type="radio" name="keyword" value="Y"> 로그인 가능 회원 &nbsp; 
				<input type="radio" name="keyword" value="N"> 로그인 제한 회원 &nbsp; 
				<input style="background-color: white;" type="submit" value="검색">
			</fieldset>
		</form>
		<br>
		<button style="background-color: white;" onclick="javascript:location.href='${ pageContext.servletContext.contextPath }/userList.do'">전체보기</button>
	</center>			
	<div>						
		<!-- 조회해 온 리스트 정보 출력 -->
		<table align="center" cellspacing="0" cellpadding="10">
			<tr>
				<th class="th">아이디</th>
				<th class="th">이 름</th>
				<th class="th">생년월일</th>
				<th class="th">전화번호</th>
				<th class="th">주 소</th>
				<th class="th">키워드</th>
				<th class="th">로그인 제한</th>
			</tr>
			<c:forEach items="${ requestScope.list }" var="m">
				<tr>
					<td class="td">${ m.user_id }</td>
					<td class="td">${ m.user_name }</td>
					<td class="td">${ m.user_fnum }</td>
					<td class="td">${ m.phone }</td>
					<td class="td">${ m.address }</td>
					<td class="td">${ m.keyword }</td>
					<td class="td">
						<c:if test="${ m.login_ok eq 'Y' }">
							<input type="radio" name="loginok_${ m.user_id }" onchange="changeLogin(this);" value="true" checked> 가능 &nbsp;
           					<input type="radio" name="loginok_${ m.user_id }" onchange="changeLogin(this);" value="false"> 제한
       					</c:if> 
       					<c:if test="${ m.login_ok eq 'N' }">
							<input type="radio" name="loginok_${ m.user_id }" onchange="changeLogin(this);" value="true"> 가능 &nbsp;
            				<input type="radio" name="loginok_${ m.user_id }" onchange="changeLogin(this);" value="false" checked> 제한
         				</c:if>
       				</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<c:import url="/WEB-INF/views/common/mpaging.jsp" />	
	</div>
</div>





<c:import url="/WEB-INF/views/common/footer.jsp" />
</div>
</body>
</html>