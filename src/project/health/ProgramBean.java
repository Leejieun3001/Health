package project.health;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ProgramBean {

	private static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";

	private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";

	private static final String USER = "fit";
	private static final String PASSWD = "fit";

	Statement stmt = null;
	Connection con = null;
	PreparedStatement pstmt = null;

	public ProgramBean() {

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

	public boolean insertProgram(Program program) {

		connect();

		try {

			String strSQL = "SELECT Max(programid) FROM program";

			pstmt = con.prepareStatement(strSQL);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int num = rs.getInt(1) + 1;

			String sql = "insert into program(programid, programname, content ,price, trainername,centername) values(?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setString(2, program.getProgramname());
			pstmt.setString(3, program.getContent());
			pstmt.setInt(4, program.getPrice());
			pstmt.setString(5, program.getTrainername());
			pstmt.setString(6, program.getCentername());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	public ArrayList<Program> getProgramList() {
		connect();

		ArrayList<Program> datas = new ArrayList<Program>();

		String sql = "select * from program where programid>0  order by programid desc";
		try {
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			// 루프를 돌면 ResultSet 을 이동하면서 모든 데이터 row 를 하나씩 가지고 와서 GuestBook 객체에 넣고
			// 이를 다시 ArrayList 에 넣는 작업을 반복.
			while (rs.next()) {
				Program program = new Program();
				program.setProgramid(rs.getInt("programid"));
				program.setProgramname(rs.getString("programname"));
				program.setContent(rs.getString("content"));
				program.setPrice(rs.getInt("price"));
				program.setTrainername(rs.getString("trainername"));
				program.setCentername(rs.getString("centername"));
				datas.add(program);
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

	public Program getprogram(int programid) {
		connect();

		String sql = "select * from program where programid=?";

		Program program = new Program();

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, programid);
			ResultSet rs = pstmt.executeQuery();

			rs.next();
			program.setProgramid(rs.getInt("programid"));
			program.setProgramname(rs.getString("programname"));
			program.setContent(rs.getString("content"));
			program.setPrice(rs.getInt("price"));
			program.setTrainername(rs.getString("trainername"));
			program.setCentername(rs.getString("centername"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return program;
	}

	// 데이터 갱신을 위한 메서드
	public boolean updateProgram(Program program) {
		connect();

		String sql = "update program set programname=?, content=?, price=?, 	trainername=?, centername=? where programid=?";

		try {
			pstmt = con.prepareStatement(sql);
			// 인자로 받은 GuestBook 객체를 이용해 사용자가 수정한 값을 가져와 SQL문 완성
			pstmt.setString(1, program.getProgramname());
			pstmt.setString(2, program.getContent());
			pstmt.setInt(3, program.getPrice());
			pstmt.setString(4, program.getTrainername());
			pstmt.setString(5, program.getCentername());
			pstmt.setInt(6, program.getProgramid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	// 데이터 삭제를 위한 메서드
	public boolean deleteProgram(int programid) {
		connect();

		try {

			String sql = "delete from program where programid=?";

			pstmt = con.prepareStatement(sql);
			// 인자로 받은 gb_id 프라이머리 키 값을 이용해 삭제
			pstmt.setInt(1, programid);
			pstmt.executeUpdate();

			String sql2 = "UPDATE program  SET programid = programid - 1 WHERE programid > ?";

			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1, programid);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	// 상품 검색을 위한 메서드
	public ArrayList<Program> getsearchProgramlist(String strTitle, String strCont) {
		connect();

		ArrayList<Program> datas = new ArrayList<Program>();

		String sql = "SELECT programid, programname,content, price, trainername, centername from program WHERE "
				+ strTitle + " LIKE '%" + strCont + "%'";
		;
		try {
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			// 루프를 돌면 ResultSet 을 이동하면서 모든 데이터 row 를 하나씩 가지고 와서 GuestBook 객체에 넣고
			// 이를 다시 ArrayList 에 넣는 작업을 반복.
			while (rs.next()) {
				Program program = new Program();
				program.setProgramid(rs.getInt("programid"));
				program.setProgramname(rs.getString("programname"));
				program.setContent(rs.getString("content"));
				program.setPrice(rs.getInt("price"));
				program.setTrainername(rs.getString("trainername"));
				program.setCentername(rs.getString("centername"));

				datas.add(program);
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
