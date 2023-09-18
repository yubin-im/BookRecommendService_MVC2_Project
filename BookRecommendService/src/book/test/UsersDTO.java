package book.test;

public class UsersDTO {
	private String userID;
	private String password;
	private String name;
	private String genre;
	
	public UsersDTO(String userID, String password, String name, String genre) {
		super();
		this.userID = userID;
		this.password = password;
		this.name = name;
		this.genre = genre;
	}
	public UsersDTO(String userID, String password) {
		super();
		this.userID = userID;
		this.password = password;
	}
	public UsersDTO() {
		
	}

	public String getUserID() {
		return userID;
	}

	public String getPassword() {
		return password;
	}

	public String getName() {
		return name;
	}

	public String getGenre() {
		return genre;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	@Override
	public String toString() {
		return "UsersDTO [userID=" + userID + ", password=" + password + ", name=" + name + ", genre=" + genre + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((userID == null) ? 0 : userID.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UsersDTO other = (UsersDTO) obj;
		if (userID == null) {
			if (other.userID != null)
				return false;
		} else if (!userID.equals(other.userID))
			return false;
		return true;
	}

	
	
	
}
