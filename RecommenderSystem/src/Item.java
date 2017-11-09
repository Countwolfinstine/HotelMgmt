public class Item {
	public String name;
	private int itemId;
	public int price;
	public Item(int id, int price){
		itemId = id;
		this.price = price;
	}
	public int getPrice(){
		return price;
	}
	public int getItemId(){
		return itemId;
	}
}
