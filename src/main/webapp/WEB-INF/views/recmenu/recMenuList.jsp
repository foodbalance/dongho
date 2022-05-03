<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="commonview.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천 레시피 페이지</title>
</head>

<style> 
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
  	
p{
	color:white;
 }

.parent {
display: grid;
grid-template-columns: repeat(5, 1fr);
grid-template-rows: repeat(2, 1fr);
grid-column-gap: 0px;
grid-row-gap: 0px;
}

#divin1{
	width: 200px; margin: 50px 30px 0px -200px; height: 250px; border: 1px solid black; background-color: black; color:white;
}
#divin2{
  float:left; margin: 50px 30px 30px -200px; width: 200px; height: 250px; border: 1px solid black; background-color: black; color:white;
}

.parent {
display: grid;
grid-template-columns: repeat(6, 1fr);
grid-template-rows: repeat(2, 1fr);
grid-column-gap: 0px;
grid-row-gap: 0px;
}

.div1 { grid-area: 1 / 1 / 2 / 2; }
.div2 { grid-area: 1 / 3 / 2 / 4; }
.div3 { grid-area: 1 / 4 / 2 / 5; }
.div4 { grid-area: 1 / 5 / 2 / 6; }
.div5 { grid-area: 1 / 6 / 2 / 7; }
.div6 { grid-area: 2 / 3 / 3 / 4; }
.div7 { grid-area: 2 / 4 / 3 / 5; }
.div8 { grid-area: 2 / 5 / 3 / 6; }
.div9 { grid-area: 2 / 6 / 3 / 7; }

</style>
<body>
<div style=" position:static;  width: 70%; min-width: 100%; margin-right:auto; margin-left:auto; ">
<div id="se">
	<nav>
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	</nav>
	<br>
<br>
<h1 align="center">추천 레시피</h1>
<div class="parent" align="center">
<div class="div1" style="z-index:1; border: 1px solid black; border-radius: 10px; height: 160px; width: 130px; background-color: black">
<div style=" color:white;">
<br>
			<div style="">다이어트 추천</div> 
		<div >
			<button style="width:70%; height: 40px; margin: 20px 0px 0px 0px; border-radius: 5px; background-color: gray; color:white; ">추천메뉴</button>	
		</div>
		<p></p>
		<div>
			<button style="width:70%; height: 40px; margin: -10px 0px 0px 0px; border-radius: 5px; background-color: gray; color:white; ">운동법</button>
		</div>
	</div>	 </div>
<div class="div2" id="divin1">
		<br>
		<div>레시피</div>
		<div><img alt="" src="">	</div>
 </div>

<div class="div3"  id="divin1">
		<br>
		<div>레시피</div>
	 <div><img alt="" src="">	</div>
 </div>

 
 <div class="div4" id="divin1"> 
		<br>
		<div>레시피</div>
	 <div><img alt="" src="">	</div>
 </div>

<div class="div5" id="divin1"> 
	<br>
		<div>레시피</div>
<div><img alt="" src="">	</div>
 </div>

<div class="div6" id="divin2"> 
	<br>
		<div>레시피</div>
<div><img alt="" src="">	</div>
 </div>

<div class="div7" id="divin2"> 
<br>
		<div>레시피</div>
	<div><img alt="" src="">	</div>
 </div>

<div class="div8" id="divin2"> 
<br>
		<div>레시피</div>
	<div><img alt="" src="">	</div>
 </div>

<div class="div9" id="divin2">
<br>
		<div>레시피</div>
	<div><img alt="" src="">	</div>
 </div>

</div>
<div align="right" style="margin: 0px 175px 0px 0px;">
	<button onclick="#" style="border: 1px solid; border-radius: 5px; width: 90px; height: 40px; "  >메뉴 등록</button>	
</div>
<footer style="">
				<c:import url="/WEB-INF/views/common/footer.jsp" />
</footer>
</div>

</body>
</html>