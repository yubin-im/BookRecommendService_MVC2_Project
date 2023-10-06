package book.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class FavoriteDAO {
	private static String url = "jdbc:oracle:thin:@localhost:1521:xe"; // database마다 url은 모두 다르다. 각 DB회사의 홈페이지에서 찾아야 함.
	private static String user = "hr";
	private static String password = "hr";
	private static final String jdbcclass = "oracle.jdbc.driver.OracleDriver";
	private ConnectionPool pool;  
	
	public FavoriteDAO() {
		try {
			Class.forName(jdbcclass);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			pool = ConnectionPool.getInstance(url, user, password, 3, 5, true, 500);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 유저가 찜한 도서 목록 출력 메서드
	 * @param input
	 * @return
	 * @throws SQLException
	 */
	public boolean select(FavoriteDTO input) throws SQLException {
		boolean bool;
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "select * from favorites where userid = '" + input.getUserID() + "'and bookID = '" + input.getBookID() + "'";
		ResultSet result = stmt.executeQuery(sql);
		
		FavoriteDTO favorite = null;
		
		while (result.next()) {
			favorite  = new FavoriteDTO(result.getString("userID"), result.getString("bookId"));
		}
		if(favorite == null) {
			insert(input);
			bool = true;
			System.out.println("ture : " + result.toString());
		}
		else {
			delete(input);
			bool = false;
			System.out.println("false : " +  result.toString());
		}
		
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return bool;
	}
	
	/**
	 * 찜 여부 확인 메서드
	 * @param input
	 * @return
	 * @throws SQLException
	 */
	public boolean check(FavoriteDTO input) throws SQLException {
		boolean bool;
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "select * from favorites where userid = '" + input.getUserID() + "'and bookID = '" + input.getBookID() + "'";
		ResultSet result = stmt.executeQuery(sql);
		
		FavoriteDTO favorite = null;
		
		while (result.next()) {
			favorite  = new FavoriteDTO(result.getString("userID"), result.getString("bookId"));
		}
		if(favorite == null) {
			bool = false;
		}
		else {
			bool = true;
		}
		
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return bool;
	}
	
	/**
	 * 찜 한 도서 삭제 메서드
	 * @param input
	 * @throws SQLException
	 */
	private void delete(FavoriteDTO input) throws SQLException {
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "delete from favorites where bookid='" + input.getBookID() + "' and userID = '" + input.getUserID() + "'";
		int result = stmt.executeUpdate(sql);
		System.out.println(sql);
		
		stmt.close();
		pool.releaseConnection(conn);
	}
	
	/**
	 * 도서 찜 메서드
	 * @param input
	 * @return
	 * @throws SQLException
	 */
	public int insert(FavoriteDTO input) throws SQLException {
		int result = 0;
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "insert into favorites(userID, bookID)\r\n" + 
				"	values( "
				+ "'"+input.getUserID()+"',"
				+ "'"+input.getBookID()+"')";
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		pool.releaseConnection(conn);
		return result;
	}
	
	/**
	 * 유저가 찜한 도서 목록 출력 메서드
	 * @param UserID
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<FavoriteDTO> selectAll(String UserID) throws SQLException{
		ArrayList<FavoriteDTO> favorites = new ArrayList<FavoriteDTO>();
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "SELECT * FROM favorites WHERE userid = '" + UserID + "' order by to_number(bookid)";
		ResultSet result = stmt.executeQuery(sql);
		
		FavoriteDTO favorite = null;
		
		while(result.next()) {
			favorite = new FavoriteDTO(result.getString("userID"), result.getString("bookId"));
			favorites.add(favorite);
		}
		
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return favorites;
	}
}
