<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<section>
  <div class="container">
    <div class="col-xl-9 mx-auto">
        <fieldset>
          <legend align="center">이미지 분석 페이지</legend>
          <div class="row">
            <div class="col">
              <br><br><br><br><br><br><br><br><br><br>
              <div>
              	<c:set var="m" value="${ message }"/>
              	<c:if test="${ !empty m }">
              		<h2>${ message }</h2>
              	</c:if>
              </div>
            </div>
          </div>
          <div class="upload-box">
            <form action="foodImgfileUpload.do" method="post" enctype="multipart/form-data">
            <input class="form-control" id="user_id" type="hidden" placeholder="ID" name="user_id" value="${ sessionScope.loginMember.user_id }"/>
            <input class="form-control" type="file" name="fupfile" value="음식이미지">
            <input style="margin-bottom: 1%; " class="btn btn-outline-secondary" type="submit" value="사진등록하기">
            </form>
          </div>
          <fieldset class="form-group">
            <legend class="mt-4">아침, 점심, 저녁 중 한가지를 선택해주세요.</legend>
            <div class="form-check">
              <label class="form-check-label">
                <input type="radio" class="form-check-input" name="optionsRadios" id="breakfast" value="option1" checked="">
                아침
              </label>
            </div>
            <div class="form-check">
              <label class="form-check-label">
                <input type="radio" class="form-check-input" name="optionsRadios" id="lunch" value="option2">
                점심
              </label>
            </div>
            <div class="form-check disabled">
              <label class="form-check-label">
                <input type="radio" class="form-check-input" name="optionsRadios" id="dinner" value="option3">
                저녁
              </label>
            </div>
          </fieldset>
        </fieldset>
     </div>
   </div>
</section>
<footer style="">
				<c:import url="/WEB-INF/views/common/footer.jsp" />
</footer>
</body>
</html>