<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
    border-right: 1px solid #444444;
    padding: 15px;
  }

</style>

<title></title>

</head>
<body>

	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<section class="page-section cta">
	    <div class="container">
	        <div style="  border-radius: 1rem; border: 1px solid; padding: 5px; margin: 5px;" class="row">
		        <form action="binsert.do" method="post" enctype="multipart/form-data">
		            <div class="col-xl-9 mx-auto">
		            <br>
		            
		            <p style="color: white; font-size: 35px;" align="center"><b>게시글 등록 페이지</b></p>
		                <div class="cta-inner bg-faded text-center rounded">
<!-- =============================================================================== -->
							<!-- form에서 입력된 값들과 첨부파일을 같이 전송하려면, 반드시 enctype 속성을 추가해야 함
						     enctype="multipart/form-data" 값을 지정해야함 -->
						
							<table style=" border-collapse: collapse; width: 100%;background: white; border-radius: 1rem; border: 1px solid; padding: 5px; margin: 5px;text-align: center;"align="center" cellspacing="0" cellpadding="15">
								<tr><th class="th">제     목</th><td class="td"><input class="form-control" id="disabledInput" type="text" name="board_title" required></td></tr>
								<tr><th class="th">작 성 자</th><td class="td"><input class="form-control" id="disabledInput" type="text" name="user_id" readonly value="${loginMember.user_id }" required></td></tr>
								<tr><th class="th">첨부파일</th><td class="td" align="left" ><input style="margin-bottom: 1%; " class="btn btn-outline-secondary" type="file" name="upfile"></td></tr>
								<tr><th class="th">내     용</th><td class="td"><textarea class="form-control" name="board_content" rows="5" cols="50" required></textarea></td></tr>
					
							</table>
<!-- =============================================================================== -->
						</div>
						<br>
						<div style=" padding: 5px; margin: 5px; margin-bottom: 3%" align="center">
							<input style="margin-bottom: 1%; " class="btn btn-outline-secondary" type="submit" value="등록하기"> &nbsp;
							<input style="margin-bottom: 1%; " class="btn btn-outline-secondary" type="reset" value="작성취소"> &nbsp;
							<button style="margin-bottom: 1%; " class="btn btn-outline-secondary" onclick="javascript:history.go(-1);return false;">목록</button>
							<!-- return false로 이벤트 전달 막음 -->
						</div>
					</div>
				</form>
			</div>			
		</div>
	</section>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
