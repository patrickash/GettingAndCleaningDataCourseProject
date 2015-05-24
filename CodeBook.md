# Getting and Cleaning Data Course Project
Prepared by Patrick Ashamalla (https://github.com/unended).

## Dataset Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features\_info.txt' for more details.

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Study Design
The data was provided through the course project assignment. 

All data and related files were moved from the self-contained folder `UCI HAR Dataset` to the `data` directory [included in this repo.](https://github.com/unended/GettingAndCleaningDataCourseProject/tree/master/data)

The instruction was to
- merge the training and test sets to create a single data set, and 
- to appropriately label the data set with description variable names. 

Only collected the observations that met the project requirements. 

Data was read into tables from the following files:

From ./data/train
- X\_train.txt
- y\_train.txt
- subject\_train.txt

From ./data/test
- X\_test.txt
- y\_test.txt
- subject\_test.txt

From ./data
- features.txt
- activity\_labels.txt

Only mean() and std() variables were extracted from the train and test data sets. Additional “Mean” angle variables were excluded for the following reasons: 
 1. they were not determined to be raw signal data, but were instead readings that were obtained by processing the original signal data
 2. and other readings within the original signal set in addition to mean() and std() were used to create the additional “Mean” values, which introduces additional data that was to be excluded from the tide data set.

The variables that were excluded that also included the word “Mean” were: `gravityMean`, `tBodyAccMean`, `tBodyAccJerkMean`, `tBodyGyroMean`, `tBodyGyroJerkMean`

Test and train internal signal data were excluded.

The original data can be [downloaded here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Code Book
The list of variables names with original variable names in italics, where applicable. Variable labels were modified from the original to improve readability.

**Subject**  
The identifier for each subject who performed the activity for each window sample. Its range is from 1 to 30.

**Activity**  
The name of the activity performed during the reading.

**timeBodyAcc-Mean-X** _tBodyAcc-mean()-X_  
**timeBodyAcc-Mean-Y** _tBodyAcc-mean()-Y_  
**timeBodyAcc-Mean-Z** _tBodyAcc-mean()-Z_  
3-axial time domain body acceleration signals - mean value

**timeBodyAcc-StdDev-X** _tBodyAcc-std()-X_  
**timeBodyAcc-StdDev-Y** _tBodyAcc-std()-Y_  
**timeBodyAcc-StdDev-Z** _tBodyAcc-std()-Z_  
3-axial time domain body acceleration signals - standard deviation

**timeGravityAcc-Mean-X** _tGravityAcc-mean()-X_  
**timeGravityAcc-Mean-Y** _tGravityAcc-mean()-Y_  
**timeGravityAcc-Mean-Z** _tGravityAcc-mean()-Z_  
3-axial time domain gravity acceleration signals - mean value

**timeGravityAcc-StdDev-X** _tGravityAcc-std()-X_  
**timeGravityAcc-StdDev-Y** _tGravityAcc-std()-Y_  
**timeGravityAcc-StdDev-Z** _tGravityAcc-std()-Z_  
3-axial time domain gravity acceleration signals - standard deviation

**timeBodyAccJerk-Mean-X** _tBodyAccJerk-mean()-X_  
**timeBodyAccJerk-Mean-Y** _tBodyAccJerk-mean()-Y_  
**timeBodyAccJerk-Mean-Z** _tBodyAccJerk-mean()-Z_  
3-axial time domain accelerometer Jerk signals - mean value

**timeBodyAccJerk-StdDev-X** _tBodyAccJerk-std()-X_  
**timeBodyAccJerk-StdDev-Y** _tBodyAccJerk-std()-Y_  
**timeBodyAccJerk-StdDev-Z** _tBodyAccJerk-std()-Z_  
3-axial time domain body accelerometer Jerk signals - standard deviation

**timeBodyGyro-Mean-X** _tBodyGyro-mean()-X_  
**timeBodyGyro-Mean-Y** _tBodyGyro-mean()-Y_  
**timeBodyGyro-Mean-Z** _tBodyGyro-mean()-Z_  
3-axial time domain body gyroscope signals - mean value

**timeBodyGyro-StdDev-X** _tBodyGyro-std()-X_  
**timeBodyGyro-StdDev-Y** _tBodyGyro-std()-Y_  
**timeBodyGyro-StdDev-Z** _tBodyGyro-std()-Z_  
3-axial time domain body gyroscope Jerk signals - standard deviation

**timeBodyGyroJerk-Mean-X** _tBodyGyroJerk-mean()-X_  
**timeBodyGyroJerk-Mean-Y** _tBodyGyroJerk-mean()-Y_  
**timeBodyGyroJerk-Mean-Z** _tBodyGyroJerk-mean()-Z_  
3-axial time domain body gyroscope Jerk signals - mean value

**timeBodyGyroJerk-StdDev-X** _tBodyGyroJerk-std()-X_  
**timeBodyGyroJerk-StdDev-Y** _tBodyGyroJerk-std()-Y_  
**timeBodyGyroJerk-StdDev-Z** _tBodyGyroJerk-std()-Z_  
3-axial time domain body gyroscope Jerk signals - standard deviation

**timeBodyAccMag-Mean** _tBodyAccMag-mean()_  
Time domain body accelerometer magnitude, calculated using the Euclidean norm - mean value

**timeBodyAccMag-StdDev** _tBodyAccMag-std()_  
Time domain body accelerometer magnitude, calculated using the Euclidean norm - standard deviation

**timeGravityAccMag-Mean** _tGravityAccMag-mean()_  
Time domain gravity accelerometer magnitude, calculated using the Euclidean norm - mean value

**timeGravityAccMag-StdDev** _tGravityAccMag-std()_  
Time domain body accelerometer magnitude, calculated using the Euclidean norm - standard deviation

**timeBodyAccJerkMag-Mean** _tBodyAccJerkMag-mean()_  
Time domain body accelerometer Jerk magnitude, calculated using the Euclidean norm - mean value

**timeBodyAccJerkMag-StdDev** _tBodyAccJerkMag-std()_  
Time domain body accelerometer Jerk magnitude, calculated using the Euclidean norm - standard deviation

**timeBodyGyroMag-Mean** _tBodyGyroMag-mean()_  
Time domain body gyroscope magnitude, calculated using the Euclidean norm - mean value

**timeBodyGyroMag-StdDev** _tBodyGyroMag-std()_  
Time domain body gyroscope magnitude, calculated using the Euclidean norm - standard deviation

**timeBodyGyroJerkMag-Mean** _tBodyGyroJerkMag-mean()_  
Time domain body gyroscope Jerk magnitude, calculated using the Euclidean norm - mean value

**timeBodyGyroJerkMag-StdDev** _tBodyGyroJerkMag-std()_  
Time domain body gyroscope Jerk magnitude, calculated using the Euclidean norm - standard deviation

**freqBodyAcc-Mean-X** _fBodyAcc-mean()-X_  
**freqBodyAcc-Mean-Y** _fBodyAcc-mean()-Y_  
**freqBodyAcc-Mean-Z** _fBodyAcc-mean()-Z_  
3-axial frequency domain body acceleration signals - mean value

**freqBodyAcc-StdDev-X** _fBodyAcc-std()-X_  
**freqBodyAcc-StdDev-Y** _fBodyAcc-std()-Y_  
**freqBodyAcc-StdDev-Z** _fBodyAcc-std()-Z_  
3-axial frequency domain body acceleration signals - standard deviation

**freqBodyAccJerk-Mean-X** _fBodyAccJerk-mean()-X_  
**freqBodyAccJerk-Mean-Y** _fBodyAccJerk-mean()-Y_  
**freqBodyAccJerk-Mean-Z** _fBodyAccJerk-mean()-Z_  
3-axial frequency domain body acceleration Jerk signals - mean value

**freqBodyAccJerk-StdDev-X** _fBodyAccJerk-std()-X_  
**freqBodyAccJerk-StdDev-Y** _fBodyAccJerk-std()-Y_  
**freqBodyAccJerk-StdDev-Z** _fBodyAccJerk-std()-Z_  
3-axial frequency domain body acceleration Jerk signals - standard deviation

**freqBodyGyro-Mean-X** _fBodyGyro-mean()-X_  
**freqBodyGyro-Mean-Y** _fBodyGyro-mean()-Y_  
**freqBodyGyro-Mean-Z** _fBodyGyro-mean()-Z_  
3-axial frequency domain body gyroscope signals - mean value

**freqBodyGyro-StdDev-X** _fBodyGyro-std()-X_  
**freqBodyGyro-StdDev-Y** _fBodyGyro-std()-Y_  
**freqBodyGyro-StdDev-Z** _fBodyGyro-std()-Z_  
3-axial frequency domain body gyroscope signals - standard deviation

**freqBodyAccMag-Mean** _fBodyAccMag-mean()_  
Frequency domain body accelerometer magnitude - mean value

**freqBodyAccMag-StdDev** _fBodyAccMag-std()_  
Frequency domain body accelerometer magnitude - standard deviation

**freqBodyAccJerkMag-Mean** _fBodyBodyAccJerkMag-mean()_  
Frequency domain body accelerometer Jerk magnitude - mean value

**freqBodyAccJerkMag-StdDev** _fBodyBodyAccJerkMag-std()_  
Frequency domain body accelerometer Jerk magnitude - standard deviation

**freqBodyGyroMag-Mean** _fBodyBodyGyroMag-mean()_  
Frequency domain body gyroscope magnitude - mean value

**freqBodyGyroMag-StdDev** _fBodyBodyGyroMag-std()_  
Frequency domain body gyroscope magnitude - standard deviation

**freqBodyGyroJerkMag-Mean** _fBodyBodyGyroJerkMag-mean()_  
Frequency domain body gyroscope Jerk magnitude - mean value

**freqBodyGyroJerkMag-StdDev** _fBodyBodyGyroJerkMag-std()_  
Frequency domain body gyroscope Jerk magnitude - standard deviation

----
_NOTE: Fast Fourier Transform (FFT) was applied frequency domain signals_
