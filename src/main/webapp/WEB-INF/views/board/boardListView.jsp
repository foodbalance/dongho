<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="commonview.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
 


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title></title>


<script type="text/javascript">
	function showWrite(){
	   location.href = "${ pageContext.servletContext.contextPath }/bwform.do";
	}
</script>   

<!-- 공지사항 -->
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		showDiv();
		
		$("input[name=item]").on("change", function(){
			showDiv();
		});
	});
	
	function showDiv(){
		if($("input[name=item]").eq(0).is(":checked")){
			$("#titleDiv").css("display", "block");
			$("#writerDiv").css("display", "none");
			$("#dateDiv").css("display", "none");
		}
		if($("input[name=item]").eq(1).is(":checked")){
			$("#titleDiv").css("display", "none");
			$("#writerDiv").css("display", "block");
			$("#dateDiv").css("display", "none");
		}
		if($("input[name=item]").eq(2).is(":checked")){
			$("#titleDiv").css("display", "none");
			$("#writerDiv").css("display", "none");
			$("#dateDiv").css("display", "block");
		}
	}
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
 	<section class="page-section cta">
		<div class="container">
		<br><br>
		    <div style="background-color: #1a1a1a;" class="row">
		        <div class="col-xl-9 mx-auto">
		        	<br>
			        <h1 style="color: white;" align="center">게시판</h1>
			        <br>
		            <div class="cta-inner bg-faded text-center rounded">
<!-- =============================================================================== -->
						<% int num = 1; %>
						<table style="margin-bottom:3%; width: 98%;background: white;border-radius: 0.5rem;border: 1px solid #ced4da;text-align: center;"align="center" cellspacing="0" cellpadding="10">
							<tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th><th>첨부파일</th></tr>
							<c:forEach items="${ requestScope.list }" var="b">
							   <tr>
							      <td><%= num++%></td>
							      <td>
								      <c:url var="bdt" value="bdetail.do">
								         <c:param name="board_no" value="${ b.board_no }"/>
								         <c:param name="page" value="${ currentPage }"/>
								      </c:url>
								      <a href="${ bdt }">${ b.board_title }</a>
							      </td>
							      <td>${ b.user_id }</td>
							      <td><fmt:formatDate value="${ b.board_date }" type="date" pattern="yyyy-MM-dd"/></td>
							      <td>${ b.board_count }</td>
							      <td>
							         <c:if test="${ !empty b.board_original_img }">
							        	 ◎
							         </c:if>
							         <c:if test="${ empty b.board_original_img }">
							         	&nbsp;
							         </c:if>
							      </td>
							   </tr>
							</c:forEach>
						</table>
						<br>
						<c:import url="/WEB-INF/views/common/paging.jsp" />
<!-- =============================================================================== -->
					</div>
					<br>
					<!-- 게시글 쓰기(등록)은 로그인한 회원만 가능함 -->
					<c:if test="${ !empty sessionScope.loginMember }">
					   <div style="align:center; text-align:center;">
					      <button style="background-color: white;" class="btn btn-primary btn-block" onclick="showWrite();">글쓰기</button>
					   </div>
					</c:if>
					<br>
					<!-- 검색 항목 -->
					<center>
					<div style="background-color: white; border-radius: 0.25rem; border-radius: 0.5rem;border: 1px solid #e6a756; padding: 5px; margin: 5px;">
						<div>
							<h2 >검색할 항목을 선택하세요.</h2>
							<input type="radio" name="item" value="title" checked> 제목 &nbsp; &nbsp;
							<input type="radio" name="item" value="writer"> 작성자 &nbsp; &nbsp;
							<input type="radio" name="item" value="date"> 날짜 
						</div>
						<div id="titleDiv">
							<form action="bsearchTitle.do" method="post">
								<label>검색할 제목을 입력하세요 : <input type="search" name="keyword"></label>
								<input  class="btn btn-outline-secondary" type="submit" value="검색">
							</form>
						</div>
						<div id="writerDiv">
							<form action="bsearchWriter.do" method="post">
								<label>검색할 작성자를 입력하세요 : <input type="search" name="keyword"></label>
								<input style="background-color: white;" class="btn btn-outline-secondary" type="submit" value="검색">
							</form>
						</div>
						<div id="dateDiv">
							<form action="bsearchDate.do" method="post">
								<label>검색할 날짜를 입력하세요 : <input type="date" name="begin"> ~ <input type="date" name="end"></label>
								<input style="background-color: white;" class="btn btn-outline-secondary" type="submit" value="검색">
							</form>
						</div>
						<button style="margin-bottom: 1%; " class="btn btn-outline-secondary" onclick="javascript:location.href='${ pageContext.servletContext.contextPath }/blist.do;'">전체
								보기</button>
						</div>
					</center>
<!-- =============================================================================== -->
	
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
