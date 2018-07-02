# Getting and Cleaning Data - Course Project

The purpose of this project is to demonstrate the student's ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The data for the project is the  [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#), from the UCI Machine Learning Repository.

The files contained in the repository are the following:

*`CodeBook.md`, describes the variables, the data, and any transformations or work performed to clean up the data.

*`run_analysis.R`, an R script which contains all the codes to perform the following steps:    
	1. Download and unzip the dataset if it still doesn't exist in the working directory.
	2. Reads the activity_labels and features data.
	3. Reads the train and test datasets wherein only columns refering to the mean and standard deviation are retained.
	4. Reads the activity and subject data for both train and test datasets. These additional info are merged to the two datasets respectively [cbind()].
	5. Merge the train dataset and the test dataset [rbind()]
	6. Converts the columns "activity" and "subject_id" as factors.
	7. Writes a tidy data set with the average of each variable for each activity and each subject.

*`tidy_data.txt`, basically this the final output in the run_analysis.R script. 