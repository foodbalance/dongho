<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title></title>



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
#se{
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
<br>
<br>
        <div class="row" >
          <div class="col-lg-4" >
	<!-- 최근 등록 공지글 3개 조회 출력 -->
	<div id="mdv" >
		<h4><br>공지사항</h4><br>
		<table class="tb1" id="newnotice">
			<tr>
				<th style="width: 80px">No.</th>
				<th style="width: 300px">Name</th>
				<th style="width: 90px">Value</th>
			</tr>
		</table>
	</div>
	</div>

	
	<div class="col-lg-4 mt-4 mt-lg-0">
	<div id="mdv" >
		<h4><br>게시판</h4><br>
		<table id="newnotice"  class="tb1" >
			<tr>
				<th style="width: 80px">No.</th>
				<th style="width: 300px">Name</th>
				<th style="width: 90px">Value</th>
			</tr>
		</table>
	</div>
	</div>
	<div class="col-lg-4 mt-4 mt-lg-0">
	<div id="logindiv">
		<form border="1" cellspacing="0" style="position:relative; width: 40%; " >
		<div class="parent" id="loginbox">
			<div class="div1">
					<div id="box1">
						아이디 
					</div>
				</div>
			<div class="div2"><input type="text" id="input"> </div>
			<div class="div3" ><button class="btn btn-outline-secondary"  type="submit"  style="float:left; height: 100px; border-radius: 8px;">로그인</button></div>
			<div class="div4">
					<div id="box1">
						비밀번호 
					</div>
					</div>
			<div class="div5"><input type="password" id="input"> </div>
			<div class="div6"><button type="button" id="btn">아이디 찾기</button></div>
			<div class="div7"><button type="button" id="btn1">비밀번호 찾기</button></div>
			<div class="div8"><button type="button" id="btn2">회원가입</button></div>
		</div>
		</form>	
		</div>
	</div>
	
	<div class="col-lg-4 mt-4 mt-lg-0">
	<div id="mdv2" >
		<h4><br>추천 레시피</h4><br>
		<table id="newnotice"  class="tb1" >
			<tr>
					<th style="width: 80px">No.</th>
				<th style="width: 300px">Name</th>
				<th style="width: 90px">Value</th>
			</tr>
		</table>
	</div>
	</div>
	<div class="col-lg-4 mt-4 mt-lg-0">
	<div id="mdv2" style="margin-bottom: 30%;" >
		<h4><br>운동법</h4><br>
		<table id="newnotice"  class="tb1" >
			<tr>
					<th style="width: 80px">No.</th>
				<th style="width: 300px">Name</th>
				<th style="width: 90px">Value</th>
			</tr>
		</table>
	</div>
	</div>
	<div class="col-lg-4 mt-4 mt-lg-0">
	<div id="spotdiv">
		<h4><br>스팟</h4>
	
	</div>
	</div>
	</div>
		<footer style="">
				<c:import url="/WEB-INF/views/common/footer.jsp" />
</footer>
	</div>
	

</div>
  


</body>
</html>