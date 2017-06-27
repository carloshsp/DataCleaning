## Getting and Cleaning Data Course Project

## run_analysis.R

script intended to compile and clean data described in:
"http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones" 

original source: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Datasets:
The zip file contains data from Samsung Galaxy SII accelerometer and gyroscope analysed in 30 subjects under certain activities:
- LAYING
- SITTING
- STANDING
- WALKING
- WALKING DOWNSTAIRS
- WALKING UPSTAIRS

check originaldatasets.txt for more info

## Output:
tidydataset.txt file in working directory
tidydataset object in global environment

This tidydataset contains averages for each feature analysed from the signals grouped by subject and activity.
(see codebook.txt for more info)

## How the script works:
1) require needed libraries (tidyverse and data.table)
2) read needed datasets and convert them to tibbles (easier to print)
- generate one object for each original data file
3) adjust names of subject table and activity table to descriptive format
4) filter only means and standard deviations variables
- generate `filtered` and `selected` objects
5) compile test and train data
- generate `subyx` objects
6) adjust names to lowercase and w/o special characters
7) match activity labels to activity values
- generate `activity_label` and `run_data` objects 
8) create a dataset of variable means grouped by subject and activity
- generate `tidydataset` object
9) write `tidydataset.txt` to working directory 
