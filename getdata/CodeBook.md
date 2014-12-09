# Codebook

This codebook describes the data that will be found in the text-delmited file `tidyData.txt` after executing `run_analysis.R` (see README for instructions.)

## Source Dataset

These data are summaries derived from data from the [Human Activity Recognition Using
Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
dataset.


## Description of Data Fields

* A "feature" is a real number in the range [-1, 1]
* "-mean()" was computed by taking the mean of the signal.
* "`-std()" was computed by taking the standard deviation of the signal.
* Magnitudes are of the associated X, Y, and Z signals using the Euclidean coordinate system.

### Column IDs

```
subject
```
The human subject whose activities were being recorded. With 30 test subjects, this number is coded as
an integer in a range from 1-30.

```
activityLabel
```
Label describing the activity undertaken by the human subject. May be one of the following
* "LAYING"
* "SITTING"
* "STANDING"
* "WALKING"
* "WALKING_UPSTAIRS"
* "WALKING_DOWNSTAIRS"


### Column Features

```
tBodyAcc-mean()-X
tBodyAcc-std()-X
tBodyAcc-mean()-Y
tBodyAcc-std()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-Z
```
Body acceleration (extracted using low-pass filter), in X, Y, and Z dimensions.

```
tGravityAcc-mean()-X
tGravityAcc-std()-X
tGravityAcc-mean()-Y
tGravityAcc-std()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-Z
```
Gravitational acceleration (extracted using low-pass filter), in X, Y, and Z dimensions.


```
tBodyAccJerk-mean()-X
tBodyAccJerk-std()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-std()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-Z
```
Body "jerk" (first derivative of body acceleration), in X, Y, and Z dimensions.


```
tBodyGyro-mean()-X
tBodyGyro-std()-X
tBodyGyro-mean()-Y
tBodyGyro-std()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-Z
```
Angular velocity around X, Y, and Z axes.

```
tBodyGyroJerk-mean()-X
tBodyGyroJerk-std()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-std()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-Z
```
Time derivative of angular velocity around X, Y, and Z axes.

```
tBodyAccMag-mean()
tBodyAccMag-std()
```
Magnitude of body acceleration.

```
tGravityAccMag-mean()
tGravityAccMag-std()
```
Magnitude of gravitational acceleration.

```
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
```
Magnitude of body jerk.

```
tBodyGyroMag-mean()
tBodyGyroMag-std()
```
Magnitude of angular velocity.

```
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
```
Magnitude of angular velocity,

```
fBodyAcc-mean()-X
fBodyAcc-std()-X
fBodyAcc-mean()-Y
fBodyAcc-std()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-Z
```
FFT of body acceleration, in X, Y, and Z directions.

```
fBodyAccJerk-mean()-X
fBodyAccJerk-std()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-std()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-Z
```
FFT of body jerk, in X, Y, and Z directions.

```
fBodyGyro-mean()-X
fBodyGyro-std()-X
fBodyGyro-mean()-Y
fBodyGyro-std()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-Z
```
FFT of angular velocity around X, Y, and Z axes.

```
fBodyAccMag-mean()
fBodyAccMag-std()
```
FFTs of magnitude of body acceleration.

```
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
```
FFT of magnitude of body jerk.

```
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()
```
FFT of magnitude of angular velocity


```
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()
```
FFT of magnitude of time derivative of angular velocity.

