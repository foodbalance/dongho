<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="listCount" value="${ requestScope.listCount }"/>
<c:set var="startPage" value="${ requestScope.startPage }"/>
<c:set var="endPage" value="${ requestScope.endPage }"/>
<c:set var="maxPage" value="${ requestScope.maxPage }"/>
<c:set var="currentPage" value="${ requestScope.currentPage }"/>
<c:set var="menu" value="${ requestScope.menu }"/>    <!-- 게시판,공지구분   -->
<c:set var="atcion" value="${ requestScope.atcion }"/> <!-- 키워드 -->
<c:set var="begin" value="${ requestScope.begin }"/>
<c:set var="end" value="${ requestScope.end }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.parent {
   display: grid;
   grid-template-columns: repeat(5, 1fr);
   grid-template-rows: 40px;
   grid-column-gap: 0px;
   grid-row-gap: 0px;
}
.page-link {
    color: #52575c;
 }
.div1 { grid-area: 1 / 3 / 2 / 4; }
.div2 { grid-area: 1 / 4 / 2 / 5; }
</style>
<title></title>
</head>
<body>
	   <div class="parent">
      <div class="div1"> 
         <ul class="pagination">
   <!-- =================================게시판 페이징 ========================================= -->   
            <c:if test="${ menu eq 'board' }">
               <!-- 1페이지로 이동 처리 -->
                  <c:if test="${ currentPage == 1 }">
                  <li class="page-item disabled">
                     <a class="page-link" href="#">&laquo;&laquo;</a>
                  </li>           
                  </c:if>
                  <c:if test="${ currentPage > 1 }">
                        <c:url var="blf" value="/blist.do">
                           <c:param name="page" value="1"/>
                        </c:url>
                        <c:url var="btitle" value="/bsearchTitle.do">
                           <c:param name="page" value="1"/>
                           <c:param name="keyword" value="${keyword}"/>
                        </c:url>
                        <c:url var="bwrite" value="/bsearchWriter.do">
                           <c:param name="page" value="1"/>
                           <c:param name="keyword" value="${keyword}"/>
                        </c:url>
                        <c:url var="bdate" value="/bsearchDate.do">
                           <c:param name="page" value="1"/>
                           <c:param name="begin" value="${begin}" />
                           <c:param name="end" value="${end}" />
                        </c:url>
                        <c:if test="${ action eq 'bsearchTitle' }">
                        <li class="page-item">
                           <a class="page-link" href="${ btitle }">&laquo;&laquo;</a>
                        </li>
                        </c:if>
                        <c:if test="${ action eq 'bsearchWriter' }">
                        <li class="page-item">
                           <a class="page-link" href="${ bwrite }">&laquo;&laquo;</a>
                        </li>
                        </c:if>
                        <c:if test="${ action eq 'bsearchDate' }">
                        <li class="page-item">
                           <a class="page-link" href="${ bdate }">&laquo;&laquo;</a>
                        </li>
                        </c:if>
                              
                        <!-- 검색 없을 때 -->
                        <c:if test="${ empty action }">
                        <li class="page-item">
                           <a class="page-link" href="${ blf }">&laquo;&laquo;</a>
                        </li>
                        </c:if>
                     
                  </c:if>
                <!-- 이전 페이지 그룹으로 이동 처리 -->
                  <c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
                     <c:url var="blf2" value="/blist.do">
                           <c:param name="page" value="${ startPage - 10 }"/>
                        </c:url>
                        <c:url var="btitle" value="/bsearchTitle.do">
                           <c:param name="page" value="${ startPage - 10 }"/>
                           <c:param name="keyword" value="${ keyword }"/>
                        </c:url>
                        <c:url var="bwrite" value="/bsearchWriter.do">
                           <c:param name="page" value="${ startPage - 10 }"/>
                           <c:param name="keyword" value="${ keyword }"/>
                        </c:url>
                       <c:url var="bdate" value="/bsearchDate.do">
                           <c:param name="page" value="${ startPage - 10 }"/>
                           <c:param name="begin" value="${begin }" />
                           <c:param name="end" value="${end }" />
                        </c:url>
                     <c:if test="${ action eq 'bsearchTitle' }">
                        <li class="page-item">
                           <a class="page-link" href="${ blf2 }">&laquo;</a>
                        </li>
                     </c:if>
                     <c:if test="${ action eq 'bsearchWriter' }">
                        <li class="page-item">
                           <a class="page-link" href="${ blf2 }">&laquo;</a>
                        </li>
                     </c:if>
                     <c:if test="${ action eq 'bsearchDate' }">
                        <li class="page-item">
                           <a class="page-link" href="${ blf2 }">&laquo;</a>
                        </li>
                     </c:if>
                              
                     <!-- 검색 없을 때 -->
                     <c:if test="${ empty action }">
                        <li class="page-item">
                           <a class="page-link" href="${ blf2 }">&laquo;</a>
                        </li>
                     </c:if>
                     
                     
                  </c:if>
                  <c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
                     <li class="page-item">
                        <a class="page-link" href="#">&laquo;</a>
                     </li>
                  </c:if>
               <!-- 이전 페이지 그룹으로 이동 처리 end-->
               <!-- 현재 페이지가 속한 페이지 그룹 출력 -->
                  <c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
                     <c:if test="${ p eq currentPage }">
                     <li class="page-item">
                        <a class="page-link"><b>${ p }</b></a>
                     </li>
                     </c:if>
                     <c:if test="${ p ne currentPage }">
                        <c:url var="blf5" value="/blist.do">
                              <c:param name="page" value="${ p }"/>
                           </c:url>
                           <c:url var="btitle" value="/bsearchTitle.do">
                              <c:param name="page" value="${ p }"/>
                              <c:param name="keyword" value="${keyword }"/>
                           </c:url>
                           <c:url var="bwrite" value="/bsearchWriter.do">
                              <c:param name="page" value="${ p }"/>
                              <c:param name="keyword" value="${keyword }"/>
                           </c:url>
                           <c:url var="bdate" value="/bsearchDate.do">
                              <c:param name="page" value="${ p }"/>
                              <c:param name="begin" value="${begin }" />
                              <c:param name="end" value="${end }" />
                           </c:url>
                           
                           <c:if test="${ action eq 'bsearchTitle' }">
                              <li class="page-item">
                                 <a class="page-link" href="${ btitle }">${ p }</a>
                              </li>
                           </c:if>
                           <c:if test="${ action eq 'bsearchWriter' }">
                              <li class="page-item">
                                 <a class="page-link" href="${ bwrite }">${ p }</a>
                              </li>
                           </c:if>
                           <c:if test="${ action eq 'bsearchDate' }">
                              <li class="page-item">
                                 <a class="page-link" href="${ bdate }">${ p }</a>
                              </li>
                           </c:if>
                           <!-- 검색 없을 때 -->
                           <c:if test="${ empty action }">
                              <li class="page-item">
                                 <a class="page-link" href="${ blf5 }">${ p }</a>
                              </li>
                           </c:if>
                     </c:if>      
                  </c:forEach>
               <!-- 현재 페이지가 속한 페이지 그룹 출력 end-->
                <!-- 다음 페이지 그룹으로 이동 처리 -->
                  <c:if test="${ (currentPage + 10) > endPage and (currentPage + 10) < maxPage }">
                     <c:url var="blf3" value="/blist.do">
                           <c:param name="page" value="${ endPage + 10 }"/>
                        </c:url>
                        <c:url var="btitle" value="/bsearchTitle.do">
                           <c:param name="page" value="${ endPage + 10 }"/>
                           <c:param name="keyword" value="${keyword }"/>
                        </c:url>
                        <c:url var="bwrite" value="/bsearchWriter.do">
                           <c:param name="page" value="${ endPage + 10 }"/>
                           <c:param name="keyword" value="${keyword }"/>
                        </c:url>
                        <c:url var="bdate" value="/bsearchDate.do">
                           <c:param name="page" value="${ endPage + 10 }"/>
                           <c:param name="begin" value="${begin }" />
                           <c:param name="end" value="${end }" />
                        </c:url>
                           
                        <c:if test="${ action eq 'bsearchTitle' }">
                        <li class="page-item">
                           <a class="page-link" href="${ blf3 }">&raquo;</a>
                        </li>
                        </c:if>
                        <c:if test="${ action eq 'bsearchWriter' }">
                        <li class="page-item">
                           <a class="page-link" href="${ blf3 }">&raquo;</a>
                        </li>
                        </c:if>
                        <c:if test="${ action eq 'bsearchDate' }">
                        <li class="page-item">
                           <a class="page-link" href="${ blf3 }">&raquo;</a>
                        </li>
                        </c:if>
            
                        <!-- 검색 없을 때 -->
                        <c:if test="${ empty action }">
                        <li class="page-item">
                           <a class="page-link" href="${ blf3 }">&raquo;</a>
                        </li>
                        </c:if>
                        
                  </c:if>
                  <c:if test="${ !((currentPage + 10) > endPage and (currentPage + 10) < maxPage) }">
                  <li class="page-item">
                     <a class="page-link" href="#">&raquo;</a>
                  </li>
                  </c:if>
               <!-- 다음 페이지 그룹으로 이동 처리end -->
               
               <!-- 끝페이지로 이동 처리 -->
                  <c:if test="${ currentPage == maxPage }">
                  <li class="page-item disabled">
                        <a class="page-link" href="#">&raquo;&raquo;</a>
                  </li>
                  </c:if>
                  <c:if test="${ currentPage < maxPage }">
                        <c:url var="blf4" value="/blist.do">
                           <c:param name="page" value="${ maxPage }"/>
                        </c:url>
                        <c:url var="btitle" value="/bsearchTitle.do">
                              <c:param name="page" value="${ maxPage }"/>
                              <c:param name="keyword" value="${keyword }"/>
                        </c:url>
                        <c:url var="bwrite" value="/bsearchWriter.do">
                           <c:param name="page" value="${ maxPage }"/>
                           <c:param name="keyword" value="${keyword }"/>
                        </c:url>
                      <c:url var="bdate" value="/bsearchDate.do">
                           <c:param name="page" value="${ maxPage }"/>
                           <c:param name="begin" value="${begin }" />
                           <c:param name="end" value="${end }" />
                        </c:url>
                        <c:if test="${ action eq 'bsearchTitle' }">
                        <li class="page-item">
                           <a class="page-link" href="${ btitle }">&raquo;&raquo;</a>
                        </li>
                        </c:if>
                        <c:if test="${ action eq 'bsearchWriter' }">
                        <li class="page-item">
                           <a class="page-link" href="${ bwrite }">&raquo;&raquo;</a>
                        </li>
                        </c:if>
                      <c:if test="${ action eq 'bsearchDate' }">
                      <li class="page-item">
                           <a class="page-link" href="${ bdate }">&raquo;&raquo;</a>
                        </li>
                        </c:if>
                              
                        <!-- 검색 없을 때 -->
                        <c:if test="${ empty action }">
                        <li class="page-item">
                           <a class="page-link" href="${ blf4 }">&raquo;&raquo;</a>
                        </li>
                        </c:if>
                        
                  </c:if>
               <!-- 끝페이지로 이동 처리 end-->
            </c:if>
         </ul>
      </div>
      <c:if test="${ !empty sessionScope.loginMember }">
         <div class="div2">
            <button class="btn btn-outline-secondary" onclick="showWrite();">글쓰기</button>
         </div>
      </c:if>
   </div>
<!-- =================================게시판 페이징끝 ========================================= -->   
	</div>
</body>
</html>