package book.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

public class BooksDAO {
	private static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private static String user = "hr";
	private static String password = "hr";
	private static final String jdbcclass = "oracle.jdbc.OracleDriver";
	private ConnectionPool pool;

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
	
	/**
	 * 전체 도서 목록 출력 메서드
	 * @return
	 * @throws SQLException
	 */
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
	
	/**
	 * 도서 상세 출력 메서드
	 * @param books
	 * @return
	 * @throws SQLException
	 */
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

	/**
	 * 사용자가 선택한 장르에 맞는 추천도서 데이터베이스에서 arraylist로 만드는 함수
	 * @param genre1
	 * @param genre2
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<BooksDTO> selectRecommBook(String genre1, String genre2) throws SQLException{ 
		String sql = "SELECT * FROM books WHERE genre IN ('" + genre1 + "', '" + genre2 + "') ORDER BY TO_NUMBER(bookid)";
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
	
	/**
	 * 찜 한 도서목록 출력 메서드
	 * @param favoriteList
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<BooksDTO> selectFavoriteBook(ArrayList<FavoriteDTO> favoriteList) throws SQLException{
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		
		ArrayList<BooksDTO> books = new ArrayList<BooksDTO>()
				;
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
	
	/**
	 * 통합 검색(도서 제목, 출판사, 저자, 장르) 메서드
	 * @param searchText
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<BooksDTO> selectSearch(String searchText) throws SQLException {
		String sql = "select * from books where title like '%" + searchText + "%' or authors like '%" + searchText
				+ "%' or publisher like '%" + searchText + "%' or genre like '%" + searchText + "%'";
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(sql);

		BooksDTO book = null;
		ArrayList<BooksDTO> books = new ArrayList<BooksDTO>();

		while (result.next()) {
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
	
	/**
	 * 도서 전체 목록 페이징 함수
	 * @param request
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<BooksDTO> selectAllPaging(HttpServletRequest request) throws SQLException {
		int pg = 1;
		String strPg = request.getParameter("pg");
		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}

		int rowSize = 20;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;
		int total = 0; // 총 게시물수

		String sql = "select count(*) from books";
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(sql);

		if (result.next()) {
			total = result.getInt(1);
		}

		System.out.println("시작 : " + start + " 끝:" + end);
		System.out.println("글의 수 : " + total);

		int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수
		// int totalPage = total/rowSize + (total%rowSize==0?0:1);
		System.out.println("페이지수 : " + allPage);

		int block = 10; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>
		int fromPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작
		// ((1-1)/10*10)
		int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝
		if (toPage > allPage) { // 예) 20>17
			toPage = allPage;
		}

		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);

		BooksDTO book = null;
		ArrayList<BooksDTO> books = new ArrayList<BooksDTO>();

		sql = "select * from " + "(select A.*, ROWNUM r from " + "(select * from books order by TO_NUMBER(bookid)) A) "
				+ "where r >= " + start + " and r <= " + end;
		result = stmt.executeQuery(sql);

		while (result.next()) {
			book = new BooksDTO(result.getString("BOOKID"), result.getString("TITLE"), result.getString("PUBLISHER"),
					result.getString("AUTHORS"), result.getString("GENRE"), result.getDate("PUBLICATIONDATE"),
					result.getInt("PRICE"), result.getInt("VIEWS"));
			books.add(book);
		}

		request.setAttribute("books", books);
		request.setAttribute("pg", pg);
		request.setAttribute("allPage", allPage);
		request.setAttribute("block", block);
		request.setAttribute("fromPage", fromPage);
		request.setAttribute("toPage", toPage);

		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return books;
	}
	   
	/**
	 * 추천 도서 목록 페이징 메서드
	 * @param request
	 * @param genre1
	 * @param genre2
	 * @return
	 * @throws SQLException
	 */
	 public ArrayList<BooksDTO> selectRecommBookPaging(HttpServletRequest request, String genre1, String genre2)
	         throws SQLException {
	      int pg = 1;
	      String strPg = request.getParameter("pg");
	      if (strPg != null) {
	         pg = Integer.parseInt(strPg);
	      }

	      int rowSize = 20;
	      int start = (pg * rowSize) - (rowSize - 1);
	      int end = pg * rowSize;
	      int total = 0; // 총 추천 게시물수

	      String sql = "select count(*) from books where genre in ('" + genre1 + "', '" + genre2 + "')";
	      Connection conn = pool.getConnection();
	      Statement stmt = conn.createStatement();
	      ResultSet result = stmt.executeQuery(sql);

	      if (result.next()) {
	         total = result.getInt(1);
	      }

	      System.out.println("시작 : " + start + " 끝:" + end);
	      System.out.println("글의 수 : " + total);

	      int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수
	      // int totalPage = total/rowSize + (total%rowSize==0?0:1);
	      System.out.println("페이지수 : " + allPage);

	      int block = 10; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>
	      int fromPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작
	      // ((1-1)/10*10)
	      int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝
	      if (toPage > allPage) { // 예) 20>17
	         toPage = allPage;
	      }

	      HashMap map = new HashMap();
	      map.put("start", start);
	      map.put("end", end);

	      BooksDTO book = null;
	      ArrayList<BooksDTO> books = new ArrayList<BooksDTO>();

	      sql = "select * from " + "(select A.*, ROWNUM r from " + "(select * from books where genre IN ('" + genre1
	            + "', '" + genre2 + "') order by title) A) " + "where r >= " + start + " and r <= " + end;
	      result = stmt.executeQuery(sql);

	      while (result.next()) {
	         book = new BooksDTO(result.getString("BOOKID"), result.getString("TITLE"), result.getString("PUBLISHER"),
	               result.getString("AUTHORS"), result.getString("GENRE"), result.getDate("PUBLICATIONDATE"),
	               result.getInt("PRICE"), result.getInt("VIEWS"));
	         books.add(book);
	      }

	      request.setAttribute("books", books);
	      request.setAttribute("pg", pg);
	      request.setAttribute("allPage", allPage);
	      request.setAttribute("block", block);
	      request.setAttribute("fromPage", fromPage);
	      request.setAttribute("toPage", toPage);

	      result.close();
	      stmt.close();
	      pool.releaseConnection(conn);
	      return books;
	   }
	
