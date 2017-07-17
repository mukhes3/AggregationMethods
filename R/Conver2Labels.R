#' Convert2Labels 
#' 
#' Converting list returned by CC-pivot to Labels
#'  
#' @param Instance Clustering instance returned by CC-pivot 
#' @param N Total number of elements 
#' 

Convert2Labels <- function(Instance, N){ 
  
  l <- length(Instance)
  
  Lab <- rep(0, N)
  
  for (i in 1:l){
    
    Lab[[Instance[[i]]]] = i
  }
  
  return(Lab)
  }