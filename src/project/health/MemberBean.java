package project.health;

import java.sql.*;
import java.util.ArrayList;

public class MemberBean {

	private static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";

	private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";

	private static final String USER = "fit";
	private static final String PASSWD = "fit";

	Statement stmt = null;
	Connection con = null;
	PreparedStatement pstmt = null;

	public MemberBean() {

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

	// ID 중복 체크 메소드
	public boolean checkID(String userid) {
		Boolean check = null;
		connect();
		String sql = "select userid from member where userid=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			ResultSet rs = pstmt.executeQuery();

			if (!rs.next())
				check = true;
			else
				check = false;
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return check;
	}

	// 회원가입
	public boolean insertMember(Member member) {

		connect();

		String sql = "insert into member(userid, passwd, centerName ,name, ssn,sex,phone,address,email) values(?,?,?,?,?,?,?,?,?)";

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, member.getUserid());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getCenterName());
			pstmt.setString(4, member.getName());
			pstmt.setString(5, member.getSsn());
			pstmt.setString(6, member.getSex());
			pstmt.setString(7, member.getPhone());
			pstmt.setString(8, member.getAddress());
			pstmt.setString(9, member.getEmail());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	// 회원 탈퇴
	public boolean deleteMember(String userid) {
		connect();

		String sql = "delete from member where userid=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}
}
