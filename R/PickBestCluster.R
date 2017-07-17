#' PickBestCluster
#' 
#' This function picks the clustering with lowest total distance 
#' @param InstanceList List of all clusterings 
#' 

PickBestCluster <- function(InstanceList){ 
  
  l <- length(InstanceList)
  
  BestClustering <- NULL
  dBest <- Inf 
  
  for (i in 1:l){ 
    
    d <- 0 
    
    for (j in 1:l){
      if (i != j){
        C_i <- InstanceList[[i]]
        C_j <- InstanceList[[j]]
        dt <- GetClusterDistance(C_i,C_j)
        d <- d + dt 
        
      }
      
    }
      
    
    if (d <= dBest){ 
      BestClustering <- InstanceList[[i]]
      dBest <- d
      }
    
  }
  
  return(BestClustering)
  
  }