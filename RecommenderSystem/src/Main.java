public class Main {
	// calculate user-similarity using Jaccard's similarity
	public double similarityValues[][];
	public boolean keepRatingCountMatrix;
	public boolean useObjIdToIndexMapping;
	public RatingCountMatrix ratingCountMatrix[][];
	// dataset should have - 
	// 1. getUsers()  return type - array of User Class
	// 2. getUserCount() return type - int
	// 3. getUser()	return type - User class .. input - userId
	
	public void calculate(Dataset dataset){
		int numUsers = dataset.getUserCount();
		// hard-coded the rating values
		int numRatingValues = 5;
		similarityValues = new double[numUsers][numUsers];
		/*if(keepRatingCountMatrix){
			ratingCountMatrix = new RatingCountMatrix[numUsers][numUsers];
		}*/
		/*if(useObjIdToIndexMapping){
			for(User u:dataset.getUsers()){
				// fill up
			}
		}*/
		for(int u=0;u<numUsers;u++){
			int userIdA = getObjIdFromIndex(u);
			User userA = dataset.getUser(userIdA);
			
			for(int v=u+1;v<numUsers;v++){
				int userIdB = getObjIdFromIndex(v);
				User userB = dataset.getUser(userIdB);
				RatingCountMatrix rcm = new RatingCountMatrix(userA, userB, numRatingValues);
				int totalCount = rcm.getTotalCount();
				int agreementCount = rcm.getAgreementCount();
				if(agreementCount>0){
					// Jaccard's similarity metric
					similarityValues[u][v] = (double) agreementCount / (double) totalCount;
				}
				else{
					similarityValues[u][v] = 0.0;
				}
			}
			similarityValues[u][u] = 1.0;
		}	
	}
	public double predictRating(User user, Item item) {
		double estimatedRating = Double.NaN;
		int itemId = item.getItemId();
		int userId = user.getUserId();
		double similaritySum = 0.0;
		double weightedRatingSum = 0.0;
		// check if user has already rated this item
		Rating existingRatingByUser = user.getItemRating(item.getItemId());
		if (existingRatingByUser != null) {
		estimatedRating = existingRatingByUser.getRating();
		} else {
		for (User anotherUser : dataSet.getUsers()) {
		Rating itemRating = anotherUser.getItemRating(itemId);
		// only consider users that rated this book
		if (itemRating != null) {
		// should add similarityMatrix or write getValue method here...
		double similarityBetweenUsers =
		similarityMatrix.getValue(userId, anotherUser.getUserId());
		double ratingByNeighbor = itemRating.getRating();
		double weightedRating =
		similarityBetweenUsers * ratingByNeighbor;
		weightedRatingSum += weightedRating;
		similaritySum += similarityBetweenUsers;
		}
		}
		if(similaritySum > 0.0) {
			estimatedRating = weightedRatingSum / similaritySum;
		}
		}
		return estimatedRating;
		}
}
