# Getting and Cleaning Data Course Project

This project is a final assignment of the getting and cleaning data course.
The original data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

I downloaded the data below and used it for this project:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

This Github repository includes the following files:
- tidy_ds.txt : text file of a tidy data set that is result of run_analysis.R
- run_analysis.R : R scripts to convert from original data to tidy data
- CodeBook.md. : data dictionary that describes the variables and the data of tidy_ds.txt
- README.md : This explains how all of the scripts work and how they are connected.

#### Preliminaries for assignment
This code download data file from web site and unzip to text file so that the tidy dataset can be fully reproduced.
```
if (!file.exists("data")) { dir.create("data") }
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/dataset.zip", mode="wb")
Datedownloaded <- date()
unzip("./data/dataset.zip", exdir = "./data")
```

And then, read all X, Y, and subject text files in the test and train folders and save it to the data frame.  
The X data set has 561 columns and the other data sets have one column.  
```
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", quote="\"", stringsAsFactors=FALSE)
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", quote="\"", stringsAsFactors=FALSE)
Y_train <- read.table("./data/UCI HAR Dataset/train/Y_train.txt", col.names="activity", quote="\"", stringsAsFactors=FALSE)
Y_test <- read.table("./data/UCI HAR Dataset/test/Y_test.txt", col.names="activity", quote="\"", stringsAsFactors=FALSE)
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names="subject", quote="\"", stringsAsFactors=FALSE)
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names="subject", quote="\"", stringsAsFactors=FALSE)
```

#### 1. Merges the training and the test sets to create one data set.
This data set is merged by rbind and cbind function.
```
X_data <- rbind(X_train,X_test)
Y_data <- rbind(Y_train,Y_test)
subject_data <- rbind(subject_train, subject_test)
full_ds <- cbind(X_data, Y_data, subject_data)
```
```
> dim(full_ds)
[1] 10299   563
```

#### 2.Extracts only the measurements on the mean and standard deviation for each measurement.
First, read the feature text file to get 561 feature names.
Here I used the grep function with mean () or std () to extract the feature names we are interested.   
And select the features, activity, and suject columns from full data set so finally get 10299 X 68 data set.
```
features <- read.table("./data/UCI HAR Dataset/features.txt", quote="\"", stringsAsFactors=FALSE)
features_rows <- grep("mean\\(\\)|std\\(\\)", features$V2)
extract_ds <- full_ds[,c(features_rows, 562, 563)]
```
```
> dim(extract_ds)
[1] 10299    68
```

#### 3.Uses descriptive activity names to name the activities in the data set
This script read the descriptive activity names from the activty_labels.txt file
 and then mapping to the activity column by factor function.
```
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", quote="\"", stringsAsFactors=FALSE)
extract_ds$activity <- factor(extract_ds$activity, levels = activity_labels$V1, labels = activity_labels$V2)
```
We can see the number of each activity names.
```
> table(extract_ds$activity)
WALKING   WALKING_UPSTAIRS WALKING_DOWNSTAIRS            SITTING           STANDING             LAYING
   1722               1544               1406               1777               1906               1944
```

#### 4.Appropriately labels the data set with descriptive variable names.
this code assign feature names containing mean () or std () to dataset column names.
```
names(extract_ds)[1:66] <- features[features_rows,]$V2
```
After that, the descriptive varaible names of data set are :
```
> names(extract_ds)
 [1] "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"           "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"           
 [5] "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"            "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"       
 [9] "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"         "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"        
[13] "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"       "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"       
[17] "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"        "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"         
[21] "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"           "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"          
[25] "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"      "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
[29] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"       "tBodyAccMag-mean()"          "tBodyAccMag-std()"          
[33] "tGravityAccMag-mean()"       "tGravityAccMag-std()"        "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"      
[37] "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"          "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
[41] "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"           "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"           
[45] "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"            "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
[49] "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
[53] "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"          "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"          
[57] "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"           "fBodyAccMag-mean()"          "fBodyAccMag-std()"          
[61] "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"     
[65] "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()"  "activity"                    "subject"  
```

#### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
Two steps have been taken to do this.  
First, this code transformed the data set to intermediate form(subject, activity, variable, value) using melt funcation.
```
tidy_ds <- melt(extract_ds, id=c('subject',"activity"), measure.vars=features[features_rows,]$V2)
```
```
> head(tidy_ds)
  subject activity          variable     value
1       1 STANDING tBodyAcc-mean()-X 0.2885845
2       1 STANDING tBodyAcc-mean()-X 0.2784188
3       1 STANDING tBodyAcc-mean()-X 0.2796531
4       1 STANDING tBodyAcc-mean()-X 0.2791739
5       1 STANDING tBodyAcc-mean()-X 0.2766288
6       1 STANDING tBodyAcc-mean()-X 0.2771988
```
Next, I used an aggregate function to calculate the average of each variable for each activity and each subject.
```
tidy_ds <- aggregate( value ~ subject+activity+variable , data=tidy_ds, mean)
colnames(tidy_ds)[4] <-c("avg")
```
Finally, we get a tidy data set of 11880 X 4 dimension.
```
> dim(tidy_ds)
[1] 11880     4
> head(tidy_ds)
  subject activity          variable       avg
1       1  WALKING tBodyAcc-mean()-X 0.2773308
2       2  WALKING tBodyAcc-mean()-X 0.2764266
3       3  WALKING tBodyAcc-mean()-X 0.2755675
4       4  WALKING tBodyAcc-mean()-X 0.2785820
5       5  WALKING tBodyAcc-mean()-X 0.2778423
6       6  WALKING tBodyAcc-mean()-X 0.2836589
```
#### Finally, Save the tidy data set as a text file.
write.table(tidy_ds, file="tidy_ds.txt",row.names = FALSE)
