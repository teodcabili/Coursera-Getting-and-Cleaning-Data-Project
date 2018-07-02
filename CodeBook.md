# CODE BOOK: Getting and Cleaning Data - Course Project

This code book describes the variables, the data, and any transformations or work that was performed to clean up the data.


## Variables

### Identifiers:

* `subject_id`, The identification number of a subject. An integer from 1 to 30.
* `activity`, The activity being performed by the subject when the measurements were taken.

activity_id | activity_name 
--- | --- 
1 | WALKING
2 | WALKING_UPSTAIRS
3 | WALKING_DOWNSTAIRS
4 | SITTING
5 | STANDING
6 | LAYING

### Meassurements:

Below is the list of variables retained from the raw training and test datasets (there is a total of 79):

* tBodyAccMeanX
* tBodyAccMeanY
* tBodyAccMeanZ
* tBodyAccStdX
* tBodyAccStdY
* tBodyAccStdZ
* tGravityAccMeanX
* tGravityAccMeanY
* tGravityAccMeanZ
* tGravityAccStdX
* tGravityAccStdY
* tGravityAccStdZ
* tBodyAccJerkMeanX
* tBodyAccJerkMeanY
* tBodyAccJerkMeanZ
* tBodyAccJerkStdX
* tBodyAccJerkStdY
* tBodyAccJerkStdZ
* tBodyGyroMeanX
* tBodyGyroMeanY
* tBodyGyroMeanZ
* tBodyGyroStdX
* tBodyGyroStdY
* tBodyGyroStdZ
* tBodyGyroJerkMeanX
* tBodyGyroJerkMeanY
* tBodyGyroJerkMeanZ
* tBodyGyroJerkStdX
* tBodyGyroJerkStdY
* tBodyGyroJerkStdZ
* tBodyAccMagMean
* tBodyAccMagStd
* tGravityAccMagMean
* tGravityAccMagStd
* tBodyAccJerkMagMean
* tBodyAccJerkMagStd
* tBodyGyroMagMean
* tBodyGyroMagStd
* tBodyGyroJerkMagMean
* tBodyGyroJerkMagStd
* fBodyAccMeanX
* fBodyAccMeanY
* fBodyAccMeanZ
* fBodyAccStdX
* fBodyAccStdY
* fBodyAccStdZ
* fBodyAccMeanFreqX
* fBodyAccMeanFreqY
* fBodyAccMeanFreqZ
* fBodyAccJerkMeanX
* fBodyAccJerkMeanY
* fBodyAccJerkMeanZ
* fBodyAccJerkStdX
* fBodyAccJerkStdY
* fBodyAccJerkStdZ
* fBodyAccJerkMeanFreqX
* fBodyAccJerkMeanFreqY
* fBodyAccJerkMeanFreqZ
* fBodyGyroMeanX
* fBodyGyroMeanY
* fBodyGyroMeanZ
* fBodyGyroStdX
* fBodyGyroStdY
* fBodyGyroStdZ
* fBodyGyroMeanFreqX
* fBodyGyroMeanFreqY
* fBodyGyroMeanFreqZ
* fBodyAccMagMean
* fBodyAccMagStd
* fBodyAccMagMeanFreq
* fBodyBodyAccJerkMagMean
* fBodyBodyAccJerkMagStd
* fBodyBodyAccJerkMagMeanFreq
* fBodyBodyGyroMagMean
* fBodyBodyGyroMagStd
* fBodyBodyGyroMagMeanFreq
* fBodyBodyGyroJerkMagMean
* fBodyBodyGyroJerkMagStd
* fBodyBodyGyroJerkMagMeanFreq


## Transformations

Below is a list of transformations employed in the run_analysis.R

1. The training and test dataset were merged with their respective "subject_id" and "activity" information. [done using cbind()]
2. The training and test dataset were then concatenated. [done using rbind()]
3. In the final dataset the activity labels were orignally in code (integer from 1 to 6) but was later re-labelled with with their actual corresponding  descriptive activity names [refer to the table under `Identifiers`]
4. Retained only the measurements on the mean and standard deviation for each measurement in the training and test datasets. [done by keeping the columns which contained the strings "mean" and "std" - used grep()] 
5. In the variable names retained "mean" and "std"  were changed to "Mean" and "Std" respectively. [done using gsub()]
6. Special characters in the variable names such as "(", ")", and "-" were removed. [done using gsub()]
7. Obtained the average of each variable for each activity and each subject. [done using reshape2::melt() and reshape2::dcast()] 
