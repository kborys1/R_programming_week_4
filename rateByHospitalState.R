rateByHospitalState <- function(state, outcome) {
## Read outcome data
d <- read.csv("outcome-of-care-measures.csv", colClasses = "character") 

states <- unique(d$State)
outcome2column <- list("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)

## Check that state and outcome are valid
if (! (state %in% states | state == "all") )
{
  msg <- "incorrect state"
  print(msg)
  return(-1)
}
if (! outcome %in% names(outcome2column))
{ 
  msg <- paste0("Error in best(", state, ", " , outcome, ") : invalid outcome")
  print(msg)
  return(-1) 
}

if (state != "all")
  d <- d[d$State == state,]

d <- d[,c(2,outcome2column[[outcome]],7)] # 2 columns: hospital, mortality rate  
d[,2] <- as.numeric(d[, 2])
colnames(d)[2] <- "Rate"
d <- na.omit(d)

return(d)
}