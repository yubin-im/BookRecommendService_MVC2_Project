package book.test;

import java.sql.SQLException;

public class UsersService {
	private String result;
	private UsersDAO dao;
	private UsersDTO user;
	
	public String getResult() {
		return result;
	}
	public void setDb(UsersDAO dao) {
		this.dao = dao;
		System.out.println("여기는 service setDb" + dao);
	}
	public UsersService() {
		super();
		dao = new UsersDAO();
		System.out.println("여기는 service 생성자" + dao);
	}
	public String insert(UsersDTO dto) {
		int result2 = 0;
		try {
			result2 = dao.insert(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(result2);
		
		//int 결과값에 따라 view에 보여줄 실제 문자열 데이터를 만들어 return.
		if (result2 >= 1) {
			this.result = dto.getName() +" 유저등록이 완료되었습니다.";
		} else {
			this.result = dto.getName() + " 유저등록이 실패하였습니다.";
		}
		System.out.println("여기는 service insert" + result2);
		return this.result;
	}
	public UsersDTO select(UsersDTO users) {
		try {
			user = dao.select(users);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	public String checkID(UsersDTO users) throws SQLException { //아이디를 DB와 비교해서 아이디가 없는 아이디여야 insert실행
		String msg = null;
		dao = new UsersDAO();
		System.out.println("checkID " + users.toString());
		if(dao.getSelect(users.getUserID())){
			insert(users);
			msg = "회원가입이 완료되었습니다.";
			
		}
		else {
			msg=null;
		}
		return msg;
	}
}
