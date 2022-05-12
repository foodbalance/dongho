<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//아이디 또는 비밀번호 미입력시 경고창
	function checkValue(){
		
		if(!document.delform.user_id.value){
			alert("아이디가 입력되지 않았습니다.")
			return false;
		}
		
		if(!document.delform.user_pwd.value){
			alert("비밀번호가 입력되지 않았습니다.")
			return false;
		}
		
	}
</script>
<script>
	var result = '${result}';
	
	if(result === "delOk"){
		alert("회원 탈퇴 성공");
		window.close();
		opener.location.href="main.do";
	}else if(result === "idError"){
		alert("아이디를 다시 확인해주세요.")
	}else if(result === "pwdError"){
		alert("비밀번호를 다시 확인해주세요.");
	}else if(result === "keyError"){
		alert("키워드를 다시 확인해주세요.");
	}
</script>
<style>
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
		<form action="mdelete.do" method="post" name="delform" onsubmit="return checkValue()" autocomplete="off">
			<h3 align="center">회원 탈퇴 페이지</h3>
			<div align="center">
				<input class="form-control" type="text" id="user_id" name="user_id" placeholder="아이디 확인" >
			</div>
			<div align="center">
				<input class="form-control" id="user_pwd" type="password"
					placeholder="비밀번호 확인" name="user_pwd">
			</div>
			<div align="center">
				<input class="form-control" id="keyword" type="text"
					placeholder="키워드 확인" name="keyword">
			</div>
			<br>
			<div align="center">
				<input type="submit" class="btn btn-primary btn-block" value="탈퇴하기">
			</div>
		</form>
	</section>








<c:import url="/WEB-INF/views/common/footer.jsp" />
</div>
</body>
</html>