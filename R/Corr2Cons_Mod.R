#' Corr2Cons_Mod function 
#' 
#' This function all clustering instances and converts to consensus clustering matrices
#' 
#' @param InstanceList List of all clusterings 


Corr2Cons_Mod <- function(InstanceList){
  
  library(Matrix)
  l <- length(InstanceList)
  
  n <- length(InstanceList[[1]])
  
  W <- Matrix(0,n,n, sparse = T)
  
  for (i in 1:l){
    print(i)
    W <- W + Cluster2Adj(InstanceList[[i]])
    
  }
  
  l2 <- list()
  
  l2$Wp <- W/l 
  l2$Wn <- 1 - W/l
  
  G <- list()
  
  G$V <- c(1:n)
  #M <- Matrix(1,n,n, sparse = T)
  G$Ep <- (l2$Wp>=l2$Wn)
  G$Em <- (l2$Wp<l2$Wn)
  
  
  #l2$G$Ep[l2$G$Ep] = 1
  #l2$G$Em[l2$G$Em] = 1
  
  return(G)
  
}
