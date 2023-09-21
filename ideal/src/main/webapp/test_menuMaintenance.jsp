<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="chap06.MenuController" %>
<%@ page import="chap06.MenuType" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> テスト MenuMaintence </title>
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
 		<th>ytpeID = </th>
 		<td><input type="text" name="typeID" /> </td>
	</tr><tr>
 		<th>menuName = </th>
 		<td><input type="text" name="menuName" /> </td>
	</tr><tr>
 		<th>price =  </th>
 		<td> <input type="text" name="price" /> </td>
 	</tr><tr>
 		<th>orderFlg = </th>
 		<td><input type="text" name="orderFlg" /> </td>
 	</tr><tr>
 		<th>detial =  </th>
 		<td> <textarea  name="detial"  cols="50" rows="5"></textarea> </td>
 	</tr><tr>
 		<td> <input type="submit" value="test" /></td>
 	</tr>
 	</table>
	</form>
	<%
	int test 	= (int)request.getAttribute("test");
			
		String url 	= (String)request.getAttribute("url");
		//String detial 	= (String)request.getAttribute("detial");
		out.println(test);
		out.println( url );
		//out.println(detial);
		
		ArrayList<MenuType> al = null;
		try {
		al =MenuType.getAllType();
		for( int i = 0 ; i < al.size() ; i++ ) {
			MenuType j = al.get(i);
		out.println( j.getTypeID() + " " +  j.getTypeName() );
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		out.print("</br>" );
		out.println( "↓パラメータの取得</br>" );
		String s = (String)request.getAttribute("dataTest");
		out.println(s );
	%>

</body>
</html>