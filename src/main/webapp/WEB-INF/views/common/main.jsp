<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>

<head>

<head>
<style>

#aa{
	width: 40px;
	height: 30px;
  	background: black;
  	border-radius: 30px;
	margin: auto;
	
}

.square {
  width: 500px;
  height: 500px;
  background: black;
  border-radius: 30px;
}
  

</style>
<meta charset="UTF-8">
<title></title>

</head>
<body>
<nav>
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
</nav>
<br>
<br>
<section>
 <div class="container">

        <div class="row" >
          <div class="col-lg-4" style="left: 100%">
	<!-- 최근 등록 공지글 3개 조회 출력 -->
	<div style="border: 2px solid black; border-radius: 20px; padding: 0px; margin: 20px 50px 50px 30px; text-align: center; width: 390px; height: 330px; background-color: black; color: white;" >
		<h4><br>공지사항</h4>
		<table id="newnotice"  cellspacing="0" style="background-color:gray" >
			<tr>
				<th style="width: 45px">번호</th>
				<th style="width: 300px">제목</th>
				<th style="width: 90px">날짜</th>
			</tr>
		</table>
	</div>
	</div>

	
	<div class="col-lg-4 mt-4 mt-lg-0">
	<div style="right:-50px; border: 2px solid black; border-radius: 20px; padding: 0px; margin: 20px 50px 50px 30px; text-align: center; width: 390px; height: 330px; background-color: black; color: white;" >
		<h4><br>공지사항</h4>
		<table id="newnotice"  cellspacing="0" style="background-color:gray" >
			<tr>
				<th style="width: 45px">번호</th>
				<th style="width: 300px">제목</th>
				<th style="width: 90px">날짜</th>
			</tr>
		</table>
	</div>
	</div>
	<div class="col-lg-4 mt-4 mt-lg-0">
	<div style="right:-50px; border: 2px solid black; border-radius: 20px; padding: 0px; margin: 20px 50px 50px 30px; text-align: center; width: 390px; height: 170px; background-color: black; color: white;" >
		<table border="1" cellspacing="0">
		<div>
		<a id="aa">아이디</a> 
		<input type="text" name="id" placeholder="ID"><br>
		<a id="aa">비밀번호</a>
		<input type="password" name="pwd" placeholder="PASSWORD">
		<button class="btn btn-outline-dark" style type="submit">로그인</button>
		</div>
		</table>
	</div>
	</div>
	
	<div class="col-lg-4 mt-4 mt-lg-0">
	<div style="border: 2px solid black; border-radius: 20px; padding: 0px; margin: 20px 50px 50px 30px; text-align: center; width: 390px; height: 330px; background-color: black; color: white;" >
		<h4><br>추천 레시피</h4>
		<table id="newnotice"  cellspacing="0" style="background-color:gray" >
			<tr>
				<th style="width: 45px">번호</th>
				<th style="width: 300px">제목</th>
				<th style="width: 90px">날짜</th>
			</tr>
		</table>
	</div>
	</div>
	<div class="col-lg-4 mt-4 mt-lg-0">
	<div style="border: 2px solid black; border-radius: 20px; padding: 0px; margin: 20px 50px 160px 30px; text-align: center; width: 390px; height: 330px; background-color: black; color: white;" >
		<h4><br>운동법</h4>
		<table id="newnotice"  cellspacing="0" style="background-color:gray" >
			<tr>
				<th style="width: 45px">번호</th>
				<th style="width: 300px">제목</th>
				<th style="width: 90px">날짜</th>
			</tr>
		</table>
	</div>
	</div>
	<div class="col-lg-4 mt-4 mt-lg-0">
	<div style="border: 2px solid black; border-radius: 20px; padding: 0px; margin: 20px 50px 50px 30px; text-align: center; width: 390px; height: 480px; background-color: black; color: white; top:-27%; position: relative;" >
		<h4><br>스팟</h4>
	
	</div>
	</div>
	</div>
	</div>
</section>
  

<footer>

				<c:import url="/WEB-INF/views/common/footer.jsp" />
</footer>
</body>
</html>
