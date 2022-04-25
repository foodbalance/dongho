<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 네이버 로그인 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<!-- 카카오 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 구글 로그인 -->
<meta name ="google-signin-client_id" content="475054870985-nb2ujrb17mfum0hmss48ibnrcmslgkgq.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>



<title>FoodBalance</title>
</head>
<body>
<nav>
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
</nav>
<section>
<a style="padding:10px;" href="loginPage.do">로그인</a>
<a style="padding:10px;" href="registerPage.do">회원가입</a>
<!-- 관리자 로그인 -->
<c:if test="${ !empty loginMember and loginMember.admin_ok eq 'Y' }"> 
	<div id="loginBox" class="lineA">
		${ sessionScope.loginMember.user_name } 관리자 님<br>
		<button onclick="javascript:location.href='logout.do';">로그아웃</button>
		<br>
		<c:url var="callMyInfo" value="/myinfo.do">
			<c:param name="userid" value="${ loginMember.user_id }" />
		</c:url>
			
	</div>
</c:if>
<!-- 일반 로그인 -->
<c:if test="${ !empty loginMember and loginMember.admin_ok eq 'N' }"> 
	<div id="loginBox" class="lineA">
		${ sessionScope.loginMember.user_name } 님<br>
		<button onclick="javascript:location.href='logout.do';">로그아웃</button>
		<br>
		<c:url var="callMyInfo" value="/myinfo.do">
			<c:param name="userid" value="${ loginMember.user_id }" />
		</c:url>
			
	</div>
</c:if>


<a href="${naverUrl}">네이버 로그인</a>
<a href="kakaoLogin.do">카카오로그인</a>	




<c:import url="/WEB-INF/views/common/footer.jsp" />


</body>
</html>