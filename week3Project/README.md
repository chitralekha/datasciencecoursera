This project of coursera has a objective of creating a tidydata set which gets the average value of each mean and standard variable for each subject and activity id.

The dataset includes the following files:

- 'README.md'

- 'CodeBook.md': shows information about the variables used in the tidy data set.

- 'run_analysis.R': Script to read the data and get the tidy data set that provides the average of all mean and standard deviation
   values for each subject and each activity.
   
To get the tidy data set we have to perform the below steps.

-read the files from test set.
-assign the column names for activity table and subject table.
-make the features(xtest) column names readable by getting rid of extra characters. This involved getting rid of "." and "()" and 
 selecting just std and mean variables
-merge all the tables of test.
-read the files from train set.
-assign the column names for activity table and subject table.
-make the features(ytest) column names readable by getting rid of extra characters.This involved getting rid of "." and "()" and 
 selecting just std and mean variables
-merge all the tables of train.
-Merge the train and test data.
-Create the tidy data.
-Have the tidayData sorted by subject id and activity id for easier viewing.