source("rateByHospitalState.R")
best <- function(state, outcome) { 
  
  d <- rateByHospitalState(state,outcome)
  
  ## Return hospital name in that state with lowest 30-day death ## rate
  d2 <- d[order(d[,2],d[,1]),]
  return(d2[1,1])
  }
  