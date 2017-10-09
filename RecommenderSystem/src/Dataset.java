import java.util.*;
public class Dataset {
	
	public ArrayList<User> userArray;
	public ArrayList<Item> itemArray;
	
	public Dataset(){
		// fill up user-Array and Item-array here...
		userArray = new ArrayList<User>();
		itemArray = new ArrayList<Item>();
		
	}
	public User getUser(int userId){
		for(int i=0;i<userArray.size();i++){
			if(userArray.get(i).getUserId()==userId){
				return userArray.get(i);
			}
		}
		return new User(-1);
	}
	
	public int getUserCount(){
		return userArray.size();
	}
	
}
