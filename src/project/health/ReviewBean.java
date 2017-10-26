package project.health;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ReviewBean {

	private static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";

	private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";

	private static final String USER = "fit";
	private static final String PASSWD = "fit";

	Statement stmt = null;
	Connection con = null;
	PreparedStatement pstmt = null;

	public ReviewBean() {

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

	public ArrayList<Review> getReviewList() {
		connect();
		ArrayList<Review> list = new ArrayList<Review>();

		String SQL = "select * from review order by reviewid desc";
		try {
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Review review = new Review();

				review.setReviewid(rs.getInt("reviewid"));
				review.setUserid(rs.getString("userid"));
				review.setTitle(rs.getString("title"));
				review.setCenterName(rs.getString("centername"));
				review.setRegdate(rs.getDate("redate"));
				review.setContent(rs.getString("content"));
				list.add(review);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

	//
	public Review getReview(int reviewid) {
		connect();
		String SQL = "select * from review where reviewid = ?";
		Review review = new Review();

		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, reviewid);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			review.setReviewid(rs.getInt("reviewid"));
			review.setUserid(rs.getString("userid"));
			review.setTitle(rs.getString("title"));
			review.setCenterName(rs.getString("centername"));
			review.setRegdate(rs.getTimestamp("redate"));
			review.setContent(rs.getString("content"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return review;
	}

	public boolean insertReview(Review review) {
		connect();

		try {

			String strSQL = "SELECT Max(reviewid) FROM review";

			pstmt = con.prepareStatement(strSQL);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int num = rs.getInt(1) + 1;

			String sql = "insert into review(reviewid, userid, title ,centerName,redate ,content) values(?,?,?,?, sysdate,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setString(2, review.getUserid());
			pstmt.setString(3, review.getTitle());
			pstmt.setString(4, review.getCenterName());
			pstmt.setString(5, review.getContent());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;

	}

	public boolean updateReview(Review review) {
		boolean success = false;
		connect();
		String sql = "update review set title=?, centername= ? , redate = sysdate , content=? where reviewid=?";
		try {
			pstmt = con.prepareStatement(sql);
			//
			pstmt.setString(1, review.getTitle());
			pstmt.setString(2, review.getCenterName());
			pstmt.setString(3, review.getContent());
			pstmt.setInt(4, review.getReviewid());
			int rowUdt = pstmt.executeUpdate();
			if (rowUdt == 1)
				success = true;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	//
	public boolean deleteReview(int reviewid) {

		connect();
		String sql = "delete from review where reviewid=?";
		try {
			pstmt = con.prepareStatement(sql);
			//
			pstmt.setInt(1, reviewid);
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
