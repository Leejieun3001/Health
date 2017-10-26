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

public class RegisterBean {

	private static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";

	private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";

	private static final String USER = "fit";
	private static final String PASSWD = "fit";

	Statement stmt = null;
	Connection con = null;
	PreparedStatement pstmt = null;

	public RegisterBean() {

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

	public ArrayList<Register> getRegisterList(String userid) {
		connect();
		ArrayList<Register> datas = new ArrayList<Register>();

		String sql = "select * from register where userid=? order by registerid desc";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			ResultSet rs = pstmt.executeQuery();
			// 루프를 돌면 ResultSet 을 이동하면서 모든 데이터 row 를 하나씩 가지고 와서 GuestBook 객체에 넣고
			// 이를 다시 ArrayList 에 넣는 작업을 반복.
			while (rs.next()) {
				Register register = new Register();
				register.setRegisterid(rs.getInt("registerid"));
				register.setUserid(rs.getString("userid"));
				register.setProgramid(rs.getInt("programid"));
				Date date = rs.getDate("redate");

				String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(date);

				register.setRedate(currentDate);

				datas.add(register);
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
