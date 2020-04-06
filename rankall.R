library(dplyr)
source("rateByHospitalState.R ")

rankall <- function(outcome, num = "best") 
  { 
  d <- rateByHospitalState("all", outcome)
  
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the ## (abbreviated) state name

  if (num == "best")
    num <- 1

  if (num == "worst")
  {
    output <- d %>% arrange(State, desc(Rate), Hospital.Name) %>% 
      group_by(State) %>%
      mutate(myrank = row_number(desc(Rate))) %>%
      filter(myrank == 1) 
  }
  else
  {
  output <- d %>% arrange(State, Rate, Hospital.Name) %>% 
    group_by(State) %>%
    mutate(myrank = row_number(Rate)) %>%
    filter(myrank == num) 
  }
  return(output)
}

a <- rankall("pneumonia", "worst")
tail(a,3)
print("end")
