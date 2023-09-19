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
		
		System.out.println(users);
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return users;
	}
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
		
		System.out.println(users);
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
		System.out.println(sql);
		int result = stmt.executeUpdate(sql);
		stmt.close();
		pool.releaseConnection(conn);
		return result;
	}

}
