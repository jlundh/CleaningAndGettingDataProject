Code Book
========================================================

This repo contains a tidied version of the UCI _Human Activity Recognition Using Smartphones Data Set_. From the [description of the original dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones):
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

[The original data set]https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip contains a file called `features_info.txt` with a description on how these features were collected and processed in the first place:

The tidied data set consists of a table of 30 subjects and 6 different activities. Apart from subjects and activities only the mean (`mean()`)and standard deviation (`std()`) variables have been extracted from the original data set. The observations have also been aggregated and the columns (3:end) now represents the *averages* of all the observations for that particular (subject, activity) pair.
