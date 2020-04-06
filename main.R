# quiz
source("best.R") 
source("rankhospital.R") 
source("rankall.R")

best("SC", "heart attack")
best("NY", "pneumonia")
best("AK", "pneumonia")
rankhospital("NC", "heart attack", "worst")
rankhospital("WA", "heart attack", 7)
rankhospital("TX", "pneumonia", 10)
rankhospital("NY", "heart attack", 7)
r <- rankall("heart attack", 4)
as.character(subset(r, State == "HI")$Hospital.Name)
r <- rankall("pneumonia", "worst")
as.character(subset(r, State == "NJ")$Hospital.Name)
r <- rankall("heart failure", 10)
as.character(subset(r, State == "NV")$Hospital.Name)

##++++++++++++++++++++++++++++++++++++++++++++++

source("rankall.R")

a <- rankall("heart attack", 20)
head(a,10)

tail(rankall("pneumonia", "worst"), 3)

tail(rankall("heart failure"), 10)

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
source("rankhospital.R") 
rankhospital("TX", "heart failure", 4)
# "DETAR HOSPITAL NAVARRO"

rankhospital("MD", "heart attack", "worst")
# "HARFORD MEMORIAL HOSPITAL"

rankhospital("MN", "heart attack", 5000)
#  NA

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
source("rateByHospitalState.R")
d <- rateByHospitalState("TX", "heart attack")

#===========================================================
source("best.R") 
best("TX", "heart attack")
# "CYPRESS FAIRBANKS MEDICAL CENTER"

best("TX", "heart failure")
# "FORT DUNCAN MEDICAL CENTER"

best("MD", "heart attack")
# "JOHNS HOPKINS HOSPITAL, THE"

best("MD", "pneumonia")
# "GREATER BALTIMORE MEDICAL CENTER"

best("BB", "heart attack") 
# Error in best("BB", "heart attack") : invalid state 
best("NY", "hert attack") 
# Error in best("NY", "hert attack") : invalid outcome >


#---------------------------------------------------------------------------
d <- read.csv("outcome-of-care-measures.csv", colClasses = "character") 
head(d)
d[, 11] <- as.numeric(d[, 11])
hist(d[, 11])
