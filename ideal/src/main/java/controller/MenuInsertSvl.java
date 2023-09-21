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
@WebServlet("/ReserveInsertSvl")
public class MenuInsertSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuInsertSvl() {
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
		typeID = Integer.parseInt( request.getParameter("typeID") ); 
		try {				//　以降、switchを抜けるまで、SQLExceptionのcatchが必要なため、一括でくくる。
			if(	typeID == 100 ) {
				ArrayList<Menu>  typeMenuList = Menu.getMenu(typeID);
				url = "courseInsert.jsp";
				request.setAttribute("typeMenuList",typeMenuList);
			}else {					
				ArrayList<MenuType> mType = MenuType.getAllType( );
				request.setAttribute("mType",mType);
				url =  "insertMenu.jsp";
			}
			}catch(SQLException e) {
				e.printStackTrace();
			}

		
		RequestDispatcher rs = request.getRequestDispatcher(url);
//		request.setAttribute("url",url);//*****************************************test
//		RequestDispatcher rs = request.getRequestDispatcher(urltest);
		rs.forward(request, response);	
	}
}
