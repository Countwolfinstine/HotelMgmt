import java.util.*;
public class Recommend {
	
	public static int topN;
	public Recommend(User user){
		topN = 3;	// top 3 recommendations.
	}
	public static void main(String[] args){
		Main m = new Main();
		//Recommend r = new Recommend(user);
		User user = new User(1);
		Dataset dataset = new Dataset();
		List<Rating> recommendations = new ArrayList<Rating>();
		for(Item item: dataset.getItems()){
			if (user.getItemRating(item.getItemId()) == null) {
				double predictedRating = m.predictRating(user, item);
				if (!Double.isNaN(predictedRating)) {
				recommendations.add(new Rating((int)Math.ceil(predictedRating), item.getItemId(), user.getUserId()));
				}
			}
		}
		// sort based on ratings... should write comparable method here..
		Collections.sort(recommendations);
		Collections.reverse(recommendations);
		
		List<Rating> topRecommendations = new ArrayList<Rating>();
			for(Rating r : recommendations) {
			if( topRecommendations.size() >= topN ) {
			// had enough recommendations.
			break;
			}
			topRecommendations.add(r);
			}
	}
}
