package project.health;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.websocket.Session;

public class CartBean {

	private static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";

	private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";

	private static final String USER = "fit";
	private static final String PASSWD = "fit";

	Statement stmt = null;
	Connection con = null;
	PreparedStatement pstmt = null;

	public CartBean() {

		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void connect() {
		try {

			con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void disconnect() {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean insertCart(Cart cart) {
		connect();
		String sql = "insert into cart(cartid, userid, programid) values(?,?,?)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cart.getCartid());
			pstmt.setString(2, cart.getUserid());
			pstmt.setInt(3, cart.getProgramid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	public Cart getCart(String cartid, String userid) {
		connect();
		Cart cart = new Cart();

		String sql = "select * from cart where cartid =? and userid=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cartid);
			pstmt.setString(2, userid);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				cart.setCartid(rs.getString("cartid"));
				cart.setUserid(rs.getString("userid"));
				cart.setProgramid(rs.getInt("programid"));

			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			disconnect();
		}
		return cart;

	}

	public ArrayList<Cart> getCartList(String cartid) {
		connect();

		ArrayList<Cart> list = new ArrayList<Cart>();
		String sql = "select cartid , userid, programid from cart where cartid=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cartid);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Cart c = new Cart();
				c.setCartid(rs.getString("cartid"));
				c.setUserid(rs.getString("userid"));
				c.setProgramid(rs.getInt("programid"));

				list.add(c);

			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			disconnect();
		}
		return list;
	}

	public boolean checkCart(String cartid, int programid) {
		Boolean result = null;
		connect();
		String sql = "select cartid from cart where cartid=? and programid=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cartid);
			pstmt.setInt(2, programid);
			ResultSet rs = pstmt.executeQuery();

			if (!rs.next())
				result = false;
			else
				result = true;
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return result;
	}

	public boolean deleteCartP(Cart cart) {
		connect();

		try {

			String sql = "delete from cart where cartid=? and programid=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cart.getCartid());
			pstmt.setInt(2, cart.getProgramid());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	// ��ٱ��� ����
	public boolean deleteCart(Cart cart) {
		connect();

		try {
			String sql = "delete from cart where cartid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cart.getCartid());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	public boolean insertRegister(ArrayList<Cart> cart, ArrayList register_list) {
		connect();
		ArrayList<Cart> datas = cart;
		System.out.println(cart.size());
		String strSQL = "SELECT Max(registerid) FROM register";
		String sql = "insert into register(registerid,userid,programid,redate) values(?,?,?,sysdate)";
		String sql2 = "insert into order_ok(order_id, programid, programname) values(?,?,?)";
		try {
			pstmt = con.prepareStatement(strSQL);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int order_id = rs.getInt(1) + 1;
			
			System.out.println("for문 이전");
			for (Cart carts : datas) {
				System.out.println("for문 이후");
				pstmt = con.prepareStatement(strSQL);
				ResultSet rs1 = pstmt.executeQuery();
				rs1.next();
				int registerid = rs1.getInt(1) + 1;
				
				pstmt = con.prepareStatement(sql);

				pstmt.setInt(1, registerid);
				System.out.println(registerid);
				pstmt.setString(2, carts.getUserid());
				System.out.println(carts.getUserid());
				pstmt.setInt(3, carts.getProgramid());
				System.out.println(carts.getProgramid());
				pstmt.executeUpdate();

			}
			rs.close();

			for (int i = 0; i < register_list.size();) {

				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, order_id);
				pstmt.setString(2, (String) register_list.get(i));

				i++;
				pstmt.setString(3, (String) register_list.get(i));
				i++;
				pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

}
