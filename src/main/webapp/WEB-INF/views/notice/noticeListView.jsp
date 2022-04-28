<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="commonview.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html lang="en">
<head>
<!-- <meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" /> -->

<style type="text/css">
.th {
	border-bottom: 1px solid #52575c;
	padding: 15px;
}

.td {
	border-bottom: 1px solid #52575c;
	padding: 15px;
}




</style>

<title></title>


<script type="text/javascript">
	function showWrite() {
		location.href = "${ pageContext.servletContext.contextPath }/noticeWrite.do";
	}
</script>

<!-- 공지사항 -->
<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		showDiv();

		$("input[name=item]").on("change", function() {
			showDiv();
		});
	});

	function showDiv() {
		if ($("input[name=item]").eq(0).is(":checked")) {
			$("#titleDiv").css("display", "block");
			$("#writerDiv").css("display", "none");
			$("#dateDiv").css("display", "none");
		}
		if ($("input[name=item]").eq(1).is(":checked")) {
			$("#titleDiv").css("display", "none");
			$("#writerDiv").css("display", "block");
			$("#dateDiv").css("display", "none");
		}
		if ($("input[name=item]").eq(2).is(":checked")) {
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
			<br> <br>
			<div style="padding: 5px; margin: 5px;" class="row">
				<div class="col-xl-9 mx-auto">
					<br>
					<p style="color: #52575c; font-size: 45px;" align="center">
						<b>공지사항</b>
					</p>
					<ul class="nav nav-tabs">
						<li class="nav-item"><a style="color: #52575c;"
							class="nav-link" data-bs-toggle="tab" href="#titleDiv">제목 검색</a>
						</li>
						<li class="nav-item"><a style="color: #52575c;"
							class="nav-link" data-bs-toggle="tab" href="#writerDiv">작성자
								검색</a></li>
						<li class="nav-item"><a style="color: #52575c;"
							class="nav-link" data-bs-toggle="tab" href="#dateDiv">날짜 검색</a></li>

					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade" id="titleDiv">
							<form action="nsearchTitle.do" method="post">
								<label>검색할 제목을 입력하세요 : <input type="search"
									name="keyword"></label> <input style="margin-bottom: 0.7%;"
									class="btn btn-outline-secondary" type="submit" value="검색">
							</form>
						</div>
						<div class="tab-pane fade" id="writerDiv">
							<form action="nsearchWriter.do" method="post">
								<label>검색할 작성자를 입력하세요 : <input type="search"
									name="keyword"></label> <input style="margin-bottom: 0.7%;"
									class="btn btn-outline-secondary" type="submit" value="검색">
							</form>
						</div>
						<div class="tab-pane fade" id="dateDiv">
							<form action="nsearchDate.do" method="post">
								<label>검색할 날짜를 입력하세요 : <input type="date" name="begin">
									~ <input type="date" name="end"></label> <input
									style="margin-bottom: 0.7%;" class="btn btn-outline-secondary"
									type="submit" value="검색">
							</form>
						</div>
					</div>
					<br>
					<div class="cta-inner bg-faded text-center rounded">
						<!-- =============================================================================== -->
						<%
							int num = 1;
						%>
						<table style="width: 98%;">
							<tr>
								<th class="th">번호</th>
								<th class="th">제목</th>
								<th class="th">작성자</th>
								<th class="th">날짜</th>
								<th class="th">조회수</th>
							</tr>
							<c:forEach items="${ requestScope.list }" var="n">
								<tr>
									<td class="td"><%=num++%></td>
									<td class="td"><c:url var="ndt" value="ndetail.do">
											<c:param name="notice_no" value="${ n.notice_no }" />
											<c:param name="page" value="${ currentPage }" />
										</c:url> <a style="color: #52575c; text-decoration: none;"
										href="${ ndt }">${ n.notice_title }</a></td>
									<td class="td">${ n.user_id }</td>
									<td class="td"><fmt:formatDate value="${ n.notice_date }"
											type="date" pattern="yyyy-MM-dd" /></td>
									<td class="td">${ n.notice_count }</td>
								</tr>
							</c:forEach>
						</table>

				
						<br>
						<c:import url="/WEB-INF/views/common/paging.jsp" />
						<!-- =============================================================================== -->
					</div>
					<br>
					<!-- 로그인한 회원이 관리자인 경우는 공지사항 등록 버튼이 보이게 함 -->
					<c:if test="${ loginMember.admin_ok eq 'Y' }">
						<div>
							<button class="btn btn-outline-secondary"
								onclick="javascript:location.href='noticeWrite.do';">공지 등록</button>
						</div>
					</c:if>

					<!-- 게시글 쓰기(등록)은 로그인한 회원만 가능함 paging.jsp 로 기능 옮김 -->
					<%-- <c:if test="${ !empty sessionScope.loginMember }">
					   	<div class="div2">
					      <button class="btn btn-outline-secondary" onclick="showWrite();">글쓰기</button>
					   	</div>
					</c:if> --%>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>