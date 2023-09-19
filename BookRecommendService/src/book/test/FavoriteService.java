package book.test;

import java.sql.SQLException;

public class FavoriteService {
	private String result;
	private FavoriteDTO dto;
	private FavoriteDAO dao;
	
	public FavoriteService() {
		dao = new FavoriteDAO();
	}
	
	public String insert(FavoriteDTO dto) {
		boolean result2 = false;
		try {
			result2 = dao.select(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//int 결과값에 따라 view에 보여줄 실제 문자열 데이터를 만들어 return.
		if (result2) {
			this.result = "찜이 완료되었습니다";
		} else {
			this.result = "찜에서 삭제되었습니다";
		}
		System.out.println("여기는 service insert " + result2);
		return this.result;
	}
}
