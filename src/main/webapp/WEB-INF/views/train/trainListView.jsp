<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

.th {
	border-bottom: 1px solid #444444;
	padding: 15px;
}

.td {
	border-bottom: 1px solid #444444;
	padding: 15px;
}
</style>
<title>운동법 페이지</title>
<script type="text/javascript">
	function showWrite() {
		location.href = "${ pageContext.servletContext.contextPath }/twform.do";
	}
</script>

<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />

<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" data-bs-toggle="tab" href="#home">Home</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-bs-toggle="tab" href="#profile">Profile</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-bs-toggle="tab" href="#disabled">Disabled</a>
  </li>
</ul>
<div id="myTabContent" class="tab-content">
  <div class="tab-pane fade active" id="home">
	<div class="cta-inner bg-faded text-center rounded">
    <% int num = 1; %>
	<table style="width: 98%; ">
		<tr><th class="th">번호</th><th class="th">제목</th><th class="th">날짜</th><th class="th">조회수</th></tr>
		<c:forEach items="${ requestScope.list }" var="t">
		   <tr>
		      <td class="td"><%= num++%></td>
		      <td class="td">
			      <c:url var="tdt" value="tdetail.do">
			         <c:param name="train_no" value="${ t.train_no }"/>
			         <c:param name="page" value="${ currentPage }"/>
			      </c:url>
			      <p>${ t.train_title }</p>
			      <a style="color: #52575c; text-decoration: none;" href="${ tdt }"><img src="${ t.train_url_img }"/></a>
		      </td>
		      <td class="td"><fmt:formatDate value="${ t.train_date }" type="date" pattern="yyyy-MM-dd"/></td>
		      <td class="td">${ t.train_count }</td>
		   </tr>
		</c:forEach>
	</table>
	<br>
	<c:import url="/WEB-INF/views/common/paging.jsp"/>
	</div>
  </div>
  <div class="tab-pane fade" id="profile">
    <p>profile</p>
  </div>
  <div class="tab-pane fade" id="disabled">
    <p>disabled</p>
  </div>
</div>

<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>