require(data.table)

# Prepare all file paths.

fileSep <- .Platform$file.sep #uses platform specific file separator
dataDir <- "UCI HAR Dataset"
featuresFile <- paste(dataDir, fileSep, "features.txt", sep="")
activityLabelsFile <- paste(dataDir, fileSep, "activity_labels.txt", sep="")
subjectTestFile <- paste(dataDir, fileSep, "test", fileSep, "subject_test.txt", sep="")
xTestFile <- paste(dataDir, fileSep, "test", fileSep, "X_test.txt", sep="")
yTestFile <- paste(dataDir, fileSep, "test", fileSep, "y_test.txt", sep="")
subjectTrainFile <- paste(dataDir, fileSep, "train", fileSep, "subject_train.txt", sep="")
xTrainFile <- paste(dataDir, fileSep, "train", fileSep, "X_train.txt", sep="")
yTrainFile <- paste(dataDir, fileSep, "train", fileSep, "y_train.txt", sep="")

# Check that the test folder exists. If not, downloads UCI HAR dataset to current directory.

if (!file.exists(dataDir)){
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        fileName <- "dataset.zip"
        download.file(url, fileName, method = "curl")
        unzip(fileName)
}

# Load up the column names (i.e. the "feature" names) and the activity labels

features <- read.table(featuresFile, colClasses=c("integer", "character"))
activityLabels <- read.table(activityLabelsFile)

# Get indexes of features containing "mean()" or "std()"

selectedFeatureIndexes <- grep("mean\\(\\)|std\\(\\)", features$V2)

# Read `subject` test and train data and merge them into one dataset

subjectTest <- read.table(subjectTestFile)
subjectTrain <- read.table(subjectTrainFile)
subject <- rbind(subjectTest, subjectTrain)

# Read 'x' test and train data, with the selected features only,
# and merge into one dataset.

colClass <- rep("NULL", nrow(features))
colClass[selectedFeatureIndexes] <- "numeric"
xTest <- read.table(xTestFile, colClasses=colClass) #slow
xTrain <- read.table(xTrainFile, colClasses=colClass) #slow
x <- rbind(xTest, xTrain)

# Read `y` test and train data and merge them into one

yTest <- read.table(yTestFile)
yTrain <- read.table(yTrainFile)
y <- rbind(yTest, yTrain)

# Use the activity labels to replace integers with more descriptive text

y$V1 <- factor(y$V1, labels=activityLabels$V2)

# Merge y and x with appropriate column names added using "feature indexes"

data <- cbind(subject, cbind(y, x))
col_names <- c("subject", "activity", features$V2[selectedFeatureIndexes])
names(data) <- col_names

# Take average of each feature and collapse by subject and activity 
#
# Transforming data.frame to data.table will allow us to quickly subset 
# our dataset

data_table <- data.table(data)
tidyData <- data_table[, lapply(.SD, mean), by=c("subject", "activity")]

# Sort tidyData by the subject and activity

tidyData <- tidyData[order(tidyData$subject, tidyData$activity)]

# Write tidyData to current directory
write.table(averages, file = "tidyData.txt")