	/**
	 * 해당 책의 평균 별점 계산 메서드
	 * @param bookid
	 * @return
	 * @throws SQLException
	 */
	public double avgRank(String bookid) throws SQLException {
		double avgRank = 0;
	    String sql = "SELECT ROUND(AVG(rank), 2) FROM reviews WHERE bookid = '" + bookid + "'";
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(sql);
		
		if (result.next()) {
			avgRank = result.getDouble(1);
		}

		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return avgRank;
	}
	
	/**
	 * 해당 책의 찜한 사람들의 수 계산 메서드
	 * @param bookid
	 * @return
	 * @throws SQLException
	 */
	public int favoriteCount(String bookid) throws SQLException {
		int favoriteCount = 0;
		String sql = "select count(*) from favorites where bookid = '" + bookid + "'";
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(sql);
		
		if (result.next()) {
			favoriteCount = result.getInt(1);
		}

		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return favoriteCount;
	}
	
	/**
	 * 평균 별점이 가장 높은 도서의 제목 가져오기, 리뷰 수가 평균 이상인 도서 중에서 가장 높은 평균 평점과 가장 많은 리뷰를 가진 도서를 선택
	 * @return
	 * @throws SQLException
	 */
	public String bestRankBook() throws SQLException {
		String bookid = "";
		String title = "";
		String sql = "SELECT bookid " +
	             "FROM ( " +
	             "    SELECT r.bookid, AVG(r.rank) AS average_rank, COUNT(*) AS review_count " +
	             "    FROM reviews r " +
	             "    GROUP BY r.bookid " +
	             "    HAVING COUNT(*) >= (SELECT AVG(review_count) FROM (SELECT COUNT(*) AS review_count FROM reviews GROUP BY bookid)) " +
	             "    ORDER BY average_rank DESC, review_count DESC " +
	             ") " +
	             "WHERE ROWNUM = 1";
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(sql);
		
		if (result.next()) {
			bookid = result.getString(1);
		}
		
		sql = "select title from books where bookid = '" + bookid + "'";
		result = stmt.executeQuery(sql);
		
		if (result.next()) {
			title = result.getString(1);
		}
		
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return title;
	}
	/**
	 * 찜한 개수가 가장 많은 도서의 title
	 * @return
	 * @throws SQLException
	 */
	public String bestFavorBook() throws SQLException {
		String bookid = "";
		String title = "";
		String sql = "SELECT bookid " +
                "FROM (SELECT bookid " +
                "      FROM favorites " +
                "      GROUP BY bookid " +
                "      ORDER BY COUNT(userid) DESC) " +
                "WHERE ROWNUM = 1";
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(sql);
		
		if (result.next()) {
			bookid = result.getString(1);
		}
		
		sql = "select title from books where bookid = '" + bookid + "'";
		result = stmt.executeQuery(sql);
		
		if (result.next()) {
			title = result.getString(1);
		}
		
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return title;
	}
	
