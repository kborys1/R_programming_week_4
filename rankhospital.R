source("rateByHospitalState.R ")

rankhospital <- function(state, outcome, num = "best") 
{ 

  d <- rateByHospitalState(state,outcome)
    
  ## Return hospital name in that state with the given rank ## 30-day death rate
  d2 <- d[order(d[,2],d[,1]),]
  
  if (num == "best") return(d2[1,1])
  if (num == "worst") return(d2[nrow(d2),1])
  
  return(d2[num,1])
  

  }