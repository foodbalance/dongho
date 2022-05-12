<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<c:set var="currentPage" value="${ currentPage }"/>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

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


<!-- Core theme JS-->
<script src="${ pageContext.servletContext.contextPath }/resources/js/scripts.js"></script>

<!-- 게시글 상세 -->
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

</head>
<body id="ss" >
	<div id="se"> 
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<section class="page-section cta">
		<div class="container">
		    <div  class="row">
		        <div class="col-xl-9 mx-auto">
		       
			        <p style="color: #52575c; font-size: 35px; margin-top: 5%;" align="center"><b>게시글 상세보기</b></p>
					<br>
		            <div class="cta-inner bg-faded text-center rounded">
<!-- =============================================================================== -->
						<table>
							<tr>
							<th class="th">제     목</th><td class="td" style="margin-top: 6%;"  readonly>${ train.train_title }</td>
							<th class="th">날     짜</th>
							<td class="td" readonly><fmt:formatDate value="${ train.train_date }" type="date" pattern="yyyy-MM-dd"/></td>
							</tr>
							<tr>
								<th class="th">영 상</th>
								<td class="td" colspan="5">
									<iframe width="560" height="315" src="${ train.train_url }" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</td>
							</tr>
							<tr><th class="th">내     용</th><td class="td" style="margin-left: 10%;" colspan="5"><textarea class="form-control" name="board_content" rows="5" cols="50" readonly>${train.train_content }</textarea></td></tr>
						</table>
<!-- =============================================================================== -->
					</div>
					<br>
					<div style="padding: 5px; margin: 5px; margin-bottom: 5%" align="center" >
						<button class="btn btn-outline-secondary" onclick="javascript:history.go(-1);">목록</button>
						
						<%-- <!-- 글 작성자가 아닌 회원의 경우 댓글달기 기능 제공 -->
				      	<c:if test="${ requestScope.train.user_id ne sessionScope.loginMember.user_id }">
				         	<c:url var="brf" value="/breplyform.do">
				            	<c:param name="board_no" value="${ board.board_no }"/>
				            	<c:param name="page" value="${ currentPage }"/>
				         	</c:url>
				         	<a href="${ brf }">[댓글달기]</a> &nbsp;
				      	</c:if>   --%> 
						
						<!-- 본인이 등록한 글일때 수정 삭제 -->
						<c:if test="${train.user_id eq sessionScope.loginMember.user_id}">
							<c:url var="tup" value="/tupview.do">
								<c:param name="train_no" value="${ train.train_no }" />
								<c:param name="page" value="${ currentPage }" />
							</c:url>
							<a class="btn btn-outline-secondary" href="${ tup }">수정</a>
							<c:url var="tdt" value="/tdel.do">
								<c:param name="train_no" value="${ train.train_no }" />
							</c:url>
							<a class="btn btn-outline-secondary" href="${ tdt }">삭제</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
	<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>
	</body>
</html>
	

