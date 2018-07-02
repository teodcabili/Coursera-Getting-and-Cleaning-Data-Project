#install.packages("reshape2")
#install.packages("data.table")

library(reshape2)
library(data.table)

##Step 1 - Getting the data ----

#path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file_name <- "dataset_files.zip"


if (!file.exists(file_name)) {
  download.file(url, file_name)
}

if (!file.exists("UCI HAR Dataset")) { 
  unzip(file_name) 
}

##Step 2 - Loading the Activity and Feautures files ----

##Read Activity Labels

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])
colnames(activity_labels) <- c("activity_id", "activity_name")

##Read Features

features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])
colnames(features) = c("index", "feature_name")

features_keep <- grep(".*mean.*|.*std.*", features[,2])
features_keep.names <- features[features_keep,2]
features_keep.names = gsub('-mean', 'Mean', features_keep.names)
features_keep.names = gsub('-std', 'Std', features_keep.names)
features_keep.names <- gsub('[-()]', '', features_keep.names)

###Step 3 and 4 - Retaining required cols in test and training datasets and merging each with their respective activity and subject data

#Reads Train Datasets

train <- read.table("UCI HAR Dataset/train/X_train.txt")[features_keep]
train_activities <- read.table("UCI HAR Dataset/train/Y_train.txt")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(train_subjects, train_activities, train)

#Reads Test Datasets

test <- read.table("UCI HAR Dataset/test/X_test.txt")[features_keep]
test_activities <- read.table("UCI HAR Dataset/test/Y_test.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(test_subjects, test_activities, test)

##Step 5 - Combining dataSets ----

combined <- rbind(train,test)

# Assigning column names
colnames(combined) <- c("subject_id", "activity", features_keep.names)


#Step 6 - Turn activities & subjects into factors -----
combined$activity <- factor(combined$activity
                                  , levels = activity_labels[["activity_id"]]
                                  , labels = activity_labels[["activity_name"]])
combined$subject_id <- as.factor(combined$subject)

#Step 7 - Getting the averages and writing the output dataset

combined_final <- reshape2::melt(data = combined, id = c("subject_id", "activity"))
combined_final <- reshape2::dcast(data = combined_final, subject_id + activity ~ variable, mean)


# output cleaned dataset as .txt file
write.table(combined_final, "tidy_data.txt", row.names = FALSE, quote = FALSE, sep = ",")



