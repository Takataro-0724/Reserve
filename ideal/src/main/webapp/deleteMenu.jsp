<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*, chap06.*" %>
<%@ include file = "incFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeleteMenu</title>

<style>
 <!--
	table {border:1px black solid;
			margin: auto;}
	caption {color: #990000;
			  font-size: 18pt;}
	th {border:1px black solid;
	    text-align: left;
		background: #990000;
		color: #FFD7D7;}
	td {border:1px black solid;
	    background: #FFD7D7;}
	th.bottom {text-align: center;}
	p {text-align: center;}
-->
 
</style>

</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="m" class="chap06.Menu" scope="request" />
<% int typeID = m.getTypeID(); %>


<table border>
<caption>メニューの削除</caption>

<form action="MenuController" method="post">
	<tr>
		<th>メニュー名</th>
		<td>
		<jsp:getProperty name="m" property="menuName"/>
		</td>
	</tr>
	<tr>
		<th>価格</th>
		<td>
		<jsp:getProperty name="m" property="price"/>
		</td>
	</tr>
	<tr>
		<th>オーダー可</th>
		<td>
		<jsp:getProperty name="m" property="orderFlg"/>
		&nbsp;&nbsp;  (1==>可、0==>不可)
		</td>
	</tr>
	<tr>
		<th>分類</th>
		<td>
		<jsp:getProperty name="m" property="typeName"/>
		</td>
	</tr>
	<tr>
		<th>コメント</th>
		<td>
		<%= fmtNull(m.getDetail()) %>
<!-- 		incFileのfmtNull呼び出して引数として(oneMenu.getDetail())渡している -->
		</td>
	</tr>
	
	<input type="hidden" name="mode" value="<%=MenuMaintenanceSvl.DELETE%>"/>
	<input type="hidden" name="typeID" value='<jsp:getProperty name="m" property="typeID"/>'/>
	<input type="hidden" name="menuID" value='<jsp:getProperty name="m" property="menuID"/>'/>
	
	<tr>
		<td colspan = "2" id="bottom">
		<input type ="submit" value ="メニューを削除"/>
		</td>
	</tr>
</form>

</table>

<p>
<a href="MenuController?typeID=<%= typeID %>">一覧表示画面へ戻る</a>
</p>

</body>
</html>