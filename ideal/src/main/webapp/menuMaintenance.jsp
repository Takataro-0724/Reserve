<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.*,java.text.*,model.*,contoroller.*" %>
    <%@ include file ="incFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>メイン画面</title>
<style>
<!--
   table {border:1px black solid; 
			text-align: center;
			margin: auto;}
	caption {font-size: 18pt;
		      color: #009967;}
	tr.data0 {background: #E3FFE3;}
	tr.data1 {background: #A4FFDB;}
	th {background: #007B66;
		color: #ECFFF3;}
	td {border:1px black solid;
	    text-align: left;
		vertical-align: top;
		white-space: nowrap;}
	td.outer {padding: 10px;
			  background: #FAFFE3;}

	.code {width: 40px;
		   text-align: center;}
	.menu {width: 250px;}
	.price {width: 60px;
	        text-align: right;
	        padding-right: 5px;}
	.comm {width: 400px;}
	.ord {width: 100px;
	      text-align: center;}
	.btn {width: 100px;}
	h1 {text-align: center;
		background: #007B66;
		color: #ECFFF3;}
	div.type1 {width: 130px;
		       border: solid gray 1px;
		       background: #E3FFE3;
		       color: #007B53;
		       padding: 2px;
		       cursor: pointer;
		       margin-top: 5px;}
	div.type2 {width: 130px;
		       border: solid gray 1px;
		       background: #007B53;
		       color: #E3FFE3;
		       padding: 2px;
		       cursor: pointer;
		       margin-top: 5px;}
-->
</style>
</head>
<body>
 <h1>=== メインマスターメンテナンス ===</h1>
 <%
   String[] order = {"不可","可"};
   //通貨フォーマット
   NumberFormat cf = NumberFormat.getCurrencyInstance(new Locale("ja","JP")); int typeID;
   String style = "id = 'type1'";
   
   try{
	   typeID = Integer.parseInt(request.getParameter("typeID"));//typeIDを数値に変換
   }catch(NumberFormatException e){
	   typeID =100;
   }
   %>
   
   <jsp:useBean id ="mType" class ="java.util.ArrayList" scope ="request" />
   <jsp:useBean id ="menu" class ="java.util.ArrayList" scope="request" />
   
   <table>
     <tr>
       <td id="outer">
     <%
       //
       for (int i = 0 ; i < mType.size() ; i++){
    	   MenuType mt = (MenuType)mType.get(i);
    	   if(typeID == mt.getTypeID()){
    		   style = "id = 'type2'"; 
    	   }else{
    		   style = "id = 'type1'";
    	   }
     %>
       <form name ="frm<%= i %>" action ="MenuMaintenanceSvl" method ="post">
         <input type ="hidden" name ="typeID" value ="<%=mt.getTypeID()%>" />
         <div <%=style%> onclick ="document.frm<%=i%>.submit();">
              <%=mt.getTypeName()%>
         </div>
       </form>
   <%
   }
   %>
       </td>
       <td id ="outer">
       <table> <!-- インナーテーブル -->
        <caption> &lt;&lt;&lt;
   <%
   try{
   %>
            <%=((Menu)menu.get(0)).getTypeName()%>
   <%
   } catch(Exception e) {
   %>
             メニューがありません。
   <%
   }
   %>
        &gt;&gt;&gt; </caption>
   
     <tr>
	  <th class = "code">ID</th>
	  <th class = "menu">メニュー</th>
	  <th class = "price">価格</th>
	  <th class = "comm">コメント</th>
	  <th class = "ord">オーダー</th>
	  <th class = "btn" colspan="2"></th>
	 </tr>
   <%
   for(int i = 0 ; i < menu.size() ; i++) {
       	 Menu m = (Menu)menu.get(i);
   %>
   
     <tr id ="data<%=i % 2%>">
       <td id ="cide"> <%=m.getMenuID()%> </td>
       <td id ="menu"> <%=m.getMenuName()%> </td>
       <td id ="price"> <%=cf.format(m.getPrice())%> </td>
       <td id ="comm"> <%=fmtNull(m.getDetail())%> </td>
       <td id ="ord"> <%=order[m.getOrderFlg()]%> </td>
       <td>
        <form action = "MenuUpdateSvl" method ="post">
         	<input type ="submit" value ="更新" />
            <!--<input type ="hidden" name ="mode" />-->
         	<input type ="hidden" name ="menuID" value ="<%=m.getMenuID()%>" />
         	<input type ="hidden" name ="typeID" value ="<%=typeID%>"/>
        </form>
                 
       </td>
       <td>
        <form action = "MenuDeleteSvl" method ="post">
           <input type ="submit" value ="削除" />
           <input type ="hidden" name ="menuID" value ="<%=m.getMenuID()%>" />
           <input type ="hidden" name ="typeID" value ="<%=typeID%>"/>
        </form>   
       </td>
       </tr>
   <%
   }
   %>
      <tr>
         <form action ="MenuInsertSvl" method ="post">
         <th colspan ="7">
           <input type ="hidden" name ="typeID" value ="<%=typeID%>" />
           <input type ="submit" value ="新しいメニューの追加" />
         </th>
         </form>
      </tr>
      </table> <!-- インナーテーブル -->
      </td>
    </tr>
  </table>
</body>
</html>