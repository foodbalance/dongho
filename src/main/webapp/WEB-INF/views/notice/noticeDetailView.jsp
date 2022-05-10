<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<c:set var="currentPage" value="${ requestScope.currentPage }"/>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href="../../resources/font.css" rel="stylesheet" type="text/css" />
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
.form{
	margin: 30px;
	text-align: center;
	font-family: "나눔스퀘어라운드R";
		}
h1{
	font-family: "나눔바른고딕";
	font-size: 40px;
}
th{	
	height: 29px;
	border-top: 0px;
	background-color: #424343;
	color: white;
	font-weight: normal;
}
td{
	border-top: 0px;
	border-bottom: 1px solid #424343;
	background-color: #FCFCFC;
}
#logoutBtn{
	font-family: "나눔스퀘어라운드B";
	font-size: 13px;
	padding: 5px 5px;
	color: white;
	background-color: 424343;
	border: none;
	margin: 5px 8px;
	border-radius: 5px;
	cursor: pointer;
	width: 65px;
	height: 30px;
}
#writeBtn{
	font-family: "나눔스퀘어라운드B";
	font-size: 15px;
	padding: 3px 3px;
	color: white;
	background-color: 4795DA;
	border: none;
	margin: 0px 5px;
	border-radius: 5px;
	cursor: pointer;
	width: 90px;
	height: 40px;
}
#writeBtn:hover{
	color: white;
	background-color: 549FE1;
}
#btn{
	font-family: "나눔스퀘어라운드B";
	font-size: 13px;
	padding: 5px 5px;
	color: white;
	border: none;
	margin: 5px 8px;
	border-radius: 5px;
	cursor: pointer;
	width: 65px;
	height: 30px;
	background-color: 3D7DB5;
}
.note-frame card{
	postion:realtive;
	margin:0 auto;
}
.note-editor{
	postion:realtive;
	margin:0 auto;
}
#commentBox{
	width: 850px;
	border: 3px solid #F8F8F8;
	text-align: left;
	position: relative;
	margin: 0 auto;
}
#replyList{
	height: auto;
	width: auto;
	text-align: left;
	position: relative;
	margin: 5px;
	padding: 15px 25px 15px 25px;
	background-color: #F8F8F8;
}
#replyBox{
	height: 140px;
	width: 840px;
	border: 3px solid #F8F8F8;
	position: relative;
	margin: 0 auto;
	background-color: #F8F8F8;
}
#replyWrite{
	height: 100px;
	width: 600px;
	text-align: left;
	position: relative;
	margin: 0 auto;
	padding: 10px 0px;
}
#replyBtn{
	font-family: "나눔스퀘어라운드R";
	font-size: 12px;
	padding: 2px 3px;
	color: white;
	border: none;
	margin: 1px 3px;
	border-radius: 5px;
	cursor: pointer;
	width: 50px;
	height: 25px;
	background-color: C3A50E;
}
		
</style>

<title></title>


<!-- Core theme JS-->
<script type="text/javascript">
	function showWrite(){
	   location.href = "${ pageContext.servletContext.contextPath }/noticeWrite.do";
	}
</script>   

<!-- 게시글 상세 -->
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
		    <div  class="row">
		        <div class="col-xl-9 mx-auto">
		       
			        <p style="color: #52575c; font-size: 35px; margin-top: 5%;" align="center"><b>공지사항 상세</b></p>
					<br>
		            <div class="cta-inner bg-faded text-center rounded">
						<!-- =============================================================================== -->
						<table>
							<tr>
								<th class="th" style="border-bottom: 1px solid #fff;">제 목</th>
								<td class="td" style="margin-top: 6%;" readonly>${notice.notice_title }</td>
								<th class="th">작 성 자</th>
								<td class="td" readonly>${notice.user_id }</td>
								<th class="th">날 짜</th>
								<td class="td" readonly><fmt:formatDate
										value="${notice.notice_date }" type="date" pattern="yyyy-MM-dd" /></td>
							</tr>
								&nbsp;
							<tr>
								<tr><th class="th">내     용</th>
									<td class="td" style="margin-left: 10%;" 
									colspan="5"><textarea class="form-control" name="notice_content" 
									rows="20" cols="50" readonly>${notice.notice_content }</textarea></td></tr>
							</tr>
						</table>
						<!-- =============================================================================== -->
					</div>
					<br>
					<div style="padding: 5px; margin: 5px; margin-bottom: 5%" align="center">
						<a type="button" class="btn btn-outline-secondary" 
						onclick="location.href=document.referrer;">목록
						</a>

					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
