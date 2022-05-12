<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8"> 

<style type="text/css">
  #menubtn{
 	 background-color: #f4f4fc;
 	 font-size: 25px;
 	 font-weight:600;
 	 text-align: center;
 	 height: 50px;
 	 border-radius: 10px;
  } 
  #menubtn:hover{
   
  	background-color: silver;
  	}
</style>
<title></title>
</head>

<br>
<div>
<a style="float: left; margin: -20px 0px -500px 30px;  font-weight:700; color:  #52575c; font-size: 70px; text-decoration:none;" href="main.do">FOOD BALANCE</a><br>
<c:import url="/WEB-INF/views/common/loginSession.jsp" />
</div>
<body>
<nav class="navbar navbar-expand-lg navbar" style="background-color: #8195f6; ">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor02" >
      <ul class="navbar-nav me-auto" style="margin: auto;">
 
          <button type="button" class="btn btn-outline-secondary" id="menubtn" onclick="javascript:location.href='main.do';">홈
            <span class="visually-hidden">(current)</span>
        
         </button>
      
      
            </button>
         &ensp;&ensp;&ensp;
          <button type="button" class="btn btn-outline-secondary" id="menubtn" onclick="javascript:location.href='nlist.do';">공지사항</button>
    &ensp;&ensp;&ensp;
       
          <button type="button" class="btn btn-outline-secondary" id="menubtn" onclick="javascript:location.href='blist.do';">게시판</button>
         &ensp;&ensp;&ensp;
    <button type="button" class="btn btn-outline-secondary" id="menubtn" onclick="javascript:location.href='tlist.do';">운동법</button>
        &ensp;&ensp;&ensp;
          <button type="button" class="btn btn-outline-secondary" id="menubtn" onclick="javascript:location.href='#';">음식이미지 ai분석</button>
    
     
      </ul>
 
    </div>
  </div>
</nav>
</body>
</html>

