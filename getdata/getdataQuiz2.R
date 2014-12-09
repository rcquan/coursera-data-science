#quiz question 1
library(httr)

# 1. Find OAuth settings for github:
# http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
# Insert your values below - if secret is omitted, it will look it up in
# the GITHUB_CONSUMER_SECRET environmental variable.
#
# Use http://localhost:1410 as the callback url
myapp <- oauth_app("github", "84a38d150ea7cad38927", secret = "e77873b73b0290f4bdeb8965bb3f2d67c03672b7")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
req <- GET("https://api.github.com/rate_limit", config(token = github_token))
stop_for_status(req)
content(req)





download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "Data/acs.csv", method = "curl")
acs <- read.csv("acs.csv")
install.packages("sqldf")
library(sqldf)
acs_pweights <- sqldf("select pwgtp1 from acs where AGEP < 50")
acs_unique <- unique(acs$AGEP)
acs_unique1 <- sqldf("select distinct AGEP from acs")


#readLines
con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
htmlCode

nchar(htmlCode[c(10, 20, 30, 100)])

download.file("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for", "wksst.for", method = "curl")
wksst <- read.fwf("wksst.for", widths = c(12, 7, 4, 9, 4, 9, 4, 9, 4), skip = 4)
sum(wksst[,4])