	/***
	 * 평균 별점이 가장 높은 도서의 id 가져오기, 리뷰 수가 평균 이상인 도서 중에서 가장 높은 평균 평점과 가장 많은 리뷰를 가진 도서를 선택
	 * @return
	 * @throws SQLException
	 */
	public String bestRankBookID() throws SQLException {
		String bookid = "";
		String sql = "SELECT bookid " +
	             "FROM ( " +
	             "    SELECT r.bookid, AVG(r.rank) AS average_rank, COUNT(*) AS review_count " +
	             "    FROM reviews r " +
	             "    GROUP BY r.bookid " +
	             "    HAVING COUNT(*) >= (SELECT AVG(review_count) FROM (SELECT COUNT(*) AS review_count FROM reviews GROUP BY bookid)) " +
	             "    ORDER BY average_rank DESC, review_count DESC " +
	             ") " +
	             "WHERE ROWNUM = 1";
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(sql);
		
		if (result.next()) {
			bookid = result.getString(1);
		}
		
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return bookid;
	}
	/**
	 * 찜한 개수가 가장 많은 도서의 bookid
	 * @return
	 * @throws SQLException
	 */
	public String bestFavorBookID() throws SQLException {
		String bookid = "";
		String sql = "SELECT bookid " +
                "FROM (SELECT bookid " +
                "      FROM favorites " +
                "      GROUP BY bookid " +
                "      ORDER BY COUNT(userid) DESC) " +
                "WHERE ROWNUM = 1";
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(sql);
		
		if (result.next()) {
			bookid = result.getString(1);
		}
		
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return bookid;
	}
	
	/***
	 * 각 장르별 도서의 수 리턴
	 * @return
	 * @throws SQLException
	 */
	public Map<String, Integer> getGenreCounts() throws SQLException {
        String sql = "SELECT genre, COUNT(*) as genre_count FROM books GROUP BY genre";
        Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(sql);
        
        Map<String, Integer> genreCounts = new HashMap<>();
        
        while (result.next()) {
            String genre = result.getString("genre");
            int count = result.getInt("genre_count");
            genreCounts.put(genre, count);
        }
        
        result.close();
		stmt.close();
		pool.releaseConnection(conn);
        return genreCounts;
    }
	
	/***
	 * 연도 별 출간 도서 수 리턴
	 * @return
	 * @throws SQLException
	 */
	public Map<String, Integer> getYearCounts() throws SQLException {
        String sql = "SELECT TO_CHAR(publicationdate, 'YYYY') AS publication_year, COUNT(*) AS publicationdate_count FROM books GROUP BY TO_CHAR(publicationdate, 'YYYY') ORDER BY publication_year ASC";
        Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(sql);
		
        Map<String, Integer> getYearCounts = new TreeMap();
        while (result.next()) {
            String publicationDate = result.getString("publication_year");
            int count = result.getInt("publicationdate_count");
            getYearCounts.put(publicationDate, count);
        }
        result.close();
		stmt.close();
		pool.releaseConnection(conn);
        return getYearCounts;
    }
	
