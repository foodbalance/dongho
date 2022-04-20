<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<<<<<<< HEAD
<head>
<style>
#th{
 	text-align: center;
 	height: 50px;
 }
 
 #td{
 	text-align: center;
 	height: 50px;
 }
 #t1{
	float: left;	
		width: 300px;
 	height: 50px;
}
 #t2{
	float: left;	
		width: 300px;
 	height: 50px;
}
body {
  background-color:white;
}
#myDIV {
  height:300px;
  display: grid;
  grid-template-columns: auto auto auto;
  gap: 50px;
  
  padding: 10px;
  grid-template-rows: 100px 100px;
}
#myDIV table {
  background-color: black;
  text-align: center;
  padding: 20px 0;
  font-size: 30px;
}
</style>
=======
<head>
<meta charset="UTF-8">
<title></title>
>>>>>>> refs/remotes/origin/master
</head>
<body>
<nav>
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
</nav>
<<<<<<< HEAD
<br>
<br>


<div id="myDIV">
  <table class="item1">
  <tbody>
   <tr class="table-dark" id="th">
      <th colspan="3" scope="row" _msthash="2664948" _msttexthash="9407996" >공지사항</th>
    </tr>
    <tr class="table-light" id="th">
      <th scope="row" _msthash="2596295" _msttexthash="4031755" ><strong>No.</strong></th>
      <td _msthash="2596009" _msttexthash="15266329"><strong>Name</strong></td>
      <td _msthash="2596139" _msttexthash="15266329"><strong>Value</strong></td>
    </tr>
    <tr class="table-dark" id="td">
      <th scope="row" _msthash="2664948" _msttexthash="9407996"></th>
      <td _msthash="2664662" _msttexthash="15266329"></td>
      <td _msthash="2664792" _msttexthash="15266329"></td>
    </tr>
    <tr class="table-dark" id="td">
      <th scope="row" _msthash="2664948" _msttexthash="9407996"></th>
      <td _msthash="2664662" _msttexthash="15266329"> </td>
      <td _msthash="2664792" _msttexthash="15266329"> </td>
    </tr>
    <tr class="table-dark" id="td">
      <th scope="row" _msthash="2664948" _msttexthash="9407996"></th>
      <td _msthash="2664662" _msttexthash="15266329"></td>
      <td _msthash="2664792" _msttexthash="15266329"></td>
    </tr>
  </tbody>
  </table>
  <table class="item2"><tbody>
   <tr class="table-dark" id="th">
      <th colspan="3" scope="row" _msthash="2664948" _msttexthash="9407996" >게시판</th>
    </tr>
    <tr class="table-light" id="th">
      <th scope="row" _msthash="2596295" _msttexthash="4031755" ><strong>No.</strong></th>
      <td _msthash="2596009" _msttexthash="15266329"><strong>Name</strong></td>
      <td _msthash="2596139" _msttexthash="15266329"><strong>Value</strong></td>
    </tr>
    <tr class="table-dark" id="td">
      <th scope="row" _msthash="2664948" _msttexthash="9407996"></th>
      <td _msthash="2664662" _msttexthash="15266329"></td>
      <td _msthash="2664792" _msttexthash="15266329"></td>
    </tr>
    <tr class="table-dark" id="td">
      <th scope="row" _msthash="2664948" _msttexthash="9407996"></th>
      <td _msthash="2664662" _msttexthash="15266329"> </td>
      <td _msthash="2664792" _msttexthash="15266329"> </td>
    </tr>
    <tr class="table-dark" id="td">
      <th scope="row" _msthash="2664948" _msttexthash="9407996"></th>
      <td _msthash="2664662" _msttexthash="15266329"></td>
      <td _msthash="2664792" _msttexthash="15266329"></td>
    </tr>
  </tbody></table>
  <table class="item3"><tbody>
   <tr class="table-dark" id="th">
      <th colspan="3" scope="row" _msthash="2664948" _msttexthash="9407996" >로그인</th>
    </tr>
    <tr class="table-light" id="th">
      <th scope="row" _msthash="2596295" _msttexthash="4031755" ><strong>No.</strong></th>
      <td _msthash="2596009" _msttexthash="15266329"><strong>Name</strong></td>
      <td _msthash="2596139" _msttexthash="15266329"><strong>Value</strong></td>
    </tr>
    <tr class="table-dark" id="td">
      <th scope="row" _msthash="2664948" _msttexthash="9407996"></th>
      <td _msthash="2664662" _msttexthash="15266329"></td>
      <td _msthash="2664792" _msttexthash="15266329"></td>
    </tr>
    <tr class="table-dark" id="td">
      <th scope="row" _msthash="2664948" _msttexthash="9407996"></th>
      <td _msthash="2664662" _msttexthash="15266329"> </td>
      <td _msthash="2664792" _msttexthash="15266329"> </td>
    </tr>
    <tr class="table-dark" id="td">
      <th scope="row" _msthash="2664948" _msttexthash="9407996"></th>
      <td _msthash="2664662" _msttexthash="15266329"></td>
      <td _msthash="2664792" _msttexthash="15266329"></td>
    </tr>
  </tbody></table>
  <table class="item4"><tbody>
   <tr class="table-dark" id="th">
      <th colspan="3" scope="row" _msthash="2664948" _msttexthash="9407996" >추천메뉴</th>
    </tr>
    <tr class="table-light" id="th">
      <th scope="row" _msthash="2596295" _msttexthash="4031755" ><strong>No.</strong></th>
      <td _msthash="2596009" _msttexthash="15266329"><strong>Name</strong></td>
      <td _msthash="2596139" _msttexthash="15266329"><strong>Value</strong></td>
    </tr>
    <tr class="table-dark" id="td">
      <th scope="row" _msthash="2664948" _msttexthash="9407996"></th>
      <td _msthash="2664662" _msttexthash="15266329"></td>
      <td _msthash="2664792" _msttexthash="15266329"></td>
    </tr>
    <tr class="table-dark" id="td">
      <th scope="row" _msthash="2664948" _msttexthash="9407996"></th>
      <td _msthash="2664662" _msttexthash="15266329"> </td>
      <td _msthash="2664792" _msttexthash="15266329"> </td>
    </tr>
    <tr class="table-dark" id="td">
      <th scope="row" _msthash="2664948" _msttexthash="9407996"></th>
      <td _msthash="2664662" _msttexthash="15266329"></td>
      <td _msthash="2664792" _msttexthash="15266329"></td>
    </tr>
  </tbody></table>
  <table class="item5"><tbody>
   <tr class="table-dark" id="th">
      <th colspan="3" scope="row" _msthash="2664948" _msttexthash="9407996" >운동법</th>
    </tr>
    <tr class="table-light" id="th">
      <th scope="row" _msthash="2596295" _msttexthash="4031755" ><strong>No.</strong></th>
      <td _msthash="2596009" _msttexthash="15266329"><strong>Name</strong></td>
      <td _msthash="2596139" _msttexthash="15266329"><strong>Value</strong></td>
    </tr>
    <tr class="table-dark" id="td">
      <th scope="row" _msthash="2664948" _msttexthash="9407996"></th>
      <td _msthash="2664662" _msttexthash="15266329"></td>
      <td _msthash="2664792" _msttexthash="15266329"></td>
    </tr>
    <tr class="table-dark" id="td">
      <th scope="row" _msthash="2664948" _msttexthash="9407996"></th>
      <td _msthash="2664662" _msttexthash="15266329"> </td>
      <td _msthash="2664792" _msttexthash="15266329"> </td>
    </tr>
    <tr class="table-dark" id="td">
      <th scope="row" _msthash="2664948" _msttexthash="9407996"></th>
      <td _msthash="2664662" _msttexthash="15266329"></td>
      <td _msthash="2664792" _msttexthash="15266329"></td>
    </tr>
  </tbody></table>
  <table class="item6"><tbody>
   <tr class="table-dark" id="th">
      <th colspan="3" scope="row" _msthash="2664948" _msttexthash="9407996" >스팟</th>
    </tr>
    <tr class="table-light" id="th">
      <th scope="row" _msthash="2596295" _msttexthash="4031755" ><strong>No.</strong></th>
      <td _msthash="2596009" _msttexthash="15266329"><strong>Name</strong></td>
      <td _msthash="2596139" _msttexthash="15266329"><strong>Value</strong></td>
    </tr>
    <tr class="table-dark" id="td">
      <th scope="row" _msthash="2664948" _msttexthash="9407996"></th>
      <td _msthash="2664662" _msttexthash="15266329"></td>
      <td _msthash="2664792" _msttexthash="15266329"></td>
    </tr>
    <tr class="table-dark" id="td">
      <th scope="row" _msthash="2664948" _msttexthash="9407996"></th>
      <td _msthash="2664662" _msttexthash="15266329"> </td>
      <td _msthash="2664792" _msttexthash="15266329"> </td>
    </tr>
    <tr class="table-dark" id="td">
      <th scope="row" _msthash="2664948" _msttexthash="9407996"></th>
      <td _msthash="2664662" _msttexthash="15266329"></td>
      <td _msthash="2664792" _msttexthash="15266329"></td>
    </tr>
  </tbody>
  </table>
</div>
=======
<section>
<form>
</form>

</section>




<c:import url="/WEB-INF/views/common/footer.jsp" />

>>>>>>> refs/remotes/origin/master

</body>
</html>
