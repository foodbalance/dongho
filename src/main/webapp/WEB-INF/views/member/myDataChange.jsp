<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style type="text/css">
		li{
		   list-style:none;
		   padding-left:0px;
		}
	    .wrap{
	    	width : 800px; 
			height : 570px;
			top : 20px;
			position:relative;
			border: 1px solid black;
			background-color:rgba(100, 130, 110, 0.2);
	    }
    	.myinfo{
    		width : 500px; 
			height : 550px;
			position: absolute;
			right : 0;
			border: 1px solid blue;
			margin : 10px;
			background-color:rgba(123, 19, 77, 0.1);
    	}
    	.list{
    		position: absolute;
    		width: 180px; 
			border: 1px solid blue;
			height : 150px;
			padding : 15px;
			margin : 10px;
    	}    	
		.a1{
			padding : 5px;
		}
		#address1, #address2{
			width: 280px;
		}
    </style>
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
			
			//회원탈퇴 버튼 클릭시 회원탈퇴 팝업창 생성
			function delPop(){
				window.open("deleteMember.do","delpop","width=450, height=580, top=150, left=200");
			}

			//전송(submit)버튼이 눌러졌을 때, 입력값들에 대한 유효성 검사함
			function validate(){
				
				//validation 체크 검사 코드 구현함
				//서버 컨트롤러로 전송할 값들이 유효한 값인지 검사하는 것
				//암호와 암호확인이 같은 값인지 확인
				var pwdValue = document.getElementById("user_pwd").value;
				var pwdValue2 = document.getElementById("user_pwd2").value;
				var message = "";
				
				if(pwdValue !== pwdValue2){
					message += '<h5 style="color:red;" id="result_check">비밀번호가 일치하지 않습니다.</h5>'
					document.getElementById("result_check").innerHTML = message;
					
					return false;  //전송 취소
				}else{
					return true;
				}
			}
		</script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
		function findAdd(){
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분
		            
		        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("postcode").value = data.zonecode;
	                document.getElementById("address1").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("address2").focus();
	            }
		        
		    }).open();
		}
		</script>
</head>
<body>
	<nav>
		<c:import url="/WEB-INF/views/common/menubar.jsp" />
	</nav>
	<center>
		<div class="wrap">
			<div class="list">
				<p>${ sessionScope.loginMember.user_name } 님</p>
				<a href="myData.do" class="a1">정보수정</a><br>
				<a>건강관리</a>
			</div>

			<div class="myinfo">
				<h2>내 정보 수정</h2>
		        <form action="mupdate.do" method="post" onsubmit="return validate();">
		        <!-- 기존 비번 -->
		        <input align="left" type="hidden" name="origin_userpwd" value="${ member.user_pwd }">
		            <ul>
			            <h5 align="left">아이디</h5>
			            <li>
							<div align="left">
						    	<input id="user_id" type="text" name="user_id" value="${ sessionScope.loginMember.user_id }" readonly>
							</div>   
			            </li>
			            <h5 align="left">비밀번호</h5>
			            <li>
			            	<div align="left">
			                	<input id="user_pwd" type="password" placeholder="변경할 비밀번호 입력" name="user_pwd">
			                </div>
			            </li>
			            <h5 align="left">비밀번호 확인</h5>
			            <li>
			            	<div align="left">
					        	<input id="user_pwd2" type="password" placeholder="변경할 비밀번호 확인" name="user_pwd2">
					        </div>
			            </li>
			            <h5 align="left">휴대폰 번호</h5>
			            <li>
			            	<div align="left">
					        	<input id="phone" placeholder="휴대폰 번호 입력(-제외한 숫자만 입력)" name="phone" value="${ sessionScope.loginMember.phone }">
					        </div>
			            </li>
			            <h5 align="left">이메일</h5>
			            <li>
			            	<div align="left">
					        	<input id="email" placeholder="이메일" name="email" value="${ sessionScope.loginMember.email }">
					        </div>
			            </li>
			            <h5 align="left">주소</h5>
			            <li>
			            	<div align="left">
					        	<input style="display:inline;" id="postcode" name="postcode" placeholder="우편번호" value="${ sessionScope.loginMember.postcode }">
					            <a class="btn btn-primary btn-block" onclick="findAdd();">주소찾기</a>
					        </div>
					        <div align="left">
					        	<input id="address1" placeholder="주소 입력" name="address1" value="${ sessionScope.loginMember.address1 }">
					        </div>
					        <div align="left">
					        	<input id="address2" placeholder="상세 주소 입력" name="address2" value="${ sessionScope.loginMember.address2 }">
					        </div>
			            </li>
			            <h5 id="result_check"></h5>
			            <div>
			            	<input type="submit" value="변경하기"> 
			                <input type="reset" value="작성취소"> 
			                <input type="button" onclick="delPop()" value="회원 탈퇴">
					    </div>
					</ul>
				</form>
			</div><!-- myinfo -->
		</div><!-- wrap -->
	</center>


	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>