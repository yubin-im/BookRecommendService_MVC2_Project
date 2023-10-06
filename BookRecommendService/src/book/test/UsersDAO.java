package book.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
			users  = new UsersDTO(result.getString("userID"), result.getInt("password"), result.getString("name"), 
					result.getString("genre1"), result.getString("genre2"), result.getString("email"));
		}
		System.out.println("userdao의 select password 해쉬 코드 값 확인 : " + users.getPassword());
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
			users  = new UsersDTO(result.getString("userID"), result.getInt("password"), result.getString("name"), 
					result.getString("genre1"), result.getString("genre2"), result.getString("email"));
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
		String sql = "insert into Users(userID, password, name, genre1, genre2, email)\r\n" + 
				"	values( "
				+ "'"+input.getUserID()+"',"
				+ ""+input.getPassword()+", "
				+ "'"+input.getName()+"',"
				+ "'"+input.getGenre1()+"',"
				+ "'"+input.getGenre2() +"',"
				+ "'"+input.getEmail() + "')";
		System.out.println("userdao insert sql : " + sql);
		
		int result = stmt.executeUpdate(sql);
		System.out.println("userdao insert result 확인 : " + result);
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
	
	/**
	 * 회원 비밀번호 변경
	 * @param input
	 * @return
	 * @throws SQLException
	 */
	public String updatePassword(String id, int pwd) throws SQLException {
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		 String sql = "UPDATE users SET " +
                 "password = '" + pwd + "' " +
                 "WHERE userid = '" + id + "'";
		 System.out.println("userDAO updatePassword 쿼리문 : " + sql);
		 int result = stmt.executeUpdate(sql);
		 String msg = null;
		 if(result == 0) {
			 msg = "비밀번호 변경에 실패했습니다.";
		 }
		 else {
			 msg = "비밀번호 변경에 성공했습니다.";
		 }
		 stmt.close();
		 pool.releaseConnection(conn);
		 return msg;
	}
	/**
	 * 회원정보 찾기에 사용되는 이메일 체크 함수
	 * @return
	 * @throws SQLException 
	 */
	public boolean checkEmail(String input) throws SQLException {
		boolean bool = true;
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "select * from Users where email = '" + input + "'";
		ResultSet result = stmt.executeQuery(sql);
		if(result.next()) {
			bool = true;
		}
		else {
			bool = false;
		}
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return bool;
	}
	/**
	 * 회원가입 시 아이디 중복체크
	 * @param input
	 * @return
	 * @throws SQLException
	 */
	public boolean checkID(String input) throws SQLException {
		boolean bool = true;
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "select * from Users where userID = '" + input + "'";
		ResultSet result = stmt.executeQuery(sql);
		if(result.next()) {
			bool = true;
		}
		else {
			bool = false;
		}
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return bool;
	}
	/**
	 * 이메일을 받아 옴 비밀번호 찾기에 활용
	 * @param input
	 * @return
	 * @throws SQLException
	 */
	public String getEmail(String input) throws SQLException {
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "select * from Users where userID = '" + input + "'";
		ResultSet result = stmt.executeQuery(sql);
		UsersDTO users = null;
		while (result.next()) {
			users  = new UsersDTO(result.getString("userID"), result.getInt("password"), result.getString("name"), 
					result.getString("genre1"), result.getString("genre2"), result.getString("email"));
		}
		String email = users.getEmail();
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return email;
	}
	/**
	 * 아이디 찾기에 활용
	 * @param input
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<String> getUserID(String input) throws SQLException{
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "select userID from Users where email = '" + input + "'";
		ResultSet result = stmt.executeQuery(sql);
		System.out.println(result);
		ArrayList<String> userID = new ArrayList();
		while (result.next()) {
			userID.add(new String(result.getString("userID")));
			System.out.println(userID);
		}
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return userID;
	}

}
