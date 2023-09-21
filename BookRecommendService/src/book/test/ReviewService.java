package book.test;

import java.sql.SQLException;

public class ReviewService {
	private String result;
	private ReviewDTO dto;
	private ReviewDAO dao;
	
	public ReviewService() {
		dao = new ReviewDAO();
	}
	
	public String insert(ReviewDTO dto) {
		String msg = null;
		try {
			if(dao.check(dto)) {
				msg = "리뷰가 작성되었습니다.";
			}
			else {
				msg = null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("여기는 service insert " + msg);
		return msg;
	}
}
