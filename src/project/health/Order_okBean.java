package project.health;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class Order_okBean {
	private static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";

	private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";

	private static final String USER = "fit";
	private static final String PASSWD = "fit";

	Statement stmt = null;
	Connection con = null;
	PreparedStatement pstmt = null;

	public Order_okBean() {

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

	public List getOrderList() {
		// 장바구니 리스트 가져오기
		connect();
		String sql = "select order_id, programid, programname from order_ok where order_id = (select max(order_id) from order_ok)";
		List list = new ArrayList();
		try {
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int order_id = rs.getInt("order_id");
				list.add(order_id);
				int programid = rs.getInt("programid");
				list.add(programid);
				String programname = rs.getString("programname");
				list.add(programname);
				System.out.println(list);

			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			disconnect();
		}
		return list;
	}

	public ArrayList<Order_ok> getOrderOkList(int order_id) {
		connect();
		ArrayList<Order_ok> datas = new ArrayList<Order_ok>();

		String sql = "select * from order_ok where order_id=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, order_id);
			ResultSet rs = pstmt.executeQuery();
			// 루프를 돌면 ResultSet 을 이동하면서 모든 데이터 row 를 하나씩 가지고 와서 GuestBook 객체에 넣고
			// 이를 다시 ArrayList 에 넣는 작업을 반복.
			while (rs.next()) {
				Order_ok o = new Order_ok();
				o.setOrderid(rs.getInt("order_id"));
				o.setProgramid(rs.getInt("programid"));
				o.setProgramname(rs.getString("programname"));
				datas.add(o);
			}
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		// 처리가 끝나 ArrayList 를 리턴함.
		return datas;
	}

}
