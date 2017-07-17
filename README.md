# AggregationMethods
This library contains various consensus and correlation clustering algorithms. The different methods covered in the library so far are: 

1. **CC-Pivot**: This is a randomized algorithm first described in 'Aggregating Inconsistent Information:
   Ranking and Clustering' by Ailon et. al. (https://courses.cs.washington.edu/courses/cse522/05au/aggregation.pdf). *This method also works for correlation clustering.* 
2. **PickBestCluster:** Given a set of clusterings, this picks the clustering that has the lowest total distance from the other clusterings. 
3. **BestOfTwo:** Compares two consensus clusterings by computing their distance from all of the given clusterings and then picks the consensus clustering with the lower total distance. 
4. **CombinedClusteringWithReps:** This is a clustering method that runs the BestOfTwo method for several iterations, keeping the cluster with the lowest total distance. The CC-Pivot algorithm is run at each iteration. 