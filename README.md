## Getting-and-Cleaning-Data-Assignment

This read me file outlines the original dataset, and the three files (codebook.md, run_analysis.R, and TidyData.txt) found within the Getting-and-Cleaning-Data Repository. 

### Scope of Original Dataset

The original dataset comes from the "Human Activity Recongition Using Smartphone Dataset Version 1.0".  To summarize the original dataset: Thirty subjects are to perform six different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing the Samsung Galaxy S II on their wrist.  The phone's internal embedded accelerometer and gyroscope measures a range of raw data in the time domain.  The raw data measures magnitude, angular velocity, and linear acceleration.  Additionally the fourier transform was applied to transform the time-domain data into the frequency domain.

Further details about the raw data variables are found in CodeBook.md

### Files in Repository:

* CodeBook.md:  
  
  > This code book outlines the original source data as well as its variables, the function of run analysis script (transformation of the data), and the output of the data "TidyData.txt".  
  > The CodeBook also outlines all the files found in the original data set.

* run_analysis.R: 

  > The run_analysis script fulfills five main tasks that are summarized in greater detail in the code book.  To summarize, these five steps are: 
 
  > 1: <b>Collecting Data</b> (Merges the training and the test sets to create one data set) 
    
    > 2: <b>Naming Data</b> (Uses descriptive activity names to name the activities in the data set)  
    
    > 3: <b>Extract Data</b>(Extract only the measurements on the mean and standard deviation for each measurement).  
    
    > 4: <b>Cleaning Data</b> (Appropriately labels the data set with descriptive variable names) 
    
    > 5: <b>Tiding Data</b> (Create an independent tidy data set with the average of each variable for each activity and each subject.)

* TidyData.txt:

  > The tidyData is the output of the run_analysis function.  The tidyData comprise of only the standard deviation and mean collected in the original data.  The tidyData takes the average of these variables for all 30 subjects performing each of the six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).  Hence, there are 180 observations for each of the 89 variables.  
