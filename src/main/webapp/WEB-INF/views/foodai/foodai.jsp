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
          <div class="upload-box" align="center">
            <form action="foodImgfileUpload.do" method="post" enctype="multipart/form-data">
            <input class="form-control" id="user_id" type="hidden" placeholder="ID" name="user_id" value="${ sessionScope.loginMember.user_id }"/>
            <input class="form-control" type="file" name="fupfile" value="음식이미지"><br>
            <input style="margin-bottom: 1%; " class="btn btn-outline-secondary" type="submit" value="사진등록하기">
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