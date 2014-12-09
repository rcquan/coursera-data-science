# Question 1

# Check if Idaho Housing data already exists in working directory
dataDir = "Data/IDHousing06.csv"

if (!file.exists(dataDir)){
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
        fileName <- "Data/IDHousing06.csv"
        download.file(url, fileName, method = "curl")
}
IDHousing <- read.csv(fileName)
# Split all column names of the dataframe on characters "wgtp" 
splitNames <- strsplit(names(IDHousing), "wgtp")
splitNames[123]

# Question 2

# Read GDP data
gdp.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
gdp.file <- "Data/gdp.csv"
download.file(gdp.url, gdp.file, method = "curl")
gdp <- read.csv(gdp.file, skip=4, nrows = 190)


# Remove comma from GDP number, coerce blank values to NA
gdpNoCommas <- as.numeric(gsub(gdp$X.4, pattern = ",", replacement = ""))

mean(gdpNoCommas, na.rm=TRUE)

# Question 3

# Return indexes for country names starting with "United"
names(gdp)[4] <- "countryNames"
names(gdp)
grep("^United",gdp$countryNames)


# Question 4

# Read edu data
edu.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
edu.file <- "Data/edu.csv"
download.file(edu.url, edu.file, method = "curl")
edu <- read.csv(edu.file)

# Merge tables
gdp.edu <- merge(gdp, edu, by.x = "X", by.y = "CountryCode")


# Question 5

#Install quantmod package and load Amazon Stock XTS
install.packages("quantmod")
require(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

#Subset Amazon data to include data for 2012 only
amzn2012 <- (amzn["2012"])
amzn2012
nrow(amzn2012)

#Subset Amazon 2012 data to include only Mondays
amzn2012[.indexwday(amzn2012)==0]
nrow(amzn2012[.indexwday(amzn2012)==0])
