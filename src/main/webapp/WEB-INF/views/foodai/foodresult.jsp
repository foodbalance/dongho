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
              </center><br>
              	<table class="table table-hover">
			  <thead>
			    <tr class="table-primary">
			      <th scope="col">음 식 명</th>
			      <th scope="col">칼로리 (kcal)</th>
			      <th scope="col">탄수화물 (g)</th>
			      <th scope="col">단백질 (g)</th>
			      <th scope="col">지방 (g)</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr class="table-active">
			      <th scope="row">${ food_name }</th>
			      <td>${ kcal }</td>
			      <td>${ carbo }</td>
			      <td>${ protein }</td>
			      <td>${ protein }</td>
			    </tr>
			  </tbody>
			</table>
              </div>
            </div>
          </div>
          <br><br>
          <p>일일 권장량 대비 칼로리량 </p>
          <div class="progress">
		  <div class="progress-bar bg-success" role="progressbar" style="width: ${kcal_rate}%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">${ kcal_rate }%</div>
		</div><br>
		<p>일일 권장량 대비 탄수화물량</p>
		<div class="progress">
		  <div class="progress-bar bg-info" role="progressbar" style="width: ${carbo_rate}%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">${ carbo_rate }%</div>
		</div><br>
		<p>일일 권장량 대비 단백질량</p>
		<div class="progress">
		  <div class="progress-bar bg-warning" role="progressbar" style="width: ${protein_rate}%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">${ protein_rate }%</div>
		</div><br>
		<p>일일 권장량 대비 지방량</p>
		<div class="progress">
		  <div class="progress-bar bg-danger" role="progressbar" style="width: ${fat_rate}%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">${ fat_rate }%</div>
		</div><br>
          <div class="upload-box" align="center">
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