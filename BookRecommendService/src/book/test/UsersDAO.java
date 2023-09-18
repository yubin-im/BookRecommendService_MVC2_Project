package book.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class UsersDAO {
	private static String url = "jdbc:oracle:thin:@localhost:1521:xe"; // database마다 url은 모두 다르다. 각 DB회사의 홈페이지에서 찾아야 함.
	private static String user = "hr";
	private static String password = "hr";
	private static final String jdbcclass = "oracle.jdbc.OracleDriver";
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
			users  = new UsersDTO(result.getString("userID"), result.getString("password"), result.getString("name"), result.getString("genre"));
		}
		
		System.out.println(users);
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return users;
	}

}
