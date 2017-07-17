#' CombinedClusteringWithReps
#' 
#' Performs best of two clustering with reps and picks the best clustering
#' 
#' @param InstanceList List of clusters 
#' @param Reps Number of repetations to do for CC-Pivot 
#' 

CombinedClusteringWithReps <- function(InstanceList, Reps){ 
  
  l <- length(InstanceList)  
  C_1 <- PickBestCluster(InstanceList)
  d1 <- 0 
  
  #Get distance of pick best clustering
  for (i in 1:l){ 
    
    d1 <- d1 + GetClusterDistance(C_1,InstanceList[[i]])
    
  }
  
  G <- Corr2Cons(InstanceList)
  
  dBest <- Inf 
  
  N <- max(C_1)
  
  for (i in 1:Reps){ 
    
    C_2 <- Convert2Labels(CC.Pivot(G),N)
    C_1 <- BestOfTwo(C_1, C_2, InstanceList)
    
    }
  
  return(C_1)
  
  }