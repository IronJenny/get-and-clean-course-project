##Getting and Cleaning Data Course Project

## You should create one R script called run_analysis.R that does the following. 
## 01 Merges the training and the test sets to create one data set.
## 02 Extracts only the measurements on the mean and standard deviation for each measurement. 
## 03 Uses descriptive activity names to name the activities in the data set
## 04 Appropriately labels the data set with descriptive variable names. 
## 05 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## put this in instructions
## setwd("~/Documents/workspace/getdata-014")


library(dplyr)


## set variable to base directory
basedir <- "./UCI HAR Dataset"


## process base files: features.txt and activity_labels.txt

## read in activities.txt and assign descriptive column names
file <- paste(basedir, "activity_labels.txt", sep='/')
activities <- read.table(file, header = FALSE)
colnames(activities) <- c("activity_id", "activity_nm")
##head(activites)
##dim(activities)

## read in features.txt, 
## create unique, syntactically correct versions of each name, 
## and assign descriptive column names
file <- paste(basedir, "features.txt", sep='/')
features <- read.table(file, header = FALSE)
x <- make.names(features[,2], unique = TRUE)
x <- gsub("...", "()-", x, fixed = TRUE)
x <- gsub("..", "()", x, fixed = TRUE)
features <- cbind(features, x)
colnames(features) <- c("feature_id", "feature_nm", "unique_nm")
##head(features)
##dim(features)




## process test directory files: subject_test.txt, X_test.txt, Y_test.txt
testdir <- "test"

## read in subject_test.txt and assign descriptive column names
file <- paste(basedir, testdir, "subject_test.txt", sep = '/')
test_subjects <- read.table(file, header = FALSE)
colnames(test_subjects) <- "subject_id"
##head(test_subjects)
##dim(test_subjects)

## read in X_test and assign descriptive colunn names
file <- paste(basedir, testdir, "X_test.txt", sep = '/')
X_test <- read.table(file, header = FALSE)
colnames(X_test) <- features[,3] 

## read in Y_test and assign descriptive colunn names
file <- paste(basedir, testdir, "Y_test.txt", sep = '/')
Y_test <- read.table(file, header = FALSE)
colnames(Y_test) <- 'activity_id'
##head(Y_test)
##dim(Y_test)

## combine 3 test data frames into one by adding subject_id and activity_nm columns
te_all <- 
        cbind(X_test, test_subjects, Y_test) %>%
        inner_join(activities)


## process train directory files: subject_train.txt, X_train.txt, Y_train.txt
traindir <- "train"

## read in subject_train.txt and assign descriptive column names
file <- paste(basedir, traindir, "subject_train.txt", sep = '/')
train_subjects <- read.table(file, header = FALSE)
colnames(train_subjects) <- "subject_id"
##head(train_subjects)
##dim(train_subjects)

## read in X_train and assign descriptive colunn names
file <- paste(basedir, traindir, "X_train.txt", sep = '/')
X_train <- read.table(file, header = FALSE)
colnames(X_train) <- features[,3]
##head(X_train)
##dim(X_train)

## read in Y_train and assign descriptive colunn names
file <- paste(basedir, traindir, "Y_train.txt", sep = '/')
Y_train <- read.table(file, header = FALSE)
colnames(Y_train) <- 'activity_id'
##head(Y_train)
##dim(Y_train)

## combine 3 train data frames into one by adding subject_id and activity_nm columns
tr_all <- 
        cbind(X_train, train_subjects, Y_train) %>%
        inner_join(activities)
##dim(tr_all)
##names(tr_all)


## combine test and train dataframes
master <- bind_rows(te_all, tr_all)


## identify the measures (columns) to extract
m<-grep('-mean()', features[,2], fixed=TRUE, perl = FALSE)
s<-grep('-std()', features[,2], fixed=TRUE, perl = FALSE)
measures<-sort(c(m,s))
metrics<-as.vector(features[,3][measures])

## add subject_id and activity_nm to list of columns to keep
keep <- c("subject_id", "activity_nm", metrics)

## extract subset dataset containing those two keys plus std() and mean() metrics
df1 <- select(master, one_of(keep)) 



## revise the filtered dataset to move the individual column metrics 
## into a single column named "metric_val", 
## and add a column named "metric_nm" that identifies the metric
df2 <- reshape(df1, 
             varying = metrics, 
             v.names = "metric_val",
             timevar = "metric_nm", 
             times = metrics, 
             new.row.names = 1:700000,
             direction = "long")


## create a tidy dataset with the avg of each variable for each activity and subject
df3 <-
        df2 %>%
        group_by(subject_id, activity_nm, metric_nm) %>%
        summarise(avg=mean(metric_val))

## create a .txt file of the tidy dataset
write.table(df3, file="project_step5_tidy_dataset.txt", row.names=FALSE)
