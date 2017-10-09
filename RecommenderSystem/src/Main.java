
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
}
