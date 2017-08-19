library(reshape2)

## data file download from web site and unzip to text file.

if (!file.exists("data")) { dir.create("data") }
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/dataset.zip", mode="wb")
Datedownloaded <- date()
unzip("./data/dataset.zip", exdir = "./data")

## Read the text file and save it to the data frame.

X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", quote="\"", stringsAsFactors=FALSE)
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", quote="\"", stringsAsFactors=FALSE)
Y_train <- read.table("./data/UCI HAR Dataset/train/Y_train.txt", col.names="activity", quote="\"", stringsAsFactors=FALSE)
Y_test <- read.table("./data/UCI HAR Dataset/test/Y_test.txt", col.names="activity", quote="\"", stringsAsFactors=FALSE)
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names="subject", quote="\"", stringsAsFactors=FALSE)
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names="subject", quote="\"", stringsAsFactors=FALSE)

## 1.Merges the training and the test sets to create one data set.
## This data set is merged by rbind and cbind function..

X_data <- rbind(X_train,X_test)
Y_data <- rbind(Y_train,Y_test)
subject_data <- rbind(subject_train, subject_test)
full_ds <- cbind(X_data, Y_data, subject_data)

dim(full_ds)

## 2.Extracts only the measurements on the mean and standard deviation for each measurement.
## First, read the feature text file to get 561 feature names.
## Here I used the grep function containing mean () or std () to extract 66 feature names.   
## And select interesting features, activity, and suject columns from full data set so finally get 10299 X 68 data set.

features <- read.table("./data/UCI HAR Dataset/features.txt", quote="\"", stringsAsFactors=FALSE)
features_rows <- grep("mean\\(\\)|std\\(\\)", features$V2)
extract_ds <- full_ds[,c(features_rows, 562, 563)]

dim(extract_ds)


## 3.Uses descriptive activity names to name the activities in the data set
# This script read the descriptive activity names from the activty_labels file and then mapping to the activity column by factor function.

activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", quote="\"", stringsAsFactors=FALSE)
extract_ds$activity <- factor(extract_ds$activity, levels = activity_labels$V1, labels = activity_labels$V2)

table(extract_ds$activity)


## 4.Appropriately labels the data set with descriptive variable names.
## this code assign feature names containing mean () or std () to dataset column names.

names(extract_ds)[1:66] <- features[features_rows,]$V2

names(extract_ds)


## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## Two steps have been taken to do this.  
## First, this code transformed the data set to intermediate form(subject, activity, variable, value) using melt funcation.

tidy_ds <- melt(extract_ds, id=c('subject',"activity"), measure.vars=features[features_rows,]$V2)

head(tidy_ds)

## Next, I used an aggregate function to calculate the average of each variable for each activity and each subject.

tidy_ds <- aggregate( value ~ subject+activity+variable , data=tidy_ds, mean)
colnames(tidy_ds)[4] <-c("avg")

dim(tidy_ds)
head(tidy_ds)


## Finally, Save the tidy data set as a text file.
write.table(tidy_ds, file="tidy_ds.txt",row.names = FALSE)
