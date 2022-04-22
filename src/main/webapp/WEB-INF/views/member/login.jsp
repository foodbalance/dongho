<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<nav>
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
</nav>
<section>
	<div class="col-xl-6">
		<h2 class="section-heading mb-5">
	    	<span class="section-heading-lower">로그인</span>
	    </h2>
	                           		
	    <form action="login.do" method="post">
			<div>
				<input id="inputID" type="text" placeholder="ID" name="inputID" value="${ reid }" required/>
			    <label for="inputID">아이디</label>
			</div>
			<div>
				<input id="inputPassword" type="password" placeholder="Password" name="inputPassword" value="${ repwd }" required/>
			    <label for="inputPassword">비밀번호</label>
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

</section>




<c:import url="/WEB-INF/views/common/footer.jsp" />


</body>
</html>