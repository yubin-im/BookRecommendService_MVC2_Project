package book.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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
		String sql = "select * from books";
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
		
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return books;
	}
	
	public ArrayList<BooksDTO> selectFavoriteBook(ArrayList<FavoriteDTO> favoriteList) throws SQLException{
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		ArrayList<BooksDTO> books = new ArrayList<BooksDTO>();
		for(Object o : favoriteList) {
			FavoriteDTO favor = (FavoriteDTO) o;
			String sql = "select* from books where bookid = '" + favor.getBookID() + "'";
			ResultSet result = stmt.executeQuery(sql);
			BooksDTO book = null;
			while(result.next()) {
				book = new BooksDTO(result.getString("BOOKID"), result.getString("TITLE"), result.getString("PUBLISHER"),
						result.getString("AUTHORS"), result.getString("GENRE"), result.getDate("PUBLICATIONDATE"),
						result.getInt("PRICE"), result.getInt("VIEWS"));
				books.add(book);
			}
			result.close();
		}
		stmt.close();
		pool.releaseConnection(conn);
		return books;
		
	}
	// 통합 검색(도서 제목, 출판사, 저자, 장르) 메서드
	   public ArrayList<BooksDTO> selectSearch(String searchText) throws SQLException {
	      String sql = "select * from books where title like '%" + searchText + 
	            "%' or authors like '%" + searchText + 
	            "%' or publisher like '%" + searchText + 
	            "%' or genre like '%" + searchText + "%'";
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
	      
	      result.close();
	      stmt.close();
	      pool.releaseConnection(conn);
	      return books;
	   }
}
