best <- function(state, outcome) {
        #reads outcome-of-care-measures.csv into R
        dframe.1 <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        #check for valid input for state and outcome
        if (!(state %in% dframe.1$State)){
                stop("invalid state")}
        if (!(outcome %in% c("heart attack","heart failure", "pneumonia"))){
                stop("invalid outcome")}
        #subsets dframe by state, extracts hospital name and outcome measures only
        dframe.2 <- dframe.1[dframe.1$State == state, c(2, 11, 17, 23)]
        #tranforms columns containing outcome measures into numeric class
        dframe.2[,c(2,3,4)] <- sapply(dframe.2[,c(2,3,4)], as.numeric)
        #renames column names in dframe.2 according to possible outcome inputs
        colnames(dframe.2) <-c("name","heart attack", "heart failure", "pneumonia")
        #removes NA values from specified outcome columns
        dframe.3 <- dframe.2[!is.na(dframe.2[outcome]),]
        #sorts subsetted dataframe by outcome measure (decreasing), then by name (alphabetical)
        dframe.4 <- dframe.3[order(dframe.3[,outcome], dframe.3[,"name"], decreasing = FALSE),]
        
        return(head(dframe.4, 1)[[1]])
}