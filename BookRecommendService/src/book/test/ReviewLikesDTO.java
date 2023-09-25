package book.test;

public class ReviewLikesDTO {
	private String userID;
	private String bookID;
	private String likeUserID;
	
	public ReviewLikesDTO() {
		
	}

	public ReviewLikesDTO(String userID, String bookID, String likeUserID) {
		super();
		this.userID = userID;
		this.bookID = bookID;
		this.likeUserID = likeUserID;
	}
	
	public ReviewLikesDTO(String likeUserID) {
		this.likeUserID = likeUserID;
	}

	@Override
	public String toString() {
		return "ReviewLikesDTO [userID=" + userID + ", bookID=" + bookID + ", likeUserID=" + likeUserID + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((likeUserID == null) ? 0 : likeUserID.hashCode());
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
		ReviewLikesDTO other = (ReviewLikesDTO) obj;
		if (likeUserID == null) {
			if (other.likeUserID != null)
				return false;
		} else if (!likeUserID.equals(other.likeUserID))
			return false;
		return true;
	}

	
	public String getUserID() {
		return userID;
	}

	public String getBookID() {
		return bookID;
	}

	public String getLikeUserID() {
		return likeUserID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public void setBookID(String bookID) {
		this.bookID = bookID;
	}

	public void setLikeUserID(String likeUserID) {
		this.likeUserID = likeUserID;
	}
	
}

