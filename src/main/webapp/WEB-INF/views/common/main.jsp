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



<style>





.tb1{ 
	cellspacing:0; 
	background-color: #e6e6e6; 
	height: 20%; 
	color: black; 
	width: 100%;


}



#logindiv{
	right:-50px; 
	border: 2px solid black; 
	border-radius: 20px; 
	padding: 0px; 
	margin: 20px 30px 0px 25px; 
	text-align: center; 
	width: 400px; 
	height: 170px; 
	background-color: black; 
	color: white;
	
}
#loginbox{
	margin: 7%; padding: 0px;
	position:static; 
}
#box1{
	margin:auto; width: 90px; height: 40px; font-size: 15px; background-color: gray; border-radius: 5px; padding-top: 8px;
}


#spotdiv{
	border: 2px solid black;
	border-radius: 20px; 
	padding: 0px; 
	margin: -130px 30px 30px 25px; 
	text-align: center; 
	width: 400px; 
	height: 480px; 
	background-color: black; 
	color: white; 
	top:-27%; 


}
#input{
	margin: 5px;
}
/*   로그인창 버튼  */
#btn{
	margin: 0;
	padding: 0;
	border-radius: 9px;
	font-size: 13px;
	width: 100px;
}
#btn1{
	float: left;
	margin-top: 1.5px;
	padding 0px;
	border-radius: 9px;
	font-size: 13px;
	width: 100px;
}
#btn2{
	margin: 0 0 0 -20px;
	padding 0;
	border-radius: 9px;
	font-size: 13px;
	width: 100px;
}

/*   로그인창 버튼  end */


/* 로그인창 그리드  */
.parent {
display: grid;
grid-template-columns: repeat(3, 1fr);
grid-template-rows: repeat(5, 1fr);
grid-column-gap: 3px;
grid-row-gap: 7px;
}

.div1 { grid-area: 1 / 1 / 2 / 2; }
.div2 { grid-area: 1 / 2 / 2 / 3; }
.div3 { grid-area: 1 / 3 / 3 / 4; }
.div4 { grid-area: 2 / 1 / 3 / 2; }
.div5 { grid-area: 2 / 2 / 3 / 3; }
.div6 { grid-area: 3 / 1 / 4 / 2; }
.div7 { grid-area: 3 / 2 / 4 / 3; }
.div8 { grid-area: 3 / 3 / 4 / 4; }



td{
	background-color: black; color: white; border: 3px solid white;
}
  
/*  박스  */
.square {
  width: 500px;
  height: 500px;
  background: black;
  border-radius: 30px;
}


/*   겉 테두리  */
#se {
	position: relative;
	margin: auto;
	
	
	width: 100%;
	max-width: 1350px;
	height: 100%;
 	background: white;
 	border-radius: 30px;
 	border: 3px solid black;
 	flex-wrap: wrap; 
 	transition: all ease-in-out 0.3s;
  }	
  	
#mdv{
	border: 2px solid black;
	border-radius: 20px; 
	padding: 0px; 
	margin: 20px 30px 30px 25px; 
	text-align: center; 
	width: 400px; 
	height: 330px; 
	background-color: black; 
	color: white;
	position:relative;
}

#mdv2{
	border: 2px solid black;
	border-radius: 20px; 
	padding: 0px; 
	margin: 20px 30px 30px 25px; 
	text-align: center; 
	width: 400px; 
	height: 330px; 
	background-color: black; 
	color: white;
	position:relative;
}


</style>



</head>
<body>

<div style=" position: width: 70%; min-width: 100%; margin-right:auto; margin-left:auto; ">
 <div  id="se">
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