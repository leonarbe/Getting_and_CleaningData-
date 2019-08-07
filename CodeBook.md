# Codebook for Getting and Cleaning Data Project

## Source Data files info

Instructions about the content of the train and test files
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The files (Original source, where I copied the files into the two subdirectories)
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Libraries used
### load dplyr library, needed later for completing assignment
library(dplyr)

### For string manipulation on this script
library(stringr)

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

* Summary file:
1. Summary_Avrg_Feat_Activities_Subject.txt

## Tidy Data Set description

### Extracted_Mean_Std
  Dataframe of Extracts only the measurements on the mean and standard deviation for each measurement

### Summary_Avrg_Feat_Activities_Subject
  Contains the average of each variable for each activity and each subject, based on the previouly created dataframe ""

## Variables used
### Activities
  Load Names of activities

### X_train: 
Loads X_train file

### Y_train: 
Loads Y_train file

### Subject_train 
loads Subject_train file

### X_test: 
Loads X_test file

### Y_test: 
Loads Y_test file

### Subject_test 
loads Subject_test file

### X_Feat
load Column names as a vector to be used later to apply for meaningful variable names 
for X_test and X_train data frames

### X_Features: 
This Vector will cotnain the variables names concatenated with the ID In order to avoid column name duplication, 

### X_merged: this dataframe will contain both test and train variable measurements

### Y_Merged: 
this dataframe will contain both test and train activitiies (labels

### Subject_merged: 
this dataframe will contain both test and train Subjects

# Information about Train and test data files, 

## Information about the features is included in the file "features.txt".

## Information about the datasets
Detail information about the source files is provided here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#
