#' Corr2Cons function 
#' 
#' This function all clustering instances and converts to consensus clustering matrices
#' 
#' @param InstanceList List of all clusterings 


Corr2Cons <- function(InstanceList){
  
  l <- length(InstanceList)

  n <- length(InstanceList[[1]])
  
  W <- matrix(0,n,n)
  
  for (i in 1:l){
    
    W <- W + Cluster2Adj(InstanceList[[i]])
    
  }
  
  l2 <- list()
  
  l2$Wp <- W/l 
  l2$Wn <- 1 - W/l
  
  G <- list()
  
  l2$G$V <- c(1:n)
  M <- matrix(1,n,n)
  l2$G$Ep <- (l2$Wp>=l2$Wn)
  l2$G$Em <- (l2$Wp<l2$Wn)
  
  l2$G$Ep[l2$G$Ep] = 1
  l2$G$Em[l2$G$Em] = 1
  
  return(l2)
  
}

