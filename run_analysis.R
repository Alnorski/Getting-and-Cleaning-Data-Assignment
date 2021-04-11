library(dplyr)

## Getting/Reading data from UCI HAR Dataset via downloaded Zipfile 

trainingSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainingSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainingLabel <- read.table("./UCI HAR Dataset/train/y_train.txt")
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testSet <- read.table("./UCI HAR Dataset/test/X_test.txt")
testLabel <- read.table("./UCI HAR Dataset/test/y_test.txt")
featuresName <- read.table("./UCI HAR Dataset/features.txt")
activityLegend <- read.table("./UCI HAR Dataset/activity_labels.txt")

## 1) "Merges the training and the test sets to create one data set"
## Row-binding specific dataset: Set, Label and Subject
## Then, column-binding all dataset 
## (Note: make "subject", "label" on left side of column)
## Use featuresName for colNames of "set"

set <- rbind(trainingSet, testSet)
subject <- rbind(trainingSubject, testSubject)
label <- rbind(trainingLabel, testLabel)
allData <- cbind(subject, label, set)
colnames(allData) <- c("Subject", "ActivityID", featuresName[,2])

## 2) Uses descriptive activity names to name the activities in the data set
## use "ActivityID" as the matching ID for merging allData & activityLegend
## make activityLegend first data in merge function

colnames(activityLegend) <- c("ActivityID", "Activity")
allDataLabeled <- merge(activityLegend, allData, by = "ActivityID", all.y=TRUE)

## 3) Extracts only the mean and standard deviation for each measurement. 

extractedData <- select(allDataLabeled, Subject, Activity, 
                        contains("mean"), contains("std"))
names(extractedData) ## quick view of extracted column names 

## 4) Appropriately labels the data set with descriptive variable names. 

colNamesData <- names(extractedData)
colNamesData <- gsub("Freq", "Frequency", colNamesData)
colNamesData <- gsub("^f", "Frequency", colNamesData)
colNamesData <- gsub("^t", "Time", colNamesData)
colNamesData <- gsub("Acc", "Accelerometer", colNamesData)
colNamesData <- gsub("Gyro", "Gyroscope", colNamesData)
colNamesData <- gsub("Mag", "Magnitude", colNamesData)
colNamesData <- gsub("BodyBody", "Body", colNamesData)
colNamesData <- gsub("tBody", "TimeBody", colNamesData)
colNamesData <- gsub("std", "STD", colNamesData)
colNamesData <- gsub("mean", "Mean", colNamesData)


names(extractedData) <- colNamesData

## 5) creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.

tidyData <- extractedData %>% 
      group_by(Subject, Activity) %>% 
      summarize_all(list(mean))
write.table(tidyData, "tidyData.txt", row.names=FALSE)
