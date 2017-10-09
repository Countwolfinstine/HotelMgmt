import java.util.*;
import java.util.Map.*;
public class User {
	private int userId;
	private HashMap<Item, Rating> itemRating;
	
	public User(int userId){
		this.userId = userId;
		itemRating = new HashMap<Item, Rating>();
	}
	public int getUserId(){
		return userId;
	}
	
	public ArrayList<Rating> getAllRatings(){
		ArrayList<Rating> allRatings = new ArrayList<Rating>();
		for(Entry<Item, Rating> entry: itemRating.entrySet()){
			allRatings.add(entry.getValue());
		}
		return allRatings;
	}
	
	public Rating getItemRating(int itemId){
		for(Entry<Item, Rating> entry: itemRating.entrySet()){
			Item i = entry.getKey();
			if(i.getItemId()==itemId){
				return entry.getValue();
			}
		}
		return new Rating(0, -1);
	}
	
	
}
