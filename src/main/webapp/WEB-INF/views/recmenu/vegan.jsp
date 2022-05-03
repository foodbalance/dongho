<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.graph_wrap {max-width: 800px;margin: 0 auto;padding:20px;}
.graph_wrap .tit {font-size: 16px;font-weight: 500;color: #333333;}
.graph {position: relative;height: 185px;margin-top: 15px;}
.graph .y-axis {position: absolute;width: 100%;height: 100%;z-index: 1;}
.graph .y-axis > li {position: relative;width:calc(100% - 20px);height: calc(100% / 8);margin-left: 20px;border-top: 1px solid #8c8c8c;text-align: left;}
.graph .y-axis > li span {position: absolute;top: -7px;left: -20px;font-size: 12px;line-height: 1;}
.graph .x-axis {position: absolute;display: flex;bottom: -8px;left: 20px;width: calc(100% - 20px);justify-content: space-around;text-align: center;z-index: 2;}
.graph .x-axis > li {font-size: 12px;}
.graph .bar {display: flex;position: absolute;left: 20px;bottom: 16px;width: calc(100% - 20px);height: calc(100% - 16px);justify-content: space-around;align-items: flex-end;text-align: center;z-index: 3;}
.graph .bar > li {width: 100%;margin: 0 10px;}
.graph .bar > li span {display: inline-block;max-width: 80px;width: 100%;height: 100%;background: #f1cb7e;}
.graph .bar:before {content:'';position: absolute;top: -2px;left: 3px;height: calc(100% + 4px);width: 1px;background: #8c8c8c;}

</style> 
<title>Insert title here</title>
</head> 
<body>

<!-- 세로형 막대그래프 만들기   -->
<div class="graph_wrap">
  <strong class="tit">제목</strong>
  <div class="graph">
    <!-- 기준 -->
    <ul class="y-axis">
      <li><span>35</span></li>
      <li><span>30</span></li>
      <li><span>25</span></li>
      <li><span>20</span></li>
      <li><span>15</span></li>
      <li><span>10</span></li>
      <li><span>5</span></li>
      <li><span>0</span></li>
    </ul>

    <!-- 목록 -->
    <ul class="x-axis">
      <li><span>목록1</span></li>
      <li><span>목록2</span></li>
      <li><span>목록3</span></li>
    </ul>

    <!-- 바 그래프 (백분율 만큼 heigh값) -->
    <ul class="bar">
      <li style="height:100%;"><span></span></li>
      <li style="height:70%;"><span></span></li>
      <li style="height:30%;"><span></span></li>
    </ul>
  </div>
</div>





















</body>
</html>