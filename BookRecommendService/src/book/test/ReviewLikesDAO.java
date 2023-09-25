package book.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ReviewLikesDAO {
	private static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private static String user = "hr";
	private static String password = "hr";
	private static final String jdbcclass = "oracle.jdbc.OracleDriver";
	private ConnectionPool pool;
	private ReviewDTO reviews;
	
	public ReviewLikesDAO() {
		super();
		try {
			Class.forName(jdbcclass);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("JDBC 드라이버를 찾을 수 없습니다.");
		}
		try {
			pool = ConnectionPool.getInstance(url, user, password, 3, 5, true, 500);
			System.out.println("연결되었습니다.");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 연결 오류");
		}
	}
	
	public int insert(ReviewLikesDTO input) throws SQLException {
		String sql = "insert into ReviewLikes(userID, bookID, likeUserID)\r\n" + 
				"	values( "
				+ "'"+input.getUserID()+"',"
				+ "'"+input.getBookID()+"', "
				+ "'"+input.getLikeUserID()
				+"')";
		System.out.println("reviewlikesDAO의 insert의 쿼리문 : " + sql);
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		int result = stmt.executeUpdate(sql);
		System.out.println("Reviewlikes DAO의 insert의 result : " + result);
		stmt.close();
		pool.releaseConnection(conn);
		return result;
	}
	
	public boolean check(ReviewLikesDTO input) throws SQLException {
		String sql = "select likeuserid from ReviewLikes where userid = '" + input.getUserID() + "'and bookID = '" + input.getBookID() + "'";
		System.out.println("reviewlikesDAO의 check의 쿼리문 : " + sql);
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(sql);
		ArrayList<ReviewLikesDTO> reviewLikes = new ArrayList();
		ReviewLikesDTO reviewlike = null;
		boolean bool = true;
		while(result.next()) {
			if(input.getLikeUserID().equals(result.getString("likeUserID"))) {
				System.out.println("if문");
				bool = false;
			}
			System.out.println("reviewlikeDAO의 check : " + result.getString("likeUserID"));
		}
		System.out.println(bool);
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return bool;
	}
	
	public int count(ReviewLikesDTO input) throws SQLException {
		String sql = "select likeuserid from ReviewLikes where userid = '" + input.getUserID() + "'and bookID = '" + input.getBookID() + "'";
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(sql);
		ArrayList<ReviewLikesDTO> reviewLikes = new ArrayList();
		ReviewLikesDTO reviewlike = null;
		while(result.next()) {
			reviewlike = new ReviewLikesDTO(result.getString("likeUserID"));
			reviewLikes.add(reviewlike);
		}
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return reviewLikes.size();
	}
	
	public int delete(ReviewLikesDTO input) throws SQLException {
		String sql = "delete from ReviewLikes where userid = '" + input.getUserID() + "'and bookID = '" + input.getBookID()  + "'and likeUserID = '" + input.getLikeUserID() + "'";
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		int result = stmt.executeUpdate(sql);
		stmt.close();
		pool.releaseConnection(conn);
		System.out.println("like delete result : " + result);
		return result;
	}
}
