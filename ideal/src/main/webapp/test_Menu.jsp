<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="chap06.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test_Menu</title>
	<script>
		<!--
		 function test(){
			alert( document.frm1.mode.value );
			 }
		//-->
	</script>
</head>
<body>

<form id="frm1" name="frm1" action="MenuController" method="post" onsubmit="test()" >
	<table>
	<tr>
		<th>mode = </th>
		<td> <input type="text" name="mode" /> </td>
 	</tr><tr>
 		<th>menuID = </th>
 		<td><input type="text" name="menuID" /> </td>
 	</tr><tr>
 		<th>typeID =  </th>
 		<td> <input type="text" name="typeID" /> </td>
 	</tr><tr>
 		<td> <input type="submit" value="test" /></td>
 	</tr>
 	</table>
	</form>



<%
ArrayList<Menu> al1 = null;
		try {
		al1 = (ArrayList<Menu>)request.getAttribute("menu");
		for( int i = 0 ; i < al1.size() ; i++ ) {
	Menu m = al1.get(i);
	String s =
	m.getMenuID() + " " +
	 		m.getMenuName() + " " +
	 		m.getDetail() + " " +
	 		m.getPrice() + " " +
	 		m.getOrderFlg() + " " +
	 		m.getTypeID() + " " + 
	 		m.getTypeName();
		out.println( s );
		out.println( "</br>" );
	}
		}catch(Exception e) {
	e.printStackTrace();
	out.print("このテストページでArrayListを展開するときにエラー出てるよ！！");
	
		}
		ArrayList<MenuType> al2 = null;
		try {
		al2 = (ArrayList<MenuType>)request.getAttribute("typeMenus");
		for( int i = 0 ; i < al2.size() ; i++ ) {
	MenuType m = al2.get(i);
	String s =
	 		m.getTypeID() + " " + 
	 		m.getTypeName();
		out.println(s );
		out.println( "</br>" );
	}
		}catch(Exception e) {
	e.printStackTrace();
	out.print("このテストページでArrayListを展開するときにエラー出てるよ！！");
	
		}
%>
</body>
</html>