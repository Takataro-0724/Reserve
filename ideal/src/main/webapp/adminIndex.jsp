<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurante IDEALLE</title>
<style type="text/css">
<!--
	body{text-align:center; margin:auto;}
-->
</style>
<script type="text/javascript"></script>
	<head>
<body>

<!-- 
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	
	String admName;
	admName = request.getParameter("admName");
		
%>
 -->
 <table>
 	<tr><h2>■ Restaurante IDEALLE ■</h2></tr>
	<tr><h2>管理者処理選択</h2></tr>
	<tr><h3><!-- <%= admName %> -->様、いらっしゃいませ。</h3></tr>
	<tr><!-- メッセージを表示する箇所？ --></tr>
	<tr><p><a href="MenuMenttenanceSvl">●メニューメンテナンス</a></p></tr>
	<tr><p><a hrel="AdminLogoffSvl">●ログオフ</a><p></tr>
	
</table>
</body>
</html>