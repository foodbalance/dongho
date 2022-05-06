<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function keywordCheck(){
				
			var result = "";
			var message = "";
				
			$.ajax({
				url: "keywordchk.do",
				type: "post",
				data: { keyword: $("#keyword").val(), user_id: $("#user_id").val() },
				success: function(data){
					console.log("success : " + data);
					if(data == "ok"){
						$('.newPwd').css('display', 'block');
						message += '<h5 align="left" style="color:red;" id="idcheck">아이디, 키워드 일치.</h5>'
						result += '<input id="check2" type="hidden" value="ok">'
							
						document.getElementById("check").innerHTML = message;
						document.getElementById("check1").innerHTML = result;
							
						$("#user_pwd").focus();
						
						

					}else{	
						message += '<h5 align="left" style="color:red;" id="idcheck">아이디 또는 키워드 불일치</h5>'
						result += '<input id="check2" type="hidden" value="no">'
							
						document.getElementById("check").innerHTML = message;
						document.getElementById("check1").innerHTML = result;
						$("#user_id").select();
						
					}
				},
				error: function(jqXHR, textstatus, errorthrown){
					console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown)
				}
			});
			
				
		}
</script>
<style type="text/css">
	.newPwd{
		display : none
	}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<h1>비밀번호 찾기</h1>

<h5 align="left">키워드 확인</h5>

<div>
	<input class="form-control" id="user_id" placeholder="아이디" name="user_id" required>
	<input class="form-control" id="keyword" placeholder="비밀번호 찾기 키워드" name="keyword" required>
	<input style="display:inline" type="button" value="키워드 확인" onclick="return keywordCheck();"> 
</div>
<h5 align="left" id="check"></h5>

<form class="newPwd" action="pwdpdate.do" method="post" onsubmit="return validate();">
	<h5 align="left">아이디</h5>
			           
	<div align="left">
		<input id="user_id" type="text" name="user_id" placeholder="비밀번호 찾을 아이디">
	</div>   
			         
	<h5 align="left">새로운 비밀번호</h5>
	<div align="left">
		<input id="user_pwd" type="password" placeholder="새로운 비밀번호 입력" name="user_pwd">
	</div>
	<h5 align="left">비밀번호 확인</h5>
	<div align="left">
		<input id="user_pwd2" type="password" placeholder="새로운 비밀번호 확인" name="user_pwd2">
	</div>
	<input type="submit" value="변경하기">
</form>



<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>