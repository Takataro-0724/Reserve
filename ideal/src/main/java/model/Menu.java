package model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Menu implements Serializable{
	private static final long serialVersionUID = 1L;
	//フィールド
	private int menuID;
	private String menuName;
	private String detail;
	private int price;
	private int orderFlg;
	private int typeID;
	private String typeName;
	
	//コンストラクタ
	public Menu() {
		super();
	}
	
	//アクセスメソッド
	public int getMenuID() {
		return menuID;
	}
	public void setMenuID(int menuID) {
		this.menuID = menuID;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getOrderFlg() {
		return orderFlg;
	}
	public void setOrderFlg(int orderFlg) {
		this.orderFlg = orderFlg;
	}
	public int getTypeID() {
		return typeID;
	}
	public void setTypeID(int typeID) {
		this.typeID = typeID;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	//メニューを1レコードずつ取得するメソッド
	public static Menu getOneMenu(int menuID, int typeID) throws SQLException{
	//DB接続の準備
	InitialContext ic  	  = null;
	DataSource ds 	  	  = null;
	Connection con 		  = null;
	PreparedStatement pst = null;
	ResultSet rs 		  = null;
	
	//変数の宣言と初期化
	Menu m 				  = null;
	String sql = "";
	String table = "menu";
	String keyColumn = "m_id";
	String name = "m_Name";
	
	if(typeID == 100) {
		 table = "course";
		 keyColumn = "c_id";
		 name = "c_name"; //-------------------------------------■c_ame
	}	 
		 try {
			  ic  = new InitialContext();
			  ds  = (DataSource)ic.lookup("java:comp/env/mariadb");
			  con = ds.getConnection();
			 
			  sql += " SELECT * FROM " + table;
			  sql += " JOIN";
			  sql += " menutype";
			  sql += " USING(t_id)";
			  sql += " WHERE ";
			  sql += 	keyColumn + " = ?";
			  sql += " ORDER BY " + keyColumn;
			  
			  pst = con.prepareStatement(sql);
			  pst.setInt(1 , menuID);
			  rs  = pst.executeQuery();
			  
			  if(rs.next()) {
				 m = new Menu();
				 m.setMenuID(rs.getInt(keyColumn));
				 m.setMenuName(rs.getString(name));
				 m.setDetail(rs.getString("detail"));
				 m.setOrderFlg(rs.getInt("orderFlg"));
				 m.setPrice(rs.getInt("price"));
				 m.setTypeID(rs.getInt("t_id"));
				 m.setTypeName(rs.getString("t_name"));
			  }
				
		 }catch(Exception e) {
			 System.out.println("SQL="+ pst);
			 e.printStackTrace();
		 }finally {
			 try {
				 if(rs  != null) rs.close();
				 if(pst != null) pst.close();
				 if(con != null) con.close();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }
		return m;
	}
	
	//typeIDをもとにtypeに合わせたメニューを取得するメソッド
	public static ArrayList<Menu> getMenu(int typeID) throws SQLException{
		ArrayList<Menu> al = new ArrayList<Menu>();
		
		//DB接続の準備
		InitialContext ic 	  = null;
		DataSource ds 		  = null;
		Connection con 		  = null;
		PreparedStatement pst = null;
		ResultSet rs 		  = null;
		
		//変数の宣言と初期化
		String sql = "";
		String table = "menu";
		Menu m = null;
		if(typeID == 100) table = "course";
			try {
				ic  = new InitialContext();
				ds  = (DataSource)ic.lookup("java:comp/env/mariadb");
				con = ds.getConnection();
				
				sql += "SELECT * FROM " + table;
				sql += " JOIN";
				sql += " menutype";
				sql += " USING(t_id)";
				sql += " WHERE ";
				sql += 	table + ".t_id = ?";
				sql += " ORDER BY 2";
				
				pst = con.prepareStatement(sql);
				pst.setInt(1 , typeID);
				rs  = pst.executeQuery();
				
				while(rs.next()) {
					m = new Menu();
					m.setMenuID(rs.getInt(2));
					m.setMenuName(rs.getString(3));
					m.setDetail(rs.getString(4));
					m.setOrderFlg(rs.getInt(5));
					m.setPrice(rs.getInt(6));
					m.setTypeName(rs.getString(7));
					al.add(m);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				 try {
					 if(rs  != null) rs.close();
					 if(pst != null) pst.close();
					 if(con != null) con.close();
				 }catch(Exception e) {
					 e.printStackTrace();
				 }
			}
//			System.out.println("al="+ al);
			return al;
		}
	
	//DBの処理を行うメソッド
	public static int updateMenu(Menu m, int mode)throws SQLException{
		//DB接続の準備
		InitialContext ic 	  = null;
		DataSource ds	  	  = null;
		Connection con 	  	  = null;
		PreparedStatement pst = null;
		ResultSet rs 		  = null;
		
		//変数の宣言と初期化
		String sql			  = "";;
		String table 		  = "";
		String keyColumn	  = "";;
		String name 		  = "";
		int num				  = 0;
		
		if(m.getTypeID() == 100) {
			table = "course";
			keyColumn = "c_id";
			name = "c_name";
		}else {
			table = "menu";
			 keyColumn = "m_id";
			 name = "m_name";
		}
		
		try {
			ic  = new InitialContext();
			ds  = (DataSource)ic.lookup("java:comp/env/mariadb");
			con = ds.getConnection();
			
			if(mode == MenuController.INSERT) {
				//SQL文の生成
				sql += "INSERT INTO " + table;
				sql += " VALUES(";
				sql += " DEFAULT,?,?,?,?,?) ";
			
				pst = con.prepareStatement(sql);
				pst.setString(1, m.getMenuName());
				pst.setString(2, m.getDetail());
				pst.setInt	 (3, m.getOrderFlg());
				pst.setInt	 (4, m.getPrice());
				pst.setInt	 (5, m.getTypeID());
				
			}else if(mode == MenuController.UPDATE) {
				//SQL文の生成
				sql += "UPDATE " + table;
				sql += " SET " + name + " = ?,";
				sql += " detail = ?,";
				sql += " orderFlg = ?,";
				sql += " price = ?,";
				sql += " t_id = ?";
				sql += " WHERE " + keyColumn + " = ?";
				
				pst = con.prepareStatement(sql);
				pst.setString(1, m.getMenuName());
				pst.setString(2, m.getDetail());
				pst.setInt	 (3, m.getOrderFlg());
				pst.setInt	 (4, m.getPrice());
				pst.setInt	 (5, m.getTypeID());
				pst.setInt	 (6, m.getMenuID());
				
//				System.out.println("<Menu.java>");
//				System.out.print(m.getMenuName() +", ");
//				System.out.print(m.getDetail() +", ");
//				System.out.print(m.getOrderFlg() +", ");
//				System.out.print(m.getPrice() +", ");
//				System.out.print(m.getTypeID() +", ");
//				System.out.println(m.getMenuID());
				
				
				
				
			}else if(mode == MenuController.DELETE) {
				//SQL文の生成
				sql += "DELETE FROM " + table;
				sql += " WHERE " + keyColumn + " = ?";
				
				pst = con.prepareStatement(sql);
				pst.setInt(1, m.getMenuID());
				
			}
			num  = pst.executeUpdate();
			//m = Menu.getOneMenu(m.getMenuID(),m.getTypeID());//-----------------------*
			//Menu.check(m);
			
			
		}catch(Exception e) {
			System.out.println("SQL =" + pst);
			e.printStackTrace();
		}finally {
			try {
				if(rs  != null) rs.close();
				if(pst != null) pst.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return num;
	}
	public static void check( Menu m ) {
		System.out.println("check");
		System.out.println(
				m.getMenuName() + ", " +
				m.getDetail() + ", " +
				m.getOrderFlg() + ", " +
				m.getPrice() +", " +
				m.getTypeID() +", " +
				m.getMenuID());
		
	}
	
	
}
