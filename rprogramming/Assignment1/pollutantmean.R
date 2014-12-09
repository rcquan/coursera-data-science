pollutantmean <- function(directory, pollutant, id){
        #reading in multiple .csv data sets in range id
        filename <- sprintf("%03d", id)
        fullname <- paste(directory, "/", filename, ".csv", sep = "")
        mydata <- lapply(fullname, read.csv) #applies read function to filepath
        
        x <- numeric()
        #had to add conditional flows and hard code for nitrate and sulfate
        #because argument "pollutant" returned NaN
        if (pollutant == "nitrate"){
                for (i in 1:length(id)){
                        x <- append(x, mydata[[i]]$nitrate)
                }
        }
        
        if (pollutant == "sulfate"){
                for (i in 1:length(id)){
                        x <- append(x, mydata[[i]]$sulfate) #subsetting
                }
        }
        missing <- is.na(x)
        nomissing <- x[!missing] #removes NA values
        return(mean(nomissing))
}


#pollutantmean("specdata", "sulfate", 1:10)
#pollutantmean("specdata", "nitrate", 70:72)
#pollutantmean("specdata", "nitrate", 23)
