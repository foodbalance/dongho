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

<title></title>


<script type="text/javascript">
	function showWrite() {
		location.href = "${ pageContext.servletContext.contextPath }/ndetail.do";
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
			<br>
			<br>
			<div
				style="background-color: white; border-radius: 1rem; border: 1px solid; padding: 5px; margin: 5px;"
				class="row">
				<div class="col-xl-9 mx-auto">
					<br>
					<p style="font-size: 45px;" align="center">
						<b>공지사항 상세보기(관리자용)</b>
					</p>
					<br>
					<div class="cta-inner bg-faded text-center rounded">
						<!-- =============================================================================== -->
						<table align="center" width="100%" cellspacing="0"
							cellpadding="10">
							<tr>
								<th>제 목</th>
								<td class="form-control" readonly>${notice.notice_title }</td>
							</tr>
							<tr>
								<th>작 성 자</th>
								<td class="form-control" readonly>${notice.user_id }</td>
							</tr>
							<tr>
								<th>날 짜</th>
								<td class="form-control" readonly>${notice.notice_date }</td>
							</tr>
							<tr style="overflow:scroll; width:500px; height:150px;">
								<th>내 용</th>
								<td colspan="5"><textarea class="form-control"
										name="board_content" rows="20" cols="50" readonly>${notice.notice_content }</textarea></td>
							</tr>

						</table>
						<!-- =============================================================================== -->
					</div>
					<div align="right">
						<br>
						<button class="source-button btn btn-outline-dark btn-xs" 
							role="button" tabindex="0"
							onclick="javascript:history.go(-1);">목록</button>
						<!-- 수정페이지로 이동 -->
						<c:url var="nup" value="/upmove.do">
							<c:param name="notice_no" value="${notice.notice_no }" />
						</c:url>
						<button class="source-button btn btn-outline-dark btn-xs" 
							role="button" tabindex="0"
							onclick="javascript:location.href='${nup}';">수정</button>
						<!-- 공지 삭제 -->
						<c:url var="ndel" value="/ndel.do">
							<c:param name="notice_no" value="${notice.notice_no }" />
						</c:url>
						<button class="source-button btn btn-outline-dark btn-xs" 
							role="button" tabindex="0"
							onclick="javascript:location.href='${ndel}';">글삭제</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
