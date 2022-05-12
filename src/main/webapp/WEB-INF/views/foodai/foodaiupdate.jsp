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
          <div class="upload-box">
            <form action="foodaiInsert.do" method="post" enctype="multipart/form-data">
            <input class="form-control" id="user_id" type="hidden" placeholder="ID" name="user_id" value="${ sessionScope.loginMember.user_id }"/>
            <input style="margin-bottom: 1%; " class="btn btn-outline-secondary" type="submit" value="측정하기">
            </form>
          </div>
          <!-- <fieldset class="form-group">
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
          </fieldset> -->
        </fieldset>
     </div>
   </div>
</section>
<footer style="">
				<c:import url="/WEB-INF/views/common/footer.jsp" />
</footer>
</body>
</html>