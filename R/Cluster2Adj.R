#' Cluster2Adj 
#' 
#' Converts a cluster to an adjacency matrix 
#' @param ClusterList All clusterings from one clustering instance


Cluster2Adj <- function(ClusterList){
  
  n <- length(ClusterList)
  
  Adj <- outer(1:n, 1:n , FUN=function(r,c) (ClusterList[r] == ClusterList[c])*1)
  # Adj <- matrix(0,n,n)
  # 
  # for (i in 1:n){ 
  #   
  #   for (j in 1:n){ 
  #     
  #     if (ClusterList[i] == ClusterList[j]){
  #       Adj[i,j] <- 1
  #     }
  #     
  #   }
    
  #}
  return(Adj)
}