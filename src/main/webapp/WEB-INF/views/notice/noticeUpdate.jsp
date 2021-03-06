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

<title></title>


<script type="text/javascript">
	function showWrite() {
		location.href = "${ pageContext.servletContext.contextPath }/nupdate.do";
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
<body id="ss">
<div id="se"> 
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<section class="page-section cta">
		<div class="container">
			<br> <br>
			<div
				style="background-color: white; border-radius: 1rem; border: 1px solid; padding: 5px; margin: 5px;"
				class="row">
				<form action="nupdate.do" method="post">
					<div class="col-xl-9 mx-auto">
						<br>
						<p style="font-size: 45px;" align="center">
							<b>공지사항 수정</b>
						</p>
						<br>
						<div class="cta-inner bg-faded text-center rounded">
							<!-- =============================================================================== -->
							<input type="hidden" name="notice_no"
								value="${notice.notice_no }">

							<table align="center" width="100%" cellspacing="0"
								cellpadding="10">
								<tr>
									<th>제 목</th>
									<td><input class="form-control" type="text"
										name="notice_title" value="${notice.notice_title }" required></td>
								</tr>
								<tr>
									<th>작 성 자</th>
									<td><input class="form-control" type="text"
										value="${notice.user_id}" readonly></td>
								</tr>
								<tr>
									<th>날 짜</th>
									<td><input class="form-control" type="text"
										value="${notice.notice_date}" readonly></td>
								</tr>
								<tr style="overflow: scroll; width: 500px; height: 150px;">
									<th>내 용</th>
									<td><textarea class="form-control" name="notice_content"
											rows="20" cols="50" required>${notice.notice_content }</textarea></td>
								</tr>
							</table>
							<!-- =============================================================================== -->
						</div>
						<div align="right">
							<button class="btn btn-outline-secondary"
									role="button" tabindex="0" type="submit">수정하기</button>
							&nbsp; <button class="btn btn-outline-secondary"
									role="button" tabindex="0" type="submit"
									onclick="javascript:history.go(-1);return false;">수정취소</button>
							&nbsp;
									<button class="btn btn-outline-secondary" 
									role="button" tabindex="0" type="submit"
								onclick="javascript:history.go(-1);return false;">이전페이지로 이동</button>
								<!-- return false로 이벤트 전달 막음 -->
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
</html>