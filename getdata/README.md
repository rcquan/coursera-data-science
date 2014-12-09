# Getting and Cleaning Data Course Project #

Included is an R script for downloading and analyzing the featured data set.
## How to Use ##
* Copy the script to your working directory
* Set the working directory in R using `setwd("<path_to_working_directory>")`
* Run `source("run_analysis.R")` at the R prompt
* Two useful datasets will be created:
    - the combined raw data set with only the mean and std observations in the R environment as `data`
    - the tidy data set with the mean of the interesting variables, split by activity as `tidyData`
* `run_analysis.R` will also write a .txt file of the tidy dataset into the working directory as `tidyData.txt`

