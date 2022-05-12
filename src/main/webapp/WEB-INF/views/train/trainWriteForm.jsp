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
    border-top: 1px solid #52575c;
    border-collapse: collapse;
  }
 .th {
    border-right: 1px solid #52575c;
    padding: 15px;
  }
 .th {
    border-right: 1px solid #52575c;
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

</head>
<body id="ss">
<div id="se">
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<section class="page-section cta">
	    <div class="container">
	    <br>
	        <div style="  border-radius: 1rem; border: 1px solid #52575c; padding: 5px; margin: 5px;" class="row">
		        <form action="tinsert.do" method="post" enctype="multipart/form-data">
		            <div class="col-xl-9 mx-auto">
		            <br><br>
		            
		            <p style="color: #52575c; font-size: 35px;" align="center"><b>운동법 등록 페이지</b></p>
		                <div class="cta-inner bg-faded text-center rounded">
<!-- =============================================================================== -->				
							<table style=" border-collapse: collapse; width: 100%;background: white; border-radius: 1rem; border: 1px solid; padding: 5px; margin: 5px;text-align: center;"align="center" cellspacing="0" cellpadding="15">
								<tr><th class="th">제     목</th><td class="td"><input class="form-control" id="disabledInput" type="text" name="train_title" required></td></tr>
								<tr><th class="th">작 성 자</th><td class="td"><input class="form-control" id="disabledInput" type="text" name="user_id" readonly value="${loginMember.user_id }" required></td></tr>
								<tr><th class="th">URL</th><td class="td" align="left" ><input class="form-control" id="disabledInput" type="text" name="train_url" required></td></tr>
								<tr><th class="th">운동법 소개</th><td class="td"><textarea class="form-control" name="train_content" rows="5" cols="50" required></textarea></td></tr>
					
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
</div>
</body>
</html>
