#' BestOfTwo 
#' 
#' Looks at the resulting clustering from the two algorithms and picks the best 
#' 
#'  @param Clust1 Clustering from PickBestCluster
#'  @param Clust2 Clustering from CC_Pivot 
#'  @param InstanceList List of all clusterings 
#'  

 BestOfTwo <- function(Clust1, Clust2, InstanceList){ 
   
   l <- length(InstanceList)
   
   d1 <- 0 
   d2 <- 0 
   
   for ( i in 1:l){ 
     
     d1 <- d1 +  GetClusterDistance(Clust1,InstanceList[[i]])
     d2 <- d2 +  GetClusterDistance(Clust2,InstanceList[[i]])     
   }
   
   #print('bla')
   #print(d1)
   #print(d2)
   
   
   if (d1 <= d2){
     return(Clust1)
     
   } else {
     
     return(Clust2)
   }
   
   }