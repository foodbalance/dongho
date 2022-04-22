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
	.div1{		
		position: absolute;
		top : 50%;
		left : 50%;
		transform: translate(-50%, -50%);
	}
	.div2{
		background-color: yellow;
		width : 300px;
		height: 200px;
	}
</style>
</head>
<body>
<nav>
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
</nav>
<section>
	<div class="div1">
		<div class="div2">
			<h2>
		    	<span>로그인</span>
		    </h2>	                           		
		    <form action="login.do" method="post">
				<div>
					<label for="inputID">아 이 디 </label>
					<input id="inputID" type="text" placeholder="ID" name="inputID" value="${ reid }" required/>			    
				</div>
				<div>
					<label for="inputPassword">비밀번호 </label>
					<input id="inputPassword" type="password" placeholder="Password" name="inputPassword" value="${ repwd }" required/>	    
				</div>
				<div align="left">
					<input id="inputRemember" type="checkbox" value="Remember" name="inputRemember" checked/>
				    <label style="text-align:left" class="form-check-label" for="inputRemember">아이디, 비밀번호 저장</label>
				</div>
				<div>
				    <a href="findPwdPage.do">비밀번호 찾기</a>
					<input type="submit" value="로그인">
				</div>
			 </form>
	     </div>                           
	</div>

</section>




<c:import url="/WEB-INF/views/common/footer.jsp" />


</body>
</html>