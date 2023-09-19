package book.test;

import java.util.Date;
import java.util.Objects;

public class BooksDTO {
	private String bookID;
	private String title;
	private String publisher;
	private String authors;
	private String genre;
	private Date publicationDate;
	private int price;
	private int views;
		
	public BooksDTO(String bookID, String title, String publisher, String authors, String genre, Date publicationDate,
			int price, int views) {
		super();
		this.bookID = bookID;
		this.title = title;
		this.publisher = publisher;
		this.authors = authors;
		this.genre = genre;
		this.publicationDate = publicationDate;
		this.price = price;
		this.views = views;
	}
	
	public BooksDTO(String title, String publisher, String authors, String genre, Date publicationDate,
			int price, int views) {
		super();
		this.title = title;
		this.publisher = publisher;
		this.authors = authors;
		this.genre = genre;
		this.publicationDate = publicationDate;
		this.price = price;
		this.views = views;
	}
	
	public BooksDTO() {
		
	}

	
	public String getBookID() {
		return bookID;
	}

	public void setBookID(String bookID) {
		this.bookID = bookID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getAuthors() {
		return authors;
	}

	public void setAuthors(String authors) {
		this.authors = authors;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public Date getPublicationDate() {
		return publicationDate;
	}

	public void setPublicationDate(Date publicationDate) {
		this.publicationDate = publicationDate;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public int hashCode() {
		return Objects.hash(authors, bookID, genre, price, publicationDate, publisher, title, views);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BooksDTO other = (BooksDTO) obj;
		return Objects.equals(authors, other.authors) && Objects.equals(bookID, other.bookID)
				&& Objects.equals(genre, other.genre) && price == other.price
				&& Objects.equals(publicationDate, other.publicationDate) && Objects.equals(publisher, other.publisher)
				&& Objects.equals(title, other.title) && views == other.views;
	}

	@Override
	public String toString() {
		return "BooksDTO [bookID=" + bookID + ", title=" + title + ", publisher=" + publisher + ", authors=" + authors
				+ ", genre=" + genre + ", publicationDate=" + publicationDate + ", views=" + views + ", price=" + price
				+ "]";
	}
	
	
}
