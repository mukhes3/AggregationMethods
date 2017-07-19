#' BestOneElementMove
#' 
#' Performs Best one element move algorithm 
#' 
#' @param Wp positive consensus matrix from CC-Pivots initialization 
#' @param InstanceList List of clustering instances 
#' @param C Initial clustering 

BestOneElementMove <- function(Wp, InstanceList,C){

  k <- length(InstanceList)
  A <- Wp*k
  S <- 0 
  N <- length(A[,1])
  
  #Calculating initial distance 
  for (i in 1:k){
    S <- S + GetClusterDistance(C,InstanceList[[i]])
  }
  
  dS <- Inf 
  #Performing BOEM
  while(dS > 0){ 
    
    dBest <- Inf 
    C_best <- NULL
    
    for (i in 1:N){
      
      for (j in 1:k){
        if(i==j){
          next
        }
        
        In_i <- which(C == C[i])
        In_j <- which(C == j)
        if (length(In_j)>0){
          dt <- (length(In_i)-1)*k - 2*sum(A[i,In_i]) + 2*sum(A[i,i]) - 
            (length(In_j))*k - 2*sum(A[i,In_j])
        } else {
          dt <- (length(In_i)-1)*k - 2*sum(A[i,In_i]) + 2*sum(A[i,i])
        }

        
        if(dt < dBest){
          dBest <- dt
          C_best <- C
          C_best[i] <- j
        }
      }
    }
    
    if(dBest<0){
      dS <- dBest 
      C <- C_best
    }
    
    }
  
  return(C_best)
  
}