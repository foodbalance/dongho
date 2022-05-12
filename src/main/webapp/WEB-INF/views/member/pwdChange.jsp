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
				$('.message').css('display', 'none');
				message += '<h5 align="center" style="color:red;" id="idcheck"></h5>'
				result += '<input id="check2" type="hidden" value="ok">'
							
				document.getElementById("check").innerHTML = message;
				document.getElementById("check1").innerHTML = result;
							
				/* $("#user_pwd").focus(); */
			}else{
				$('.newPwd').css('display', 'none');
				$('.message').css('display', 'none');
				message += '<h5 align="center" style="color:red;" id="idcheck">아이디 또는 키워드 불일치</h5>'
				result += '<input id="check2" type="hidden" value="no">'
							
				document.getElementById("check").innerHTML = message;
				document.getElementById("check1").innerHTML = result;
				/* $("#user_id").select(); */
						
			}
		},
		error: function(jqXHR, textstatus, errorthrown){
			console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown)
		}
	});
		
}
</script>
<style type="text/css">
	.check, .pwd{
		width : 200px;
	}
	.newPwd{
		display : none
	}
	.center{
		margin-top : 30px;
		width : 380px;
		border: 1px solid blue;
	}
	.form-control, .button, h1{
		margin-top : 5px;
	}
	.button{
		margin : 10px;
	}
	.message{
		width : 240px;
		margin-left : -20px;
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
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<center>
<div class="center">
	<h1>비밀번호 찾기</h1>

	<div class="check">
		<h5 align="left">키워드 확인</h5>
		<input class="form-control" id="user_id" placeholder="아이디" name="user_id" required>
		<input class="form-control" id="keyword" placeholder="비밀번호 찾기 키워드" name="keyword" required>
		<input class="button" style="display:inline" type="button" value="키워드 확인" onclick="return keywordCheck();"> 
	</div>
	<h5 align="left" id="check"></h5>
	<div class="pwd">
		<form class="newPwd" action="pwdupdate.do" method="post" onsubmit="return validate();">
			<h5 align="left">아이디</h5>
					           
			<div align="left">
				<input class="form-control" id="user_id" type="text" name="user_id" placeholder="비밀번호 찾을 아이디">
			</div>   
					         
			<h5 align="left">새로운 비밀번호</h5>
			<div align="left">
				<input class="form-control" id="user_pwd" type="password" placeholder="새로운 비밀번호 입력" name="user_pwd">
			</div>
			<h5 align="left">비밀번호 확인</h5>
			<div align="left">
				<input class="form-control" id="user_pwd2" type="password" placeholder="새로운 비밀번호 확인" name="user_pwd2">
			</div>
			<input class="button" type="submit" value="변경하기">
		</form>
		
		<div class="message">  
			<c:set var="m" value="${ message }"/>
				<c:if test="${ !empty m }">
				<span>${ message }</span>
			</c:if>			
		</div>
	</div>
</div>
</center>



<c:import url="/WEB-INF/views/common/footer.jsp" />
</div>
</body>
</html>