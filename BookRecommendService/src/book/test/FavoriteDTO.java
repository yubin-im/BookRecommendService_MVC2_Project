package book.test;

public class FavoriteDTO {
	private String userID;
	private String bookID;
	
	public FavoriteDTO() {
		
	}

	public FavoriteDTO(String userID, String bookID) {
		super();
		this.userID = userID;
		this.bookID = bookID;
	}

	public String getUserID() {
		return userID;
	}

	public String getBookID() {
		return bookID;
	}
	

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public void setBookID(String bookID) {
		this.bookID = bookID;
	}

	@Override
	public String toString() {
		return "FavoriteDTO [userID=" + userID + ", bookID=" + bookID + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bookID == null) ? 0 : bookID.hashCode());
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
		FavoriteDTO other = (FavoriteDTO) obj;
		if (bookID == null) {
			if (other.bookID != null)
				return false;
		} else if (!bookID.equals(other.bookID))
			return false;
		if (userID == null) {
			if (other.userID != null)
				return false;
		} else if (!userID.equals(other.userID))
			return false;
		return true;
	}
	
}
