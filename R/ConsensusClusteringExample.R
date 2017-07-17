#' ConsensusClusteringExample
#' 
#' Example of how to run various consensus clustering algorithms 
#' 

ConsensusClusteringExample <- function(){ 
  
  library(datasets)
  head(iris)
  
  InstanceList <- list()
  
  cat('Performing 5 instances of kmeans clustering \n')
  #Running 5 instances of Kmeans clustering 
  for (i in 1:5){ 
    
    temp1 <- kmeans(iris[, 3:4], 3, nstart = 20)
    
    InstanceList <- c(InstanceList, list(temp1$cluster))
    
  }
  
  par(mfrow=c(2,2))
  
  cat('Plotting true clusters based on species \n')
  plot(iris[,3],iris[,4], col = iris$Species)
  title('Actual clusters')
  
  cat('Performing PickBestCluster clustering \n')
  C_1 <- PickBestCluster(InstanceList)
  C_1 <- as.factor(C_1)
  plot(iris[,3],iris[,4], col = C_1)
  title('PickBestCluster')

  cat('Performing CC-Pivot clustering \n')
  C_2 <- Convert2Labels(PickBestCluster(InstanceList))
  C_2 <- as.factor(C_2)
  plot(iris[,3],iris[,4], col = C_2)
  title('CC-Pilot clusters')
  
  cat('Performing CombinedClusteringWithReps, reps = 10 \n')
  C_3 <- CombinedClusteringWithReps(InstanceList, 25)
  C_3 <- as.factor(C_3)
  plot(iris[,3],iris[,4], col = C_3)
  title('CombinedClusteringWithReps')
  
  return(NULL)
  
  }

