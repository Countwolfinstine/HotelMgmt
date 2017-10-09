
public class RatingCountMatrix {
	private int matrix[][] = null;
	// getAllRatings - in user class
	// Rating class - getItemId() 
	public RatingCountMatrix(User userA, User userB, int numRatingValues){
		init(numRatingValues);
		calculate(userA, userB);
	}
	private void init(int numSize){
		matrix = new int[numSize][numSize];
	}
	private void calculate(User userA, User userB){
		for(Rating ratingByA: userA.getAllRatings()){
			Rating ratingByB = userB.getItemRating(ratingByA.getItemId());
			
			if(ratingByB!=null){
				int i = ratingByA.getRating() - 1;
				int j = ratingByB.getRating() - 1;
				matrix[i][j]++;
			}
		}
	}
	public int getTotalCount(){
		int ratingCount = 0;
		int n = matrix.length;
		for(int i=0;i<n;i++){
			for(int j=0;j<n;j++){
				ratingCount += matrix[i][j]; 
			}
		}
		return ratingCount;
	}
	public int getAgreementCount(){
		int agreementCount = 0;
		int n = matrix.length;
		for(int i=0;i<n;i++){
				agreementCount += matrix[i][i];
		}
		return agreementCount;
	}
}
