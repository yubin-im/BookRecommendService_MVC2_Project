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
		System.out.println(book);
		
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return books;
	}


}
