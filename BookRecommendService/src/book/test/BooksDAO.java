package book.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;

public class BooksDAO {
	private static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private static String user = "hr";
	private static String password = "hr";
	private static final String jdbcclass = "oracle.jdbc.OracleDriver";
	private ConnectionPool pool;
	private BooksDTO books;

	public BooksDAO() {
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
	
	public ArrayList<BooksDTO> selectAll() throws SQLException {
		String sql = "select * from books ORDER BY VIEWS";
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(sql);
		
		BooksDTO book = null;
		ArrayList<BooksDTO> books = new ArrayList<BooksDTO>();
		
		while(result.next()) {
			book = new BooksDTO(result.getString("BOOKID"), result.getString("TITLE"), result.getString("PUBLISHER"),
					result.getString("AUTHORS"), result.getString("GENRE"), result.getDate("PUBLICATIONDATE"),
					result.getInt("PRICE"), result.getInt("VIEWS"));
			books.add(book);
		}
		System.out.println(book);
		
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return books;
	}
	public BooksDTO select(BooksDTO books) throws SQLException {
	      String sql = "select * from books where bookid = '" + books.getBookID() + "'";
	      Connection conn = pool.getConnection(); 
	      Statement stmt = conn.createStatement();
	      ResultSet result = stmt.executeQuery(sql);
	      
	      BooksDTO book = null;
	      
	      while(result.next()) {
	         book = new BooksDTO(result.getString("BOOKID"), result.getString("TITLE"), result.getString("PUBLISHER"),
	               result.getString("AUTHORS"), result.getString("GENRE"), result.getDate("PUBLICATIONDATE"),
	               result.getInt("PRICE"), result.getInt("VIEWS"));
	      }
	      System.out.println(book);
	      
	      result.close();
	      stmt.close();
	      pool.releaseConnection(conn);
	      return book;
	   }
	// 사용자가 선택한 장르에 맞는 추천도서 데이터베이스에서 arraylist로 만드는 함수
	public ArrayList<BooksDTO> selectRecommBook(String genre1, String genre2) throws SQLException{ 
		String sql = "SELECT * FROM books WHERE genre IN ('" + genre1 + "', '" + genre2 + "') ORDER BY VIEWS";
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(sql);
		BooksDTO book = null;
		ArrayList<BooksDTO> books = new ArrayList<BooksDTO>();
		while(result.next()) {
			book = new BooksDTO(result.getString("BOOKID"), result.getString("TITLE"), result.getString("PUBLISHER"),
					result.getString("AUTHORS"), result.getString("GENRE"), result.getDate("PUBLICATIONDATE"),
					result.getInt("PRICE"), result.getInt("VIEWS"));
			books.add(book);
		}
		
		System.out.println("추천도서 함수입니다 : " +books);
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return books;
	}
}
