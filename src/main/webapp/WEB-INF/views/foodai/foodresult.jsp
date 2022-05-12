<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<div class="container">
    <div class="col-xl-9 mx-auto">
        <fieldset>
          <legend align="center">이미지 분석 페이지</legend>
          <div class="row">
            <div class="col">
              <div id="wait">
              <center>
              	<img src="${ pageContext.servletContext.contextPath }/resources/ai_food_img/${ food_img }"/>
              </center>
              	<table>
              	<a>음식명 : ${ food_name }</a><br>
              	<a>칼로리 : ${ kcal } kcal</a><br>
              	<a>탄수화물 : ${ carbo } g</a><br>
              	<a>단백질 : ${ protein } g</a><br>
              	<a>지방 : ${ fat } g</a>
              	</table>
              </div>
            </div>
          </div>
          <div class="upload-box">
            <form action="foodaiInsert.do" method="post" enctype="multipart/form-data">
            <input class="form-control" id="user_id" type="hidden" placeholder="ID" name="user_id" value="${ sessionScope.loginMember.user_id }"/>
            <input style="margin-bottom: 1%; " class="btn btn-outline-secondary" type="submit" value="다른 음식 측정하기">
            </form>
          </div>
        </fieldset>
     </div>
   </div>
</section>
<footer style="">
				<c:import url="/WEB-INF/views/common/footer.jsp" />
</footer>
</body>
</html>