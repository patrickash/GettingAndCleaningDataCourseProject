# GettingAndCleaningDataCourseProject
This project contains all the files and data used to collect, work with and clean the data set provided for the project.

## Original Dataset Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features\_info.txt' for more details.

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Instruction List
Below is a detailed description of how the [run\_analysis.R] script works to clean the raw data and output the tidy data set, [averages.txt].


### Step 1: Load in all the data that will be used in the analysis.
The following train, test, feature and activity label data is loaded into tables using `read.table()`:
- `xTrain` - X\_train.txt
- `yTrain` - y\_train.txt
- `subjectTrain` - subject\_train.txt
- `xTest` - X\_test.txt
- `yTest` - y\_test.txt
- `subjectTest` - subject\_test.txt
- `features` - features.txt
- `activityLabels` - activity\_labels.txt

### Step 2: Merge the training and the test sets to create one data set.
`xData`, `yData` and `subjectData` data frames are created by row binding train and test data for x, y, and subject.

### Step 3: Extract only the measurments on the mean and standard deviation for each measurement.
Using `grep()`, a new `meanStdFeatures` vector is created from a subset of variables from `features` that only contain _-mean()_ or _-std()_ in the name. 

`xData` is pruned to only contain the mean and std columns using the `meanStdFeatures` vector.

The mean and standard labels are assigned to the remain columns using `meanStdFeatues`.

### Step 4: Use descriptive activity names to name the activities in the data set.
Each activity numeric value in `yData` is replaced with the corresponding activity label from `activityLabels`.

“Activity” is added as the column name.

### Step 5: Appropriately label the data set with descriptive variable names.
“Subject” is added as the column name in `subjectData`.

The feature column names are modified for improved readability by looping through the column names and:
1. replacing mean() and std() method names with Mean and StdDev, respectively.
2. Hungarian notation labels, t and f, are replaced with time and freq, respectively.
3. Some field names that included duplicate “BodyBody” naming were updated to remove the second “Body” in the name.

### Step 6: Create a second independent tidy data set with the average of each variable for each activity and each subject.
A full data set is created using `cbind` that combines all readings, activity label and subject performing the activity.

Readings of each signal is grouped by subject and activity. The average of each reading is taken, which results in a data frame that contains a single average value for each activity by each subject:

30 subjects X 6 activities to produce 180 row. Each row contains averages for each of the 66 variables. See [CodeBook.md] for more information about each variable.
