##Getting and Cleaning Data Course Project - Code Book

#Source Dataset
The source dataset for this project is:

        Human Activity Recognition Using Smartphones Datset
        Version 1.0
        =======================================================================
        Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
        Smartlab - Non Linear Complex Systems Laboratory
        Via Opera Pia 11A, I-16145, Genoa, Italy.
        activityrecognition@smartlab.ws
        www.smartlab.ws
        =======================================================================
        Reference Publication:
        Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, and Jorge L.
        Reyes-Ortiz.  Human Activity Recognition on Smartphones, using a 
        Multiclass Hardware-Friendly Support Vector Machine.  International
        Workshop of Ambient Assisted Living (IWAAL 2012).  Victoria-Gasteiz,
        Spain.  Dec 2012.
        =======================================================================


#Transformations
        The script subsets the source dataset to extract those features whose 
        names end in std() or mean().  It reshapes the dataset from a wide
        format with one column per feature to a long format where one column
        contains the name of the feature and a second column contains the
        value. This reshaped dataset is then aggregated to compute the average 
        feature measurement by subject and activity.

#Resultant Data Set - Data Dictionary

|Data Element| Definition|Datatype|Values|
|----------------|-----------|----------|--------|
|subject_id|identifier of the subject who carried out the experiment| integer|1 to 30|
|activity_nm|name of the activity performed by the subject|string|LAYING|
||||SITTING|
||||STANDING|
||||WALKING|
||||WALKING_DOWNSTAIRS|
||||WALKING_UPSTAIRS|
|metric_nm|name of the feature|string|tBodyAcc.mean()-X|
||||tBodyAcc.mean()-Y|
||||tBodyAcc.mean()-Z|
||||tBodyAcc.std()-X|
||||tBodyAcc.std()-Y|
||||tBodyAcc.std()-Z|
||||tGravityAcc.mean()-X|
||||tGravityAcc.mean()-Y|
||||tGravityAcc.mean()-Z|
||||tGravityAcc.std()-X|
||||tGravityAcc.std()-Y|
||||tGravityAcc.std()-Z|
||||tBodyAccJerk.mean()-X|
||||tBodyAccJerk.mean()-Y|
||||tBodyAccJerk.mean()-Z|
||||tBodyAccJerk.std()-X|
||||tBodyAccJerk.std()-Y|
||||tBodyAccJerk.std()-Z|
||||tBodyGyro.mean()-X|
||||tBodyGyro.mean()-Y|
||||tBodyGyro.mean()-Z|
||||tBodyGyro.std()-X|
||||tBodyGyro.std()-Y|
||||tBodyGyro.std()-Z|
||||tBodyGyroJerk.mean()-X|
||||tBodyGyroJerk.mean()-Y|
||||tBodyGyroJerk.mean()-Z|
||||tBodyGyroJerk.std()-X|
||||tBodyGyroJerk.std()-Y|
||||tBodyGyroJerk.std()-Z|
||||tBodyAccMag.mean()|
||||tBodyAccMag.std()||
||||tGravityAccMag.mean()|
||||tGravityAccMag.std()||
||||tBodyAccJerkMag.mean()|
||||tBodyAccJerkMag.std()|
||||tBodyGyroMag.mean()|
||||tBodyGyroMag.std()|
||||tBodyGyroJerkMag.mean()|
||||tBodyGyroJerkMag.std()|
||||fBodyAcc.mean()-X|
||||fBodyAcc.mean()-Y|
||||fBodyAcc.mean()-Z|
||||fBodyAcc.std()-X|
||||fBodyAcc.std()-Y|
||||fBodyAcc.std()-Z|
||||fBodyAccJerk.mean()-X|
||||fBodyAccJerk.mean()-Y|
||||fBodyAccJerk.mean()-Z|
||||fBodyAccJerk.std()-X|
||||fBodyAccJerk.std()-Y|
||||fBodyAccJerk.std()-Z|
||||fBodyGyro.mean()-X|
||||fBodyGyro.mean()-Y|
||||fBodyGyro.mean()-Z|
||||fBodyGyro.std()-X|
||||fBodyGyro.std()-Y|
||||fBodyGyro.std()-Z|
||||fBodyAccMag.mean()|
||||fBodyAccMag.std()|
||||fBodyBodyAccJerkMag.mean()|
||||fBodyBodyAccJerkMag.std()|
||||fBodyBodyGyroMag.mean()|
||||fBodyBodyGyroMag.std()|
||||fBodyBodyGyroJerkMag.mean()|
||||fBodyBodyGyroJerkMag.std()|
|avg_metric_val|average of the feature measurements for each subject and activity|floating point|range -1 to 1|