	   /***
	    * 평균 별점이 가장 높은 도서  출판사 리턴
	    * @return
	    * @throws SQLException
	    */
	   public String bestRankBookPub() throws SQLException {
	      String bookid = "";
	      String publisher = "";
	      String sql = "SELECT bookid " +
	                "FROM ( " +
	                "    SELECT r.bookid, AVG(r.rank) AS average_rank, COUNT(*) AS review_count " +
	                "    FROM reviews r " +
	                "    GROUP BY r.bookid " +
	                "    HAVING COUNT(*) >= (SELECT AVG(review_count) FROM (SELECT COUNT(*) AS review_count FROM reviews GROUP BY bookid)) " +
	                "    ORDER BY average_rank DESC, review_count DESC " +
	                ") " +
	                "WHERE ROWNUM = 1";
	      Connection conn = pool.getConnection();
	      Statement stmt = conn.createStatement();
	      ResultSet result = stmt.executeQuery(sql);
	      
	      if (result.next()) {
	         bookid = result.getString(1);
	      }
	      
	      sql = "select publisher from books where bookid = '" + bookid + "'";
	      result = stmt.executeQuery(sql);
	      
	      if (result.next()) {
	         publisher = result.getString(1);
	      }
	      
	      result.close();
	      stmt.close();
	      pool.releaseConnection(conn);
	      return publisher;
	   }
	   
	   /***
	    * 평균 별점이 가장 높은 도서  저자 리턴
	    * @return
	    * @throws SQLException
	    */
	   public String bestRankBookAut() throws SQLException {
	      String bookid = "";
	      String authors = "";
	      String sql = "SELECT bookid " +
	                "FROM ( " +
	                "    SELECT r.bookid, AVG(r.rank) AS average_rank, COUNT(*) AS review_count " +
	                "    FROM reviews r " +
	                "    GROUP BY r.bookid " +
	                "    HAVING COUNT(*) >= (SELECT AVG(review_count) FROM (SELECT COUNT(*) AS review_count FROM reviews GROUP BY bookid)) " +
	                "    ORDER BY average_rank DESC, review_count DESC " +
	                ") " +
	                "WHERE ROWNUM = 1";
	      Connection conn = pool.getConnection();
	      Statement stmt = conn.createStatement();
	      ResultSet result = stmt.executeQuery(sql);
	      
	      if (result.next()) {
	         bookid = result.getString(1);
	      }
	      
	      sql = "select authors from books where bookid = '" + bookid + "'";
	      result = stmt.executeQuery(sql);
	      
	      if (result.next()) {
	         authors = result.getString(1);
	      }
	      
	      result.close();
	      stmt.close();
	      pool.releaseConnection(conn);
	      return authors;
	   }
	   
	   /***
	    * 찜한 유저가 가장 많은 도서의 출판사 리턴
	    * @return
	    * @throws SQLException
	    */
	   public String bestFavorBookPub() throws SQLException {
	      String bookid = "";
	      String publisher = "";
	      String sql = "SELECT bookid " +
	                "FROM (SELECT bookid " +
	                "      FROM favorites " +
	                "      GROUP BY bookid " +
	                "      ORDER BY COUNT(userid) DESC) " +
	                "WHERE ROWNUM = 1";
	      Connection conn = pool.getConnection();
	      Statement stmt = conn.createStatement();
	      ResultSet result = stmt.executeQuery(sql);
	      
	      if (result.next()) {
	         bookid = result.getString(1);
	      }
	      
	      sql = "select publisher from books where bookid = '" + bookid + "'";
	      result = stmt.executeQuery(sql);
	      
	      if (result.next()) {
	         publisher = result.getString(1);
	      }
	      
	      result.close();
	      stmt.close();
	      pool.releaseConnection(conn);
	      return publisher;
	   }
	   
	   /***
	    * 찜한 유저가 가장 많은 도서의 저자 리턴
	    * @return
	    * @throws SQLException
	    */
	   public String bestFavorBookAut() throws SQLException {
	      String bookid = "";
	      String authors = "";
	      String sql = "SELECT bookid " +
	                "FROM (SELECT bookid " +
	                "      FROM favorites " +
	                "      GROUP BY bookid " +
	                "      ORDER BY COUNT(userid) DESC) " +
	                "WHERE ROWNUM = 1";
	      Connection conn = pool.getConnection();
	      Statement stmt = conn.createStatement();
	      ResultSet result = stmt.executeQuery(sql);
	      
	      if (result.next()) {
	         bookid = result.getString(1);
	      }
	      
	      sql = "select authors from books where bookid = '" + bookid + "'";
	      result = stmt.executeQuery(sql);
	      
	      if (result.next()) {
	         authors = result.getString(1);
	      }
	      
	      result.close();
	      stmt.close();
	      pool.releaseConnection(conn);
	      return authors;
	   }
}
