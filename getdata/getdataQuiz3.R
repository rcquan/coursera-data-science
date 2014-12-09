#Question 1

#download and load ACS data into R
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
fileName <- "Data/IDHousing.csv"
download.file(url, fileName, method = "curl")
IDHousing <- read.csv(fileName)

#Create logical vector "agricultureLogical" that returns TRUE
# if observation is greater than 10 acres and sold more than 
# $10,000 in agricultural products

IDHousing$agricultureLogical <- ifelse(IDHousing$ACR==3 & IDHousing$AGS==6, TRUE, FALSE)

#Returns index that are "TRUE"
which(IDHousing$agricultureLogical == TRUE)




#Question 2

install.packages("jpeg")
require(jpeg)

#Read in jpeg
jpegUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(jpegUrl, "Data/jeff.jpg", method = "curl")
jeffJPG <- readJPEG("jeff.jpg", native = TRUE)

#30th and 80th quantiles
quantile(jeffJPG, probs = c(0.30, 0.80))




#Question 3

#read gdp data
gdp.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
gdp.file <- "Data/gdp.csv"
download.file(gdp.url, gdp.file, method = "curl")
gdp <- read.csv(gdp.file, skip=4, nrows = 190)

#read edu data
edu.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
edu.file <- "Data/edu.csv"
download.file(edu.url, edu.file, method = "curl")
edu <- read.csv(edu.file)

#merge tables
gdp.edu <- merge(gdp, edu, by.x = "X", by.y = "CountryCode")
colnames(gdp.edu)[2] <- "gdpRank"

#sort tables by gdpRank, decreasing order
gdp.edu.sorted <- gdp.edu[order(gdp.edu$gdpRank, decreasing = TRUE),]



#Question 4

#return gdpRank mean for each value of Income Group subset
aggregate(gdpRank ~ Income.Group, data = gdp.edu, mean)


#Question 5

#create 5 separate quantiles for GDP rank
gdpQuantile <- cut(gdp.edu$gdpRank, breaks = 5)

#table of GDP Quantile versus Income Group
table(gdpQuantile, gdp.edu$Income.Group)

