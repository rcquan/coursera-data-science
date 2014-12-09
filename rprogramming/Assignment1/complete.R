complete <- function(directory, id){
        filename <- sprintf("%03d", id)
        fullname <- paste(directory, "/", filename, ".csv", sep = "")
        mydata <- lapply(fullname, read.csv) #applies read function to filepath
        
        values <- numeric() #empty numeric vector
        for (i in mydata){ #looping through list of data.frames
                values <- append(values, sum(complete.cases(i))) #adds #of complete cases to vector
        }
        df <- data.frame(id, values) #creating data.frame from two vectors
        names(df) <- c("id", "nobs") #naming vector columns
        return(df)

#complete("specdata", id = 30:25)