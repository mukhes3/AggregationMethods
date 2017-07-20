#' BestOneElementMove
#' 
#' Performs Best one element move algorithm 
#' 
#' @param Wp positive consensus matrix from CC-Pivots initialization 
#' @param InstanceList List of clustering instances 
#' @param C Initial clustering 

BestOneElementMove <- function(Wp, InstanceList,C,MaxSteps){

  k <- length(InstanceList)
  l <- length(unique(C))
  A <- Wp*k
  S <- 0 
  N <- length(A[,1])
  
  # #Calculating initial distance 
  # for (i in 1:k){
  #   S <- S + GetClusterDistance(C,InstanceList[[i]])
  # }
  cnt <- 1
  
  dS <- -Inf 
  #Performing BOEM
  while((dS < 0) & (cnt <=MaxSteps) ){ 
    #cat('Performing move',cnt,'\n')
    dBest <- Inf 
    C_best <- NULL
    dt <- Inf
    
    for (i in 1:N){
      
      for (j in 1:l){
        if(C[i]==j){
          next
        }
        
        In_i <- which(C == C[i])
        In_j <- which(C == j)
        if (length(In_j)>0){
          dt <- -((length(In_i)-1)*k - 2*sum(A[i,In_i]) + 2*sum(A[i,i]) - 
            (length(In_j))*k + 2*sum(A[i,In_j]))
        } else {
          dt <- -((length(In_i)-1)*k - 2*sum(A[i,In_i]) + 2*sum(A[i,i]))
        }

        
        if(dt < dBest){
          dBest <- dt
          C_best <- C
          C_best[i] <- j
        }
      }
    }
    
    dS <- dBest 
    if(dBest<0){
      C <- C_best
    }
    cnt <- cnt + 1
    cat('Max improvement in step',cnt-1,'is =',-dS,'\n')
    }
  
  return(C_best)
  
}