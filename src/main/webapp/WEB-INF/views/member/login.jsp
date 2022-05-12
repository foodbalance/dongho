<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodBalance</title>

<style type="text/css">
	section{
		width : 100%;
		height: 600px;
	}

	.login{
		position: absolute;
		height : 70px;
		width : 70px;
		top : 110px;
		right : 30px;
	}
	.div3{
		padding : 3px;
	}
	
	#inputID, #inputPassword{
		width : 250px;
	}
	/* 페이지 */
#ss{
	width: 70%; 
	min-width: 100%; 
	margin-right:auto; 
	margin-left:auto; 
	height: 2000px;
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
</head>
<body id="ss">
	<div id="se">
<nav>
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
</nav>
<section class="page-section cta">
		<div class="container">
	<div  class="row">
		        <div class="col-xl-9 mx-auto">
		        <div style="margin-top: 15%;" align="center">
			<h2>
		    	<span>LOG-IN</span>
		    </h2>	                           		
		    <form action="login.do" method="post">
				<div class="div3">
					<label for="inputID"></label>
					<input class="form-control" id="inputID" type="text" placeholder="ID" name="inputID" value="${ reid }" required/>			    
				
					<label for="inputPassword"></label>
					<input class="form-control" id="inputPassword" type="password" placeholder="Password" name="inputPassword" value="${ repwd }" required/>	    
			
					<input id="inputRemember" type="checkbox" value="Remember" name="inputRemember" checked/>
				    <label style="text-align:left" class="form-check-label" for="inputRemember">아이디, 비밀번호 저장</label>
				</div>
				
				<div>
					<div>  
				        <c:set var="m" value="${ message }"/>
						<c:if test="${ !empty m }">
							<span>${ message }</span>
							<span>${ login_stack }</span>
						</c:if>
						<c:set var="m2" value="${ message2 }"/>
						<c:if test="${ !empty m2 }">
							<span>${ message2 } ${ message3 }</span>
						</c:if>
			         </div>
	           	</div>      
					
					
					<br>
					<input  type="submit" value="로그인">
				    <a href="findPwdPage.do">비밀번호 찾기</a>
					
				
			 
		
			 </form>
			 <br>
<form action="kakaologin.do" method="post">			 
<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?
	client_id=0379944c5ce4811c750a64c9fa5e08a7
	&redirect_uri=https://127.0.0.1:8443/food/kakaologin.do
	&response_type=code"><img
    src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
    width="222"
    alt="카카오 로그인 버튼"
  /></a>
	<!-- REST_API키 및 REDIRECT_URi는 본인걸로 수정하세요 -->
	<!-- 저는 redirect_uri을 http://localhost:8080/member/kakaoLogin로 했습니다. -->
	<!-- 본인걸로 수정 시 띄어쓰기 절대 하지 마세요. 오류납니다. -->
	

	
	
</form>
</div>
			 
			 

			 
	     </div>                           
	</div>
</div>
</section>




<c:import url="/WEB-INF/views/common/footer.jsp" />

</div>
</body>
</html>