package project.health;

import java.sql.*;
import java.util.*;

public class LoginBean {

	// 사용자로 부터 입력받은 아이디와 비밀번호 저장
	private String userid;
	private String passwd;

	// DB 연결 관련 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;

	// DB 연결관련정보를 문자열로 선언
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
	String jdbc_url = "jdbc:oracle:thin:@localhost:1521:orcl";

	void connect() {
		try {
			Class.forName(jdbc_driver);

			conn = DriverManager.getConnection(jdbc_url, "fit", "fit");

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	void disconnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 로그인 계정 정보가 맞는지 확인하는 메서드
	public boolean checkUser() {
		String dbpasswd = null;

		connect();

		String sql = "select passwd from member where userid=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, this.getUserid());
			ResultSet rs = pstmt.executeQuery();

			rs.next();
			dbpasswd = rs.getString("passwd");
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		if (dbpasswd.equals(this.passwd)) {
			return true;
		} else
			return false;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
}