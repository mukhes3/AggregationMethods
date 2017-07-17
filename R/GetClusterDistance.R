#' Get.Cluster.Distance 
#' 
#' This function calculates the distances between two clusterings 
#' 
#' @param Clust1 First clustering
#' @param Clust2 Second clustering
#' 
#' 

GetClusterDistance <- function(Clust1, Clust2){ 
  
  
  C1 <- Cluster2Adj(Clust1)
  C2 <- Cluster2Adj(Clust2)
  
  d <- sum(C1!=C2)
  
  return(d)
  
  }