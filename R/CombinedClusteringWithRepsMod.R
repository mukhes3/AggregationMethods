#' CombinedClusteringWithRepsMod
#' 
#' Performs best of two clustering with reps and picks the best clustering
#' 
#' @param InstanceList List of clusters 
#' @param Reps Number of repetations to do for CC-Pivot 
#' 

CombinedClusteringWithRepsMod <- function(InstanceList, Reps){ 
  
  l <- length(InstanceList)  
  C_1 <- PickBestCluster(InstanceList)
  d1 <- 0 
  
  for (i in 1:Reps){ 
    
    CC.Pivot.Global(G$V,1)
    C_2 <- Lab
    #Lab <- rep(0,N)
    print(head(C_2))
    C_1 <- BestOfTwo(C_1, C_2, InstanceList)
    
    
  }
  
  return(C_1)
  
}