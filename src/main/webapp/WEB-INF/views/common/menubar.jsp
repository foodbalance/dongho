<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
.featured {
  position: relative;
  z-index: 2;
}
.featured .icon-box {
  padding: 40px 30px;
  box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.15);
  border-radius: 10px;
  background: black;
  transition: all ease-in-out 0.3s;
  height: 100%;
}
.featured .icon-box i {
  color: #e96b56;
  font-size: 42px;
  margin-bottom: 15px;
  display: block;
  line-height: 0;
}
.featured .icon-box h3 {
  font-weight: 700;
  margin-bottom: 15px;
  font-size: 20px;
}
.featured .icon-box h3 a {
  color: #545454;
  transition: 0.3s;
}
.featured .icon-box p {
  color: #545454;
  line-height: 24px;
  font-size: 14px;
  margin-bottom: 0;
}
.featured .icon-box:hover {
  background: #e96b56;
}
.featured .icon-box:hover i, .featured .icon-box:hover h3 a, .featured .icon-box:hover p {
  color: #fff;
}

</style>
<!-- CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title></title>
</head>
<br>
<h1>FOOD BALANCE</h1>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarColor02">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="#">홈</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">음식이미지ai분석</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">공지사항</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">게시판</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">다이어트 추천</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">내 주변 다이어트 스팟</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">다이어트 추천</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="#">메뉴추천</a>
            <a class="dropdown-item" href="#">운동법</a>

          </div>
        </li>
      </ul>
    </div>
  </div>
</nav>
</body>
</html>

