#About
The get-and-clean-course-project repository contains an R script that implements the course project for the class, Getting and Cleaning Data.

##The assignment
Using the Human Activity Recognition dataset, create an R script named run_analysis.R that does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Assumptions
1. The setwd() command has been issued to set your working directory.
2. The source dataset, https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, has been downloaded and uncompressed into a subdirectory of your working directory.  The subdirectory is named "UCI HAR Dataset".
3. Your operating system is Mac, Linux, or Unix.
4. You have the dplyr library installed.


#What the script does

##Step 1: Processes the reference data files
a)  Reads the "activities.txt" file into a dataframe named "activities" and assigns the column names of "activity_id" and "activity_nm" to the dataframe.

b)  Reads the "features.txt" file into a dataframe named "features". The first column is an index and the second column contains the name of the feature.  The feature names are not unique, so the script uses the make.names() function to create a vector of unique names.  This vector is further cleaned up to make the unique names more readable.  This vector of unique names is appended as a third column in the features dataframe. It will be used in a later step to assign variable names. The names -- "feature_id", "feature_nm", and "unique_nm" -- are assigned to the data frame columns.

##Step 2: Processes the test directory files
a)  Reads the "subject_test.txt" file into the "test_subjects" dataframe and assigns the column name of "subject_id".

b)  Reads the "X_test.txt" file into the "X_test" dataframe and uses the "unique_nm" column from the "features" dataframe to name the "X_test" dataframe columns.

c)  Reads the "Y_test.txt" file into the "Y_test" dataframe and assigns the column name of "activity_id".

d)  Creates a new dataframe by combining the "X_test", "test_subjects", "Y_test", and "activites" dataframes.  Each row of this dataframe contains 561 columns of features, the identifier of the associated subject, the identifier of the associated activity, and the name of the activity.

##Step 3: Processes the train directory files
The train directory files are processed in the same way as the test directory files, resulting in a dataframe with the same column configuration as the test dataframe, but with 7352 rows in comparison to the test dataframe's 2947 rows.

##Step 4: Merges the test and train datasets
The expanded test and train dataframes are combined into a single dataframe with 10299 rows and 564 columns.

##Step 5: Extract only the measurements on the mean and standard deviation
a)  Using the "features" dataframe, identify those items that correspond to mean() and std() measurements.  The result is 66 items.

b)  Create a new dataframe that extracts the selected features columnsas well as the "subject_id" and the "activity_nm" columns from the combined test and train dataframe created in Step 4, above.

c)  Reformat the dataframe to move the 66 features columns into a set of name/value columns named "metric_nm" and "metric_val", while retaining the "subject_id" and "activity_nm" colunns.

##Step 6: Create a tidy dataset with the avg of each metric for each activity and subject
a)  Use the group_by function to group the dataframe by subject_id, activity_nm, and metric_nm.

b)  Use the summarize function to calculate the mean of the metric_val in each group.

##Step 7: Create a .txt file of the tidy dataset
a)  Use the write.table function with row.names = FALSE to create a .txt file of the tidy dataset.  The file is named "project_step5_tidy_dataset.txt", where step5 refers to the 5th step of the assignment.
