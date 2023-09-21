package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Menu;
import model.MenuType;


/**
 * Servlet implementation class MenuController
 */
@WebServlet("/MenuMaintenanceSvl")
public class MenuMaintenanceSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuMaintenanceSvl() {
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
		int 	typeID 	   = 0;
		String 	url		   = "";
//		String urltest =  "test_menuMaintenance.jsp";//**********************test
//		System.out.print( request.getParameter("mode") );//******************test
		
		/*
		 *	セッションの処理は未記載
		 * 
		 * 
		 * */

		if(	request.getParameter("typeID") == null	) {
			typeID = 100;
			request.setAttribute("typeID",typeID);
		}else {
			typeID = Integer.parseInt( request.getParameter("typeID") );
		}
		
		ArrayList<MenuType> mType;
		try {											//　以降、switchを抜けるまで、SQLExceptionのcatchが必要なため、一括でくくる。
			mType = MenuType.getAllType( );
			request.setAttribute("mType",mType);
			request.setAttribute("menu",Menu.getMenu(typeID) );
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
			//System.out.println("エラーだよ！");
		}
		url ="/menuMaintenance.jsp";
		RequestDispatcher rs = request.getRequestDispatcher(url);
//		request.setAttribute("url",url);//*****************************************test
//		RequestDispatcher rs = request.getRequestDispatcher(urltest);
		rs.forward(request, response);	
	}
}
