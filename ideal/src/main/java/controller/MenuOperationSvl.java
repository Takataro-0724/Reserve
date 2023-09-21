package controller;

import java.awt.Menu;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MenuType;

/**
 * Servlet implementation class MenuController
 */
@WebServlet("/ReserveOperationSvl")
public class MenuOperationSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	public static final int INSERT		= 11;
	public static final int UPDATE		= 12;
	public static final int DELETE		= 13;
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuOperationSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		this.doPost(request,response); //■この一文でいけるかも知らん

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		System.out.println("doPost動いてるよ！");//****************************test
		int 	mode  	   = 0;
		int 	typeID 	   = 0;
		int 	menuID	   = 0;
		String 	url		   = "";
		String 	detail 	   = "";
		Menu 	m 		   = null;
		int 	resultNum  = 0;
//		String urltest =  "test_menuMaintenance.jsp";//**********************test
//		System.out.print( request.getParameter("mode") );//******************test
		
		if(	request.getParameter("mode") == null	) {
			mode =  TO_TOP;
			request.setAttribute("mode",mode);
		}else {
			mode = Integer.parseInt( request.getParameter("mode") );
		}
		if(	request.getParameter("typeID") == null	) {
			typeID = 100;
			request.setAttribute("typeID",typeID);
		}else {
			typeID = Integer.parseInt( request.getParameter("typeID") );
		}
		if( request.getParameter( "menuID" ) != null )    menuID	 = Integer.parseInt( request.getParameter( "menuID" ) );
		ArrayList<MenuType> typeMenus;
		
		try {											//　以降、switchを抜けるまで、SQLExceptionのcatchが必要なため、一括でくくる。
			typeMenus = MenuType.getAllType( );
			request.setAttribute("typeMenus",typeMenus);

		switch( mode ) {
			case( TO_TOP ):
				url =  "menuMaintenance.jsp";
				break;
			case( TO_INSERT ):
				url =  "insertMenu.jsp";
				break;
			case( TO_UPDATE ):
				m = Menu.getOneMenu( menuID, typeID );
				url =  "updateMenu.jsp";
				break;
			case( TO_DELETE ):
				m = Menu.getOneMenu( menuID, typeID ); 
				url =  "deleteMenu.jsp";
				break;
			case( INSERT ):
				m = new Menu(); 
				detail	 = request.getParameter( "detail" );
					detail = detail.replace( System.lineSeparator(), "<br/>" );
				m.setMenuName( request.getParameter( "menuName" ) );
				m.setTypeID( typeID );
				m.setPrice( Integer.parseInt( request.getParameter( "price" ) ) );
				m.setOrderFlg( Integer.parseInt( request.getParameter( "orderFlg" ) ) );
				m.setDetail( detail );
				resultNum = Menu.updateMenu( m, mode );
				url =  "menuMaintenance.jsp";
				break;
			case( UPDATE ):
				m = new Menu(); 
				detail	 = request.getParameter( "detail" );
					detail = detail.replace( System.lineSeparator(), "<br/>" );
				m.setMenuID( menuID );
				m.setMenuName( request.getParameter( "menuName" ) );
				m.setTypeID( typeID );
				m.setPrice( Integer.parseInt( request.getParameter( "price" ) ) );
				m.setOrderFlg( Integer.parseInt( request.getParameter( "orderFlg" ) ) );
				m.setDetail( detail );
				if( resultNum >= 1 ) request.setAttribute("mode",TO_TOP);
				url =  "menuMaintenance.jsp";
				break;
			case( DELETE ):
					m = Menu.getOneMenu(menuID,typeID);
					resultNum = Menu.updateMenu( m, mode );
				url =  "menuMaintenance.jsp";
				break;
			default:
				System.out.println(" modeの値が想定外の数字か、nullの可能性があります ");
				break;
		}
		request.setAttribute("m",m);
		if( resultNum >= 1 ) request.setAttribute("mode",TO_TOP);
		request.setAttribute("result",resultNum);
		request.setAttribute("menu",Menu.getMenu(typeID) );
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
			//System.out.println("エラーだよ！");
		}
		RequestDispatcher rs = request.getRequestDispatcher(url);
//		request.setAttribute("url",url);//*****************************************test
//		RequestDispatcher rs = request.getRequestDispatcher(urltest);
		rs.forward(request, response);	
	}
}
