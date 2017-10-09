
public class Rating{
	private int rating;
	private int itemId;
	private int userId;
	public Rating(int rating, int itemId, int userId){
		this.rating = rating;
		this.itemId = itemId;
		this.userId = userId;
	}
	public int userId(){
		return userId;
	}
	public int getRating(){
		return rating;
	}
	public int getItemId(){
		return itemId;
	}
	
	
}
