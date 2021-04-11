---
title: "Getting and Cleaning Data Assignment"
author: "G-A"
date: "4/10/2021"
---

## Project Description

The objective of the project is "getting and cleaning data". The r_analysis script merges the collected raw data into a single dataset, cleans the data by updating the labels of each variables in each column, and extracts only the data that measured the "standard deviation" and "mean". Finally, r_analysis script output contains a tidydata.txt file, where the data set consist of the average for each subject for each measured activity of the remaining variables of this extracted data.

### Brief Summary of the original data
 
The original dataset comes from the "Human Activity Recongition Using Smartphone Dataset Version 1.0".  To summarize the original dataset: Thirty subjects are to perform six different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing the Samsung Galaxy S II on their wrist.  The phone's internal embedded accelerometer and gyroscope measures a range of raw data in the time domain.  The raw data measures magnitude, angular velocity, and linear acceleration.  Additionally the fourier transform was applied to transform the time-domain data into the frequency domain.

### Detailed Summary of original data:

This is an excerpt from the feature_info.txt files:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

### Outline of original file

Training data set:

* 'train/subject_train.txt': Training subject.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.

Test data set:

* 'test/subject_test.txt': Test subject.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

Files of variables and activities:

* 'features.txt': List of all features.
* 'activity_labels.txt': a table containing the activity ID and activity name

Information Files:

* 'README.txt': ReadMe File summarizing the dataset.
* 'features_info.txt': detailing information about the variables used on the feature vector.

### Description of each original files

<b>Note: these excerpts below are relevant information from the original "ReadMe" file outlining the details of each file:</b>

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

* "<b>Units:</b> Each features (or variable) units are normalized and bounded within [-1,1]. 


## Creating the tidy data file

### Steps to create the tidy data file

These steps for creating the tidy data file are as outlined in the assignment:

*  Step 1: <b>Collecting Data</b> (Merges the training and the test sets to create one data set)
*  Step 2: <b>Naming Data</b> (Uses descriptive activity names to name the activities in the data set) 
*  Step 3: <b>Extract Data</b>(Extract only the measurements on the mean and standard deviation for each measurement). 
*  Step 4: <b>Cleaning Data</b> (Appropriately labels the data set with descriptive variable names)
*  Step 5: <b>Tiding Data</b> (Create an independent tidy data set with the average of each variable for each activity and each subject.)

#### Step 1 - Collection Data

1. Combined the three "training data set" using row-bind
2. Combined the three "test data set" using row-bind
3. Merge these two combined data set column-bind to create allData
4. Use the features.txt file for naming the column of the set portion of the combined data.

#### Step 2 - Naming Data

1. Assign column names "Activity ID" and "Activity" to activity_label file.
2. Merge the two files activity_label and allData by the column "ActivityID"

#### Step 3 - Extract Data

1. Extract specific column by selecting specific variables: subject, activity ID, and any feature names containing the mean and standard deviation (std) in its' column name.

#### Step 4 - Cleaning Data

1. Using the gsub function, update the names each variables to full descriptive names.
2. Assign updated column names into the latest Extract Data Set

#### Step 5 - Tiding Data

1.  Grouped the extracted data by "subject" proceeded by "activity"
2.  Summarize each the average of each observation for each subject's activity.
3.  Output the tidy data as a textfile.

### Description of the variable in the tidydata.txt

<b>Dimension of the dataset:</b>

* The dimension is (180 rows by 89 columns), hence 180 observations for 89 different collected variables.  The total observation (180) consists of 30 subjects having 6 different activities evaluated.

<b>Description of the variables</b>:

The list of variables below are in tidyData textfile.  The set of variables that were estimated from these signals are: 

* Mean( ): Mean value
* STD( ): Standard deviation
* MeanFrequency( ): Weighted average of the frequency components to obtain a mean frequency
* angle( ): Angle between to vectors.

Note: in the spirit of brevity the '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  Additionally, each variable are normalized and bounded within [-1,1]. You can read about the description of the raw data for each variable in the section above titled <b>"Detailed Summary of raw data"</b> to describe the variable listed below.  The tidy data set gleans through all these observation (variables) and averaged the data samples for each subject for each activity.

<b>Time Domain Data</b>

* TimeBodyAccelerometer-XYZ
* TimeGravityAccelerometer-XYZ
* TimeBodyAccelerometerJerk-XYZ
* TimeBodyGyrometer-XYZ
* TimeBodyGyrometerJerk-XYZ
* TimeBodyAccelerometerMagnitude
* TimeGravityAccelerometerMag
* TimeBodyAccelerometerJerkMag
* TimeBodyGyrometerMag
* TimeBodyGyrometerJerkMag

<b>Frequency Domain Data</b>

* FrequencyBodyAccelerometer-XYZ
* FrequencyBodyAccelerometerJerk-XYZ
* FrequencyBodyGyrometer-XYZ
* FrequencyBodyAccelerometerMagnitude
* FrequencyBodyAccelerometerJerkMagnitude
* FrequencyBodyGyrometerMagnitude
* FrequencyBodyGyrometerJerkMagnitude

<b>Angular Velocity</b>

* angle(TimeBodyAccelerometerMean,gravity)"             
* angle(TimeBodyAccelerometerJerkMean),gravityMean)"      
* angle(TimeBodyGyroscopeMean,gravityMean)"               
* angle(TimeBodyGyroscopeJerkMean,gravityMean)"           
* angle(X,gravityMean)"                                   
* angle(Y,gravityMean)"                                   
* angle(Z,gravityMean)"  

## Sources/License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
