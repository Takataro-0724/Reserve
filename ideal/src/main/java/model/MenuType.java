package model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

//Serialzableを宣言
public class MenuType implements Serializable {
	//フィールドを宣言
	private static final long serialVersionUID = 1L;
	private int typeID;
	private String typeName;

	//コンストラクタ
	public MenuType() {
		super();
	}

	//アクセスメソッド
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

	//sql文を使用してmenutypeから全件呼び出し
	//MenuType型のArraylist[al]にaddしてreturn
	public static ArrayList<MenuType> getAllType() throws SQLException {
		ArrayList<MenuType> al = new ArrayList<MenuType>();
		InitialContext ic = null;
		DataSource ds = null;
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = null;
		//データベースに接続してSQL文を実行
		try {
			ic = new InitialContext();
			ds = (DataSource) ic.lookup("java:comp/env/mariadb");
			con = ds.getConnection();
			sql = "SELECT * FROM menutype ORDER BY t_id ASC"; //データベースで動作確認済み
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			//取得したデータをArrayListに追加
			while (rs.next()) {
				MenuType mt = new MenuType();
				mt.setTypeID(rs.getInt("t_id"));
				mt.setTypeName(rs.getString("t_name"));
				al.add(mt);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//閉じ忘れチェック
			try {
				if (rs != null)
					rs.close();
				if (pst != null)
					pst.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return al;

	}

}
