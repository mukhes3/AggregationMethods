#' CC_Pivot
#' 
#' This function performs consensus clustering with CC_Pivot algorithm
#' 
#' @param G A graph object (list) with elements V, Ep and Em 


CC.Pivot <- function(G){
  
  V <- G$V 
  Ep <- G$Ep 
  Em <- G$Em 
  
  if (length(V)<=1){
    return(list(V))
  }
  
  i <- sample(V,1)
  C <- c(i)
  Vp <- c()
  
  
  
  for (j in V){
    if (i == j){
      next
    } 
    
    if (Ep[i,j] == 1){
      C <- c(j,C)
    } else if (Em[i,j] == 1) {
      Vp <- c(j,Vp)
    }
    
  }
  
  
  n <- sqrt(length(Ep))
  
  G$Ep <- matrix(0,n,n)
  G$Em <- matrix(0,n,n)
  
  G$V <- Vp 
  G$Ep[Vp, Vp] <- Ep[Vp, Vp]
  G$Em[Vp, Vp] <- Em[Vp, Vp]
  
  rm(Ep, Em)
  Gret <- CC.Pivot(G)
  if (is.null(Gret[[1]])){
    return(list(C))
  }
  
  return( c(C, Gret))
}  
