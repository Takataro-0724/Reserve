<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="chap06.*" %>
<%@ page import="java.util.*"%>
<%@ include file="incFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Menu</title>
<style>
<!--
	table {border:1px black solid;
			margin: auto;}
	caption {color: #006799;
			  font-size: 18pt;}
	th {border:1px black solid;
	    text-align: left;
		background: #006799;
		color: #FFD7D7;}
	td {border:1px black solid;
	    background: #C8EDFF;}
	th#bottom {text-align: center;}
	p {text-align: center;}
-->
</style>
<script>
<!--
function dataCheck(obj){
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
//-->
</script>
</head>
<body>
	
	<%
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int typeID;
		try{
			typeID = Integer.parseInt(request.getParameter("typeID"));
			
		}catch(NumberFormatException e){
			e.printStackTrace();
			typeID = 200;
		}		
	%>
	<jsp:useBean id="m" class="chap06.Menu" scope="request" />
	<jsp:useBean id="typeMenus" class="java.util.ArrayList" scope="request" />
	
	<table>
		<caption>メニューの更新</caption>
		<form id="frm1" name="frm1" action="MenuController" method="post" onsubmit="return dataCheck(this);">
		<tr>
			<th>メニュー名</th>
			<td><input type="text" name="menuName" size="30"
							 value='<jsp:getProperty name="m" property="menuName" />' /></td>
		</tr>
		<tr>
			<th>価格</th>
			<td><input type="text" name="price" size="6" 
							value='<jsp:getProperty name="m" property="price" />' /></td>
		</tr>
		<tr>
			<th>オーダー可</th>
	<%
		String[] order = {"不可","可"};
	%>
		<td>
	<%
		for(int i = 0; i < order.length; i++){
			String checked = "";
			if(m.getOrderFlg() == i){
				checked = "checked";
			}
	%>
		<input type="radio" name="orderFlg" value="<%= i %>" <%= checked %> />
		<%= order[i] %>&nbsp;&nbsp;&nbsp;
	<%	} %>
		</td>
		</tr>
		<tr>
			<th>分類</th>
			<td>
				<select name="typeID">
	<%
	for(Object o: typeMenus){
			MenuType mt = (MenuType)o;
			
			String selected = "";
			if(typeID == mt.getTypeID()){
				selected = "selected";
			}else{
				selected = "";
			}
	%>
				<option value="<%=mt.getTypeID()%>" <%=selected%>>
				<%=((MenuType)o).getTypeName()%></option>
	<%    		}  %>
				</select>
			</td>
		</tr>
		<tr>
			<th>コメント</th>
			<td><textarea name="detail" rows="4" cols="30" >
			<%= fmtNull(m.getDetail()) %></textarea>
			</td>
		</tr>
		<input type="hidden" name="mode" value="<%=MenuMaintenanceSvl.UPDATE%>" /><%=MenuMaintenanceSvl.UPDATE%>
		<input type="hidden" name="menuID" value='<jsp:getProperty name="m" property="menuID"/>' /><%=((Menu)m).getMenuID()%>
		<input type="hidden" name="typeID" value='<jsp:getProperty name="m" property="typeID"/>' /><%=((Menu)m).getTypeID()%><%=  typeID  %>
		<tr>
			<th colspan="2" id = "bottom" ><input type="submit" value="メニューを更新" /></th>
		</tr>
	</form>
	</table>
	<p><a href="MenuController?typeID=<%= typeID %>">一覧表示画面に戻る</a></p>
</body>
</html>