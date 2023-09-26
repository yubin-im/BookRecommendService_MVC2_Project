package book.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class UsersDAO {
	private static String url = "jdbc:oracle:thin:@localhost:1521:xe"; // database마다 url은 모두 다르다. 각 DB회사의 홈페이지에서 찾아야 함.
	private static String user = "hr";
	private static String password = "hr";
	private static final String jdbcclass = "oracle.jdbc.driver.OracleDriver";
	private ConnectionPool pool;   
	
	public UsersDAO() {
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
	 * 로그인 메서드
	 * @param input
	 * @return
	 * @throws SQLException
	 */
	public UsersDTO select(UsersDTO input) throws SQLException {
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "select * from Users where userid = '" + input.getUserID() + "'and password = '" + input.getPassword() + "'";
		ResultSet result = stmt.executeQuery(sql);
		
		UsersDTO users = null;
		
		while (result.next()) {
			users  = new UsersDTO(result.getString("userID"), result.getString("password"), result.getString("name"), 
					result.getString("genre1"), result.getString("genre2"));
		}
		
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return users;
	}
	
	/**
	 * 아이디 체크 메서드
	 * @param usersID
	 * @return
	 * @throws SQLException
	 */
	public boolean getSelect(String usersID) throws SQLException {
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "select * from Users where userid = '" + usersID + "'";
		ResultSet result = stmt.executeQuery(sql);
		
		UsersDTO users = null;
		
		while (result.next()) {
			users  = new UsersDTO(result.getString("userID"), result.getString("password"), result.getString("name"), 
					result.getString("genre1"), result.getString("genre2"));
		}
		
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		
		if(users == null) {
			return true;
		}
		else {
			return false;
		}
	}
	
	/**
	 * 회원가입 메서드
	 * @param input
	 * @return
	 * @throws SQLException
	 */
	public int insert(UsersDTO input) throws SQLException {
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "insert into Users(userID, password, name, genre1, genre2)\r\n" + 
				"	values( "
				+ "'"+input.getUserID()+"',"
				+ "'"+input.getPassword()+"', "
				+ "'"+input.getName()+"',"
				+ "'"+input.getGenre1()+"',"
				+ "'"+input.getGenre2()+"')";
		int result = stmt.executeUpdate(sql);
		
		stmt.close();
		pool.releaseConnection(conn);
		return result;
	}
	
	/**
	 * 회원 탈퇴 메서드
	 * @param input
	 * @return
	 * @throws SQLException
	 */
	public int delete(String input) throws SQLException {
		String sql = "delete from users where userID  = '" + input +  "'";
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		int result = stmt.executeUpdate(sql);
		
		stmt.close();
		pool.releaseConnection(conn);
		return result;
	}
	
	/**
	 * 회원 정보 업데이트
	 * @param input
	 * @return
	 * @throws SQLException
	 */
	public int update(UsersDTO input) throws SQLException {
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		 String sql = "UPDATE users SET " +
                 "name = '" + input.getName() + "', " +
                 "password = '" + input.getPassword() + "', " +
                 "genre1 = '" + input.getGenre1() + "', " +
                 "genre2 = '" + input.getGenre2() + "' " +
                 "WHERE userid = '" + input.getUserID() + "'";
		 System.out.println(sql);
		 int result = stmt.executeUpdate(sql);
		 
		 stmt.close();
		 pool.releaseConnection(conn);
		 return result;
	}

}
