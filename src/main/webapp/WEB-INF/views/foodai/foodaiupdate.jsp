<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function wait(){
		var wait = '';
		var message= '';
		wait += '<img style="display:inline; position:absolute; top:190px; left:10%;" width=300px; height=300px; src="${ pageContext.servletContext.contextPath }/resources/static/img/loading.gif">'
		message += '<br>'
		message += '<h5>이미지 판독중...</h5>'
		document.getElementById('wait').innerHTML = wait;
		document.getElementById('message').innerHTML = message;
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
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<section>
  <div class="container">
    <div class="col-xl-9 mx-auto">
        <fieldset>
          <legend align="center">이미지 분석 페이지</legend>
          <div class="row">
            <div class="col">
              <div id="wait">
              	<center>
	              	<c:set var="foodimg" value="${ imgfile }"/>
	              	<c:if test="${ !empty foodimg }">
	              		<img style="diplay:inline; top:200px; left:8%;" src="${ pageContext.servletContext.contextPath }/resources/ai_food_img/${ imgfile }" >
	              	</c:if>
	              	<c:if test="${ empty foodimg }">
	              	<img style="display:inline; position:absolute; top:155px; left:15px;" width=400px; height=400px; src="${ pageContext.servletContext.contextPath }/resources/static/img/ai.png">
	              	</c:if>
              	</center>
              </div>
            </div>
          </div>
          <div class="upload-box" align="center">
            <form action="foodaiInsert.do" method="post" enctype="multipart/form-data">
            <input class="form-control" id="user_id" type="hidden" placeholder="ID" name="user_id" value="${ sessionScope.loginMember.user_id }"/>
            <br>
            <input style="margin-bottom: 1%; " class="btn btn-outline-secondary" type="submit" value="측정하기">
            </form>
          </div>
        </fieldset>
     </div>
   </div>
</section>
<footer style="">
				<c:import url="/WEB-INF/views/common/footer.jsp" />
</footer>
</div>
</body>
</html>