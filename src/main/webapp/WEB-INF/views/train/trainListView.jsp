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

    		/* 페이지 */
#ss{
	width: 70%; 
	min-width: 100%; 
	margin-right:auto; 
	margin-left:auto; 
	height: 100%;
}
/*   겉 테두리  */
#se{
	position:relative; 
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
<body id="ss">
<div id="se"> 
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<div class="container">
		<br><br>
		    <div style=" padding: 5px; margin: 5px;" class="row">
		        <div class="col-xl-9 mx-auto">
		        	<br>
			        <p style="color: #52575c; font-size: 45px;" align="center"><b>게시판</b></p>
			        <ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a style="color: #52575c;" class="nav-link" data-bs-toggle="tab" href="#titleDiv">제목 검색</a>
					  </li>
					  
					  
					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade" id="titleDiv">
						    <form action="tsearchTitle.do" method="post">
								<label>검색할 제목을 입력하세요 : <input type="search" name="keyword"></label>
								<input style="margin-bottom: 0.7%;" class="btn btn-outline-secondary" type="submit" value="검색">
							</form>
						  </div>
						  <div class="tab-pane fade" id="dateDiv">
						    <form action="tsearchDate.do" method="post">
								<label>검색할 날짜를 입력하세요 : <input type="date" name="begin"> ~ <input type="date" name="end"></label>
								<input style="margin-bottom: 0.7%;" class="btn btn-outline-secondary" type="submit" value="검색">
							</form>
						</div>
					</div>
			        <br>
		            
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
								      
								      <a style="color: #52575c; text-decoration: none;" href="${ tdt }"><img src="${ t.train_url_img }"/>${ t.train_title }</a>
							      </td>
							      <td class="td"><fmt:formatDate value="${ t.train_date }" type="date" pattern="yyyy-MM-dd"/></td>
							      <td class="td">${ t.train_count }</td>
							   </tr>
							</c:forEach>
						</table>
					<c:import url="/WEB-INF/views/common/paging.jsp" />
					<c:if test="${ loginMember.admin_ok eq 'Y' }">
					   	<div class="parent">
						   	<div class="div1">
						      <button style="align-items: "class="btn btn-outline-secondary" onclick="showWrite();">글쓰기</button>
						   	</div>
						</div>
					</c:if>
					<br><br>
					</div>
					</div>
					</div>
					
<c:import url="/WEB-INF/views/common/footer.jsp" />
</div>
</body>
</html>