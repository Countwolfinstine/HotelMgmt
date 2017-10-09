import java.util.*;
public class Dataset {
	
	public ArrayList<User> userArray;
	public ArrayList<Item> itemArray;
	
	public Dataset(){
		// fill up user-Array and Item-array here...
		userArray = new ArrayList<User>();
		itemArray = new ArrayList<Item>();
		
	}
	public ArrayList<User> getUsers(){
		return userArray;
	}
	public ArrayList<Item> getItems(){
		return itemArray;
	}
	public User getUser(int userId){
		for(int i=0;i<userArray.size();i++){
			if(userArray.get(i).getUserId()==userId){
				return userArray.get(i);
			}
		}
		return null;
	}
	
	public int getUserCount(){
		return userArray.size();
	}
	
}
