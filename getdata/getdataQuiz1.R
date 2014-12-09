x<- read.csv(file="Data/getdata_data_ss06hid.csv")
y = x$VAL
z <- table(y)
z
install.packages("xlsx")
library(xlsx)
dat <- read.xlsx("Data/getdata_data_DATA.gov_NGAP.xlsx",sheetIndex=1,
                 rowIndex=18:23, colIndex=7:15,header=TRUE)



sum(dat$Zip*dat$Ext,na.rm=T) 

install.packages("XML")
library(XML)
fileUrl <-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
rootNode <-xmlRoot(doc)
xmlName(rootNode)
names(rootNode)

pid <- read.csv("getdata_data_ss06pid.csv")

install.packages("fread")
DT<-fread(pid)