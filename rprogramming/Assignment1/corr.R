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

        
corr <- function(directory, threshold){
        complete(directory, id = 1:332) #using complete-case data.frames from complete function
        
        cr <- numeric()
        for (i in 1:nrow(df)){ #looping through observations in complete-case data.frame
                if (df[i,2] > threshold){ 
                        #if complete-case greater than threshold, we subset that datafile and correlate
                        #sulfate and nitrate
                        cr <- append(cr, cor(mydata[[i]]$sulfate, mydata[[i]]$nitrate, use = "complete"))
                }
        }
        return(cr) #return outside of for loop in order to get all values
}

corr("specdata", 400)

