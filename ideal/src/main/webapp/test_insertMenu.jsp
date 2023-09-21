<%@ page import = "chap06.*" %>
<%@ page import = "java.util.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css記述 -->
<style>
<!--
	table {margin: auto;}
	caption{color:#009967;
			font-size:18pt;}
	th {text-align: left;
	background:#a4ffdb;
	color:#007B66;
		}
	td {background:#e3ffe3;}
	th#bottom{text-align:center;}
	p{text-align:center;}
-->
</style>
<!-- フォームチェック[メニュー名、価格、オーダー可否選択] -->
<script>
<!--
function datacheck(obj){
	var msg = "";
	if(obj.menuName.value.length < 1){
	msg += "メニュー名を入力してください。\n";
		}
	if(!obj.price.value.match(/^[0-9]+$/g)){
		msg+="価格を数値で入力してください。\n";
		}
	var i ;
	for(i = 0 ; i < obj.orderFlg.length ; ++i){
		if(obj.orderFlg[i].checked) break;
		}
	if(i>=obj.orderFlg.length){
		msg+="オーダーの可否をチェックしてください。\n";
		}
	if(msg.length > 0){
		alert(msg);
		return false;
		}else{
			return true;
			}
}
-->
</script>

<title>Insert Menu</title>
</head>
<body>
<%
int typeID;
try{
	typeID = Integer.parseInt(request.getParameter("typeID"));
}catch(NumberFormatException e){
typeID = 100 ;	
}
%>
<jsp:useBean id = "mType" class = "java.util.ArrayList" scope = "request" />
<jsp:useBean id = "menu" class = "java.util.ArrayList" scope = "request" />

<table border>
<!-- 中央寄せした表題の表示 -->
<caption>新しいメニューを追加</caption>>
<!-- フォーム作成、テーブル内に各項目を表示 -->
	<form id="frm1" name="frm1" method="post"  action="MenuController" onsubmit="return dataCheck(this)">

	<tr>
		<th>メニュー名</th><td><input type="text" name="menuName" size="30" /></td>
	</tr>
	<tr>
		<Th>価格</Th><td><input type="text" name="price" size="6" />
</td>
	</tr>
	<tr>
		<th>オーダー可</th><td><input type="radio" name="orderFlg" value="1" />可<input type="radio" name="orderFlg" value="0" />不可</td>
	</tr>
	<tr>
		<th>分類</th><td><select name ="typeID">
		<%
		for(Object o : mType){
			MenuType mt = (MenuType)o;
			String selected = "";
			if(typeID == mt.getTypeID()){
				selected = "selected";
			}else{
				selected = "";
			}
		%>
			<option value = "<%=((MenuType)o).getTypeID()%>"<%=selected%>>
			<%=((MenuType)o).getTypeName()%></option>
			<% 
		}
		%>
		</select>
		</td>
	</tr>
	<tr>
		<th>コメント</th><td><textarea name="detail" cols="30" lows="4" ></textarea></td>
	</tr>
	<input type= "hidden" name ="mode" value ="<%=MenuMaintenanceSvl.INSERT%>"/>
	<tr>
		<th colspan="2" id = "bottom"><input type = "submit" value = "メニューを追加" /></th>
	</tr>
	</form>
</table>


<!-- window.history.back()でmenuMaintenance.jsp遷移 -->

<P> <a href="MenuController?typeID=<%= typeID %>">一覧表示画面へ戻る</a> </P>

</body>
</html>