package book.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ReviewDAO {
	private static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private static String user = "hr";
	private static String password = "hr";
	private static final String jdbcclass = "oracle.jdbc.OracleDriver";
	private ConnectionPool pool;
	private BooksDTO books;
	
	public ReviewDAO() {
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
	
	public boolean check(ReviewDTO input) throws SQLException {
		String sql = "select * from reviews where userid = '" + input.getUserID() + "'and bookID = '" + input.getBookID() + "'";
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(sql);

		System.out.println("review의 check의 쿼리문 : " + sql);
		
		ReviewDTO review = null;
		
		while(result.next()) {
			review = new ReviewDTO(result.getString("reviewContent"), result.getDate("reviewDate"), result.getInt("rank"),
					result.getString("userID"), result.getString("bookID"), result.getInt("likes"));
		}
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		if(review == null) {
			System.out.println("review의 check : " + true);
			return true;
			
		}
		else {
			System.out.println("review의 check : " + false);
			return false;
		}
		
	}
	
	public int insert(ReviewDTO input) throws SQLException {
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "insert into reviews(userID, bookID, rank, reviewContent, reviewDate)\r\n" + 
				"	values( "
				+ "'"+input.getUserID()+"',"
				+ "'"+input.getBookID()+"', "
				+ "'"+input.getRank()+"',"
				+ "'"+input.getReviewContent()+"',"
				+ "SYSDATE"+")";
		System.out.println("review insert : " + sql);
		int result = stmt.executeUpdate(sql);
		stmt.close();
		pool.releaseConnection(conn);
		return result;
	}
	
	public ArrayList<ReviewDTO> selectAll(String input) throws SQLException {
		String sql = "select * from reviews where userid = '" + input + "'";
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		System.out.println("review selectAll " + sql);
		ResultSet result = stmt.executeQuery(sql);
		ArrayList<ReviewDTO> reviews = new ArrayList();
		ReviewDTO review = null;
		while(result.next()) {
			review = new ReviewDTO(result.getString("reviewContent"), result.getDate("reviewDate"), result.getInt("rank"),
					result.getString("userID"), result.getString("bookID"), result.getInt("likes"));
			reviews.add(review);
			System.out.println("review selectAll " + review);
		}
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return reviews;
	}
	
	public ArrayList<ReviewDTO> selectAllBook(String input) throws SQLException {
		String sql = "select * from reviews where bookid = '" + input + "'";
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		System.out.println("review selectAll " + sql);
		ResultSet result = stmt.executeQuery(sql);
		ArrayList<ReviewDTO> reviews = new ArrayList();
		ReviewDTO review = null;
		while(result.next()) {
			review = new ReviewDTO(result.getString("reviewContent"), result.getDate("reviewDate"), result.getInt("rank"),
					result.getString("userID"), result.getString("bookID"), result.getInt("likes"));
			reviews.add(review);
			System.out.println("review selectAll " + review);
		}
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return reviews;
	}
}
