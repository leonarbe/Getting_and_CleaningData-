# Codebook for Getting and Cleaning Data Project

## Source Data files info

Instructions about the content of the train and test files
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The files (Original source, where I copied the files into the two subdirectories)
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Files included in this repository
* Other_Files.zip - Contains:
1. activity_labels.txt
2. features.txt

* Test_Files.zip
1. X_test.txt
2. y_test.txt
3. subject_test.txt

* Train_Files.zip
1. X_train.txt
2. y_train.txt
3. subject_train.txt


## Tidy Data Set description

* Extracted_Mean_Std
  Dataframe of Extracts only the measurements on the mean and standard deviation for each measurement

* Summary_Avrg_Feat_Activities_Subject
  Contains the average of each variable for each activity and each subject, based on the previouly created dataframe ""

## Variables used
* Activities
  Load Names of activities

* X_train: Loads X_train file
* Y_train: Loads Y_train file
* Subject_train load Subject_train file

* X_test: Loads X_test file
* Y_test: Loads Y_test file
* Subject_test load Subject_test file


## Transformations performed



