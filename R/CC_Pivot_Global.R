#' CC_Pivot_Global
#' 
#' This function performs consensus clustering with CC_Pivot algorithm
#' 
#' @param V Vertex list, Ep and Em are assumed to be global 


CC.Pivot.Global <- function(V,cnt){
  
  library(foreach)
  library(Matrix)
  library(parallel)
  
  if (length(V)<=1){
    return(NULL)
  }
  
  i <- sample(V,1)
  C <- c(i)
  Vp <- c()
  Ept <- Ep[i,]
  Emt <- Em[i,]
  
  n <- sqrt(length(Ep))
  Vt <- rep(FALSE, n)
  V2 <- c(1:n)
  Ct <- rep(FALSE, n)
  C2 <- c(1:n)
  
  #print(i)
  foreach (k = 1:length(V)) %dopar% {
    j <- V[k]
    if (i == j){
      Ct[j] <- TRUE
    } else{
      if (Ept[j] == T){
        Ct[j] <- TRUE
      } else {
        Vt[j] <- TRUE
      }
    }
  }
  
  C <- C2[Ct]
  print(length(C))
  Vp <- V2[Vt]
  print(length(Vp))
  Lab[C] <<- cnt
  cnt <- cnt + 1
  print(cnt)
  CC.Pivot.Global(Vp,cnt)
  
}  