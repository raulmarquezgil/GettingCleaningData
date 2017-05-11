setwd("C://Users//eraumrq//Documents//Gestion//Curso Data Scientist//Curso3_Exam")

library(dplyr)

# Reading Labels for: Features and Activities
features <- read.table(".//UCI HAR Dataset//features.txt", stringsAsFactors = FALSE)
activitylabels <-read.table(".//UCI HAR Dataset//activity_labels.txt", stringsAsFactors = FALSE)

# Reading Training Dataset
trainingset <- read.table(".//UCI HAR Dataset//train//X_train.txt", stringsAsFactors = FALSE)
trainingactivity <- read.table(".//UCI HAR Dataset//train//y_train.txt", stringsAsFactors = FALSE)
trainingsubject <- read.table(".//UCI HAR Dataset//train//subject_train.txt", stringsAsFactors = FALSE)

# Filter only Mean and Standard Deviation Features in Training Dataset
validfeatures.logic <- grep("mean\\(|std\\(",features$V2)
trainingset <- trainingset[,validfeatures.logic]

# Renaming Feature Labels 
validfeatures.labels <- grep("mean\\(|std\\(",features$V2, value=TRUE)
validfeatures.labels <- gsub("mean\\(\\)","Mean",validfeatures.labels)
validfeatures.labels <- gsub("std\\(\\)","Std",validfeatures.labels)
validfeatures.labels <- gsub("-","",validfeatures.labels)

# Complete Training Dataset: Subject+Activity+Features
trainingactivity[["V1"]] <- activitylabels[match(trainingactivity[["V1"]],activitylabels[["V1"]]),"V2"]
training <- cbind(trainingsubject,trainingactivity,trainingset)
names(training) <- c("subject","activity",validfeatures.labels)

# Reading Test Dataset
testset <- read.table(".//UCI HAR Dataset//test//X_test.txt", stringsAsFactors = FALSE)
testactivity <- read.table(".//UCI HAR Dataset//test//y_test.txt", stringsAsFactors = FALSE)
testsubject <- read.table(".//UCI HAR Dataset//test//subject_test.txt", stringsAsFactors = FALSE)

# Filter only Mean and Standard Deviation Features in Test Dataset
testset <- testset[,validfeatures.logic]

# Complete Test Dataset: Subject+Activity+Features
testactivity[["V1"]] <- activitylabels[match(testactivity[["V1"]],activitylabels[["V1"]]),"V2"]
tests <- cbind(testsubject,testactivity,testset)
names(tests) <- c("subject","activity",validfeatures.labels)

#Merge TRAIN and TEST datasets
finaldataset <- rbind(training,tests)

finaldataset$activity <- as.factor(finaldataset$activity)

#New dataset based on grouping by activity and subject
final_group <- tbl_df(finaldataset)
final_group <- group_by(final_group,activity,subject)
tidydata <- summarise_each(final_group,funs(mean))

# Writing Output file
write.table(tidydata, "tidydata.txt", row.names = FALSE)

