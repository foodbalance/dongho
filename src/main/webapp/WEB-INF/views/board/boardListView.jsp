<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
 


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
	function showWrite(){
	   location.href = "${ pageContext.servletContext.contextPath }/bwform.do";
	}
</script>   

<!-- 게시판 -->
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
<body id="ss">
<div id="se"> 
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
 	<section class="page-section cta">
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
					  <li class="nav-item">
					    <a style="color: #52575c;" class="nav-link" data-bs-toggle="tab" href="#writerDiv">작성자 검색</a>
					  </li>
					 <button type="button" class="btn btn-outline-secondary" style="margin-left: 53%;"
                         onclick="javascript:location.href='blist.do';">처음으로</button>
					  
					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade" id="titleDiv">
						    <form action="bsearchTitle.do" method="post">
								<label>검색할 제목을 입력하세요 : <input type="search" name="keyword"></label>
								<input style="margin-bottom: 0.7%;" class="btn btn-outline-secondary" type="submit" value="검색">
							</form>
						  </div>
						  <div class="tab-pane fade" id="writerDiv">
						    <form action="bsearchWriter.do" method="post">
								<label>검색할 작성자를 입력하세요 : <input type="search" name="keyword"></label>
								<input style="margin-bottom: 0.7%;" class="btn btn-outline-secondary" type="submit" value="검색">
							</form>
						  </div>
						  <div class="tab-pane fade" id="dateDiv">
						    <form action="bsearchDate.do" method="post">
								<label>검색할 날짜를 입력하세요 : <input type="date" name="begin"> ~ <input type="date" name="end"></label>
								<input style="margin-bottom: 0.7%;" class="btn btn-outline-secondary" type="submit" value="검색">
							</form>
						</div>
					</div>
			        <br>
		            <div class="cta-inner bg-faded text-center rounded">
<!-- =============================================================================== -->
						<% int num = 1; %>
						<table style="width: 98%; ">
							<tr><th class="th">번호</th><th class="th">제목</th><th class="th">작성자</th><th class="th">날짜</th><th class="th">조회수</th><th class="th">첨부파일</th></tr>
							<c:forEach items="${ requestScope.list }" var="b">
							   <tr>
							      <td class="td"><%= num++%></td>
							      <td class="td">
								      <c:url var="bdt" value="bdetail.do">
								         <c:param name="board_no" value="${ b.board_no }"/>
								         <c:param name="page" value="${ currentPage }"/>
								         <c:param name="search" value="${ search }" />
										 <c:param name="search_writer" value="${ search_writer }" />
								      </c:url>
								      <a style="color: #52575c; text-decoration: none;" href="${ bdt }">${ b.board_title }</a>
							      </td>
							      <td class="td">${ b.user_id }</td>
							      <td class="td"><fmt:formatDate value="${ b.board_date }" type="date" pattern="yyyy-MM-dd"/></td>
							      <td class="td">${ b.board_count }</td>
							      <td class="td">
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
						<!-- 게시글 쓰기(등록)은 로그인한 회원만 가능함 paging.jsp 로 기능 옮김 -->
					<c:if test="${ !empty sessionScope.loginMember }">
					   	<div class="parent">
						   	<div class="div1">
						      <button style="align-items: "class="btn btn-outline-secondary" onclick="showWrite();">글쓰기</button>
						   	</div>
					</c:if>
<!-- =============================================================================== -->
					</div>
					<br>
					

				
<!-- =============================================================================== -->
	
				</div>
				
			</div>
			<c:import url="/WEB-INF/views/common/footer.jsp" />
		</div>
	</section>
	<br>
	<br>
	

</div>
</body>
</html>
