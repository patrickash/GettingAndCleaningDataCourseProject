library(plyr)
library(dplyr)

# Setup work
# Set your working directory to the directory that contains this script.
# setwd: ~/Documents/Workspace/R/GettingAndCleaningDataCourseProject
##########################################################################################

setwd("~")
rootPath        <- getwd()
projectPath     <- "/Documents/Workspace/R/GettingAndCleaningDataCourseProject"head()
pathSegments    <- c(rootPath, projectPath)
fullPath        <- paste(pathSegments, collapse="")
setwd(fullPath)

# Load in all the data that will be used in the analysis
##########################################################################################

# Train Data
xTrain          <- read.table("./data/train/X_train.txt")       ## dim: [1] 7352  561
yTrain          <- read.table("./data/train/y_train.txt")       ## dim: [1] 7352    1
subjectTrain    <- read.table("./data/train/subject_train.txt") ## dim: [1] 7352    1

# Test Data
# dim(xTest):       [1] 2947  561
xTest           <- read.table("./data/test/X_test.txt")         ## dim: [1] 2947  561 
yTest           <- read.table("./data/test/y_test.txt")         ## dim: [1] 2947    1
subjectTest     <- read.table("./data/test/subject_test.txt")   ## dim: [1] 2947    1

# Features
features        <- read.table("./data/features.txt")            ## dim: [1] 561   2

# Activities: 
activityLabels  <- read.table("./data/activity_labels.txt")     ## dim: [1] 6 2

# Step 1: Merge the training and the test sets to create one data set.
# All row binding (rbind) uses the same order: Train, Test
##########################################################################################

xData           <- rbind(xTrain, xTest)                         ## dim: [1] 10299   561
yData           <- rbind(yTrain, yTest)                         ## dim: [1] 10299     1
subjectData     <- rbind(subjectTrain, subjectTest)             ## dim: [1] 10299     1

# 2: Extract only the measurments on the mean and standard deviation for each measurement.
##########################################################################################

# Only get features with mean() or std() in the name
meanStdFeatures <- grep("-(mean|std)\\(\\)", features[, 2])     ## length: 66

xData <- xData[, meanStdFeatures]                               ## dim: [1] 10299    66

# Assign mean and standard labels to each of the 66 columns
names(xData) <- features[meanStdFeatures, 2]

# 3: Use descriptive activity names to name the activities in the data set
##########################################################################################

# No need to reorder activityLabels - it's ordered by column one value in ascending order.
# Loop through the data and use the numeric value to pull the label in the corresponding
# activityLabels row.
yData[, 1] <- activityLabels[yData[, 1], 2]

# Add column name "Activity" to yData
names(yData) <- "Activity"

# 4: Appropriately label the data set with descriptive variable names
##########################################################################################

names(subjectData) <- "Subject"

# Grab original column names and assign it to the columnNames variable
columnNames <- names(xData)
len <- length(columnNames)

# Loop
for ( i in 1:len ) {
    columnNames[i] <- gsub("-std\\(\\)", "-StdDev", columnNames[i])
    columnNames[i] <- gsub("-mean\\(\\)", "-Mean", columnNames[i])
    columnNames[i] <- gsub("^(t)", "time", columnNames[i])
    columnNames[i] <- gsub("^(f)", "freq", columnNames[i])
    columnNames[i] <- gsub("BodyBody", "Body", columnNames[i])
}

names(xData) <- columnNames

# 5: Create a second independent tidy data set with the average of each variable for each
# activity and each subject
##########################################################################################

fullData <- cbind(xData, yData, subjectData)
averages <- ddply(fullData, .(Subject, Activity), function(x) { colMeans(x[, 1:66]) })

write.table(averages, "./averages.txt", row.name = FALSE)