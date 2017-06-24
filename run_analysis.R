# run_analysis.R
## script intended to analyse data described in "http://archive.ics.uci.edu/ml/
## datasets/Human+Activity+Recognition+Using+Smartphones"
## data will be compiled in a tidier e more understandable format

## first, require needed libraries
require(data.table)
require(tidyverse)

## read needed data tables and convert them to tibbles
x_train <- as.tibble(fread("train/X_train.txt"))
x_test <- as.tibble(fread("test/X_test.txt"))
y_train <- as.tibble(fread("train/y_train.txt"))
y_test <- as.tibble(fread("test/y_test.txt"))
subject_test <- as.tibble(fread("test/subject_test.txt"))
subject_train <- as.tibble(fread("train/subject_train.txt"))
features <- as.tibble(fread("features.txt"))
activity <- as.tibble(fread("activity_labels.txt"))

## adjust names
names(subject_test) <- "subject"
names(subject_train) <- "subject"
names(y_test) <- "activity"
names(y_train) <- "activity"

## filter mean and std features - rename varibales
features_filtered <- filter(features, grepl("mean", V2) | grepl("std", V2))
x_test_select <- select(x_test, features_filtered$V1)
names(x_test_select) <- features_filtered$V2 
x_train_select <- select(x_train, features_filtered$V1)
names(x_train_select) <- features_filtered$V2 

## add subject and y tables to x tables
subyx_train <- cbind(subject_train, y_train, x_train_select)
subyx_test <- cbind(subject_test, y_test, x_test_select)

## merge train and test data, sort by subject and activity
subyx_all <- rbind(subyx_train, subyx_test)
subyx_sorted <- arrange(subyx_all, subject, activity)

## adjust names to lowercase and delete non-alphanumeric
names(subyx_sorted) <- gsub("[^[:alnum:]]", "", names(subyx_sorted))

## substitute activity number to activity values
activity_label <- activity$V2[match(subyx_sorted$activity, activity$V1)]
run_data <- mutate(subyx_sorted, activity = activity_label)

## create new dataset with averages for each variable on each subject/activity
tidydataset <- run_data %>%
        group_by(subject, activity) %>%
        summarize_all(mean)

## create txt file for output
write.table(tidydataset, "tidydataset.txt", row.names = FALSE)
message("== file 'tidydataset.txt' created in working directory ==")
