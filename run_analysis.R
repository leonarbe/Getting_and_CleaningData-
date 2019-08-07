# Getting and Cleaning Data Project week 4

# Initialize dataFrames

X_train <- Y_train <- Subject_train <- X_test <- Y_test <- Subject_test <-  Subject_test <- NULL

# load dplyr library, needed later for completing assignment
library(dplyr)

# For string manipulation on this script
library(stringr)

# Read source files
# Assume "train" and "test" folders are one level down from where this script is located

# Load Names of activities
Activities <- tbl_df(read.csv2('.\\activity_labels.txt', sep = "" , header = FALSE))
# Convert all Values to lower case and removing the ID column, no need to use it since the index matches the Id
Activities <- mutate_all(Activities, funs(tolower))
# Convert ID to integer
Activities <- mutate(Activities, V1 = as.integer(V1))

# Read Train files and directly Convert to 'data frame tbl'

X_train <- tbl_df(read.csv2('.\\X_train.txt', sep = "", header = FALSE , stringsAsFactors = FALSE))
Y_train <- tbl_df(read.csv2('.\\Y_train.txt', sep = "", header = FALSE ))
Subject_train <- tbl_df(read.csv2('.\\Subject_train.txt', sep = "" , header = FALSE))

# Read Test files and directly Convert  to 'data frame tbl'

X_test <- tbl_df(read.csv2('.\\X_test.txt', sep = "", header = FALSE ))
Y_test <- tbl_df(read.csv2('.\\Y_test.txt', sep = "" , header = FALSE))
Subject_test <- tbl_df(read.csv2('.\\Subject_test.txt', sep = "" , header = FALSE))

# load Column names as a vector to be used later to apply for meaningful variable names 
# for X_test and X_train data frames
X_Feat <- read.csv2('.\\features.txt', sep = "", header = FALSE)

# In order to avoid column name duplication, I'll add the ID at the beginning of the
# variable name
X_Features <- paste(X_Feat[,1],X_Feat[,2], sep = "_")

# Remove special characters from feature names
# Remove ()
X_Features<-gsub("\\(\\)","", X_Features)
# Replace "-" with "_"
X_Features<-gsub("\\-","_", X_Features)
# Replace "," with "_"
X_Features<-gsub("\\,","_", X_Features)
# Replace "(" with "_"
X_Features<-gsub("\\(","_", X_Features)
# Remove ")"
X_Features<-gsub("\\)","", X_Features)

# Set all feature names to lower case
X_Features <- tolower(X_Features)

# Merge files

X_merged <- rbind(X_train, X_test)
Y_merged <- rbind(Y_train, Y_test)
Subject_merged <- rbind(Subject_train, Subject_test)

# REname column header for Subjects vector
names(Subject_merged) <- 'subject_id'

# Rename columns in the features dataframe
# Loop to rename all 561 columns of the merged Features matrix using the Vector containing
# the correct names.
for(i in 1:ncol(X_merged)){
  names(X_merged)[i] <- as.character(X_Features[i])
}

# Create physical merged dataframe file of test and training sets of data
X_merged <- tbl_df(sapply(X_merged,as.numeric))
write.table(X_merged, "X_merged.txt",  row.names = FALSE)

# Add column with meaninful names for activities instead of numerals,
# e.g. 1 = 'walking'
Y_merged <- merge(Y_merged, Activities, by.x = "V1", by.y = "V1")
# Leave only the activity name
Y_merged <- Y_merged[,2]


# New Dataframe with Extracted features containing the words "mean" and "std" 
# in column name of the data frame

Extracted_Mean_Std <- select(X_merged, contains("mean"), contains("std"))

# Convert string values in the dataframe to numeric
Extracted_Mean_Std <- tbl_df(sapply(Extracted_Mean_Std,as.numeric))

# Add two columns coming from Activities and subjects vectors 
# to Extracted_Mean_Std
Extracted_Mean_Std <- cbind(Extracted_Mean_Std, Subject_merged, Y_merged)
# Rename last column to a meaningful name "activity"
names(Extracted_Mean_Std)[ncol(Extracted_Mean_Std)] <- "activity"

# Dataframe that contains ndependent tidy data set with the average of each
# variable for each activity and each subject.
Summary_Avrg_Feat_Activities_Subject <- Extracted_Mean_Std %>%
  group_by(subject_id, activity) %>%
  summarize_all(funs(mean))

# Create physical Summary_Avrg_Feat_Activities_Subject.txt file from dataframe
write.table(Summary_Avrg_Feat_Activities_Subject, "Summary_Avrg_Feat_Activities_Subject.txt",  row.names = FALSE)

  




