<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="currentPage" value="${ requestScope.currentPage }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h2 align="center">${ board_no }번글 댓글 등록 페이지</h2>
<br>

<form action="breply.do" method="post">
	<input type="text" name="board_ref" value="${ board_no }">
	<input type="text" name="page" value="${ currentPage }">
<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
	<tr><th>제 목</th><td><input type="text" name="board_title"></td></tr>
	<tr><th>작성자</th><td><input type="text" name="user_id" readonly value="${ loginMember.user_id }"></td></tr>
	<tr><th>내 용</th><td><textarea name="board_content" rows="5" cols="50"></textarea></td></tr>
	<tr><td colspan="2">
	<input type="submit" value="등록하기"> &nbsp;
	<input type="reset" value="작성취소"> &nbsp;
	<c:url var="bls" value="/blist.do">
		<c:param name="page" value="${ currentPage }" />
	</c:url>
	<button onclick="javascript:location.href='${ bls }'; return false;">목록</button></td></tr>
	
</table>
</form>
<br>

<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>