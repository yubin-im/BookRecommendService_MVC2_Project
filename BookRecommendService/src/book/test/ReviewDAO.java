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
	
	/**
	 * 리뷰 작성 여부 확인 메서드 
	 * @param input
	 * @return
	 * @throws SQLException
	 */
	public boolean check(ReviewDTO input) throws SQLException {
		String sql = "select * from reviews where userid = '" + input.getUserID() + "'and bookID = '" + input.getBookID() + "'";
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(sql);
		
		ReviewDTO review = null;
		
		while(result.next()) {
			review = new ReviewDTO(result.getString("reviewContent"), result.getDate("reviewDate"), result.getInt("rank"),
					result.getString("userID"), result.getString("bookID"), result.getInt("likes"));
		}
		
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		
		if(review == null) {
			return true;
			
		}
		else {
			return false;
		}
	}
	
	/**
	 * 리뷰 추가
	 * @param input
	 * @return
	 * @throws SQLException
	 */
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
		
		int result = stmt.executeUpdate(sql);
		stmt.close();
		pool.releaseConnection(conn);
		return result;
	}
	
	/**
	 * 사용자의 리뷰 전체 출력
	 * @param input
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<ReviewDTO> selectAll(String input) throws SQLException {
		String sql = "select * from reviews where userid = '" + input + "'";
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(sql);
		
		ArrayList<ReviewDTO> reviews = new ArrayList();
		ReviewDTO review = null;
		
		while(result.next()) {
			review = new ReviewDTO(result.getString("reviewContent"), result.getDate("reviewDate"), result.getInt("rank"),
					result.getString("userID"), result.getString("bookID"), result.getInt("likes"));
			reviews.add(review);
		}
		
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return reviews;
	}
	
	/**
	 * 책 상세의 리뷰 전체 출력
	 * @param input
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<ReviewDTO> selectAllBook(String input) throws SQLException {
		String sql = "select * from reviews where bookid = '" + input + "'";
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		
		ResultSet result = stmt.executeQuery(sql);
		ArrayList<ReviewDTO> reviews = new ArrayList();
		ReviewDTO review = null;
		
		while(result.next()) {
			review = new ReviewDTO(result.getString("reviewContent"), result.getDate("reviewDate"), result.getInt("rank"),
					result.getString("userID"), result.getString("bookID"), result.getInt("likes"));
			reviews.add(review);
		}
		
		result.close();
		stmt.close();
		pool.releaseConnection(conn);	
		return reviews;
	}
	
	/**
	 * 리뷰 삭제 메서드
	 * @param input
	 * @return
	 * @throws SQLException
	 */
	public int delete(ReviewDTO input) throws SQLException {
		String sql = "delete from reviews where userID  = '" + input.getUserID() + "' and bookID = '" + input.getBookID() + "'";
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();

		int result = stmt.executeUpdate(sql);
		stmt.close();
		pool.releaseConnection(conn);
		return result;
	}
	
	/**
	 * 리뷰 수정 메서드
	 * @param input
	 * @return
	 * @throws SQLException
	 */
	public int update(ReviewDTO input) throws SQLException {
		String sql =  "update Reviews  set reviewContent="
				+ "'"+input.getReviewContent()+"',"
				+ "rank="
				+ "'"+input.getRank() + "', "
				+"reviewDate="
				+"SYSDATE"
				+ " where userID  = '" + input.getUserID() + "' and bookID = '" + input.getBookID() + "'";
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		int result = stmt.executeUpdate(sql);

		stmt.close();
		pool.releaseConnection(conn);
		return result;
	}
	
	/**
	 * 좋아요 추가 메서드
	 * @param book
	 * @param user
	 * @throws SQLException
	 */
	public void insertLike(String book, String user) throws SQLException {
		String sql = "update reviews set likes = likes + 1 where bookid = '" + book + "' and userid = '" + user + "'"; 
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		
		stmt.close();
		pool.releaseConnection(conn);
	}
	
	/**
	 * 좋아요 취소 메서드
	 * @param book
	 * @param user
	 * @throws SQLException
	 */
	public void deleteLike(String book, String user) throws SQLException {
		String sql = "update reviews set likes = likes - 1 where bookid = '" + book + "' and userid = '" + user + "'"; 
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		System.out.println(stmt.executeUpdate(sql));
		
		stmt.close();
		pool.releaseConnection(conn);
	}
	
	/**
	 * 리뷰 데이터 가져올 때 유저 네임 가져오는 메서드
	 * @param input
	 * @return
	 * @throws SQLException
	 */
	public String userName(String input) throws SQLException {
		 String sql = "SELECT users.name " +
                 "FROM reviews " +
                 "INNER JOIN users ON reviews.userid = users.userid " +
                 "WHERE reviews.userid = '" + input +"'";		
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(sql);
		
		String userName = null;
		
		while (result.next()) {
		    userName = result.getString("name");
		}
		
		result.close();
		stmt.close();
		pool.releaseConnection(conn);	
		return userName;
	}
	
	/**
	 * 리뷰 데이터 가져올 때 책 제목 가져오는 메서드
	 * @param input
	 * @return
	 * @throws SQLException
	 */
	public String bookTitle(String input) throws SQLException {
		 String sql = "SELECT books.title " +
                "FROM reviews " +
                "INNER JOIN books ON reviews.bookid = books.bookid " +
                "WHERE reviews.bookid = '" + input +"'";		
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(sql);
		
		String title = null;
		
		while (result.next()) {
			title = result.getString("title");
		}
		
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return title;
	}
	
	/**
	 * 리뷰 워드클라우드 생성 데이터 가져오는 메서드
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<ReviewDTO> reviewWordcloud() throws SQLException {
		// 데이터가 너무 많으면 안되서 10행만 가져옴
		String sql = "select * from (select * from reviews where rownum <= 10)";
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(sql);

		ReviewDTO review = null;
		ArrayList<ReviewDTO> reviews = new ArrayList<ReviewDTO>();

		while (result.next()) {
			review = new ReviewDTO(result.getString("reviewcontent"));
			reviews.add(review);
		}

		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return reviews;
	}
}
