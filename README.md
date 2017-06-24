## Getting and Cleaning Data Course Project

## run_analysis.R

script intended to compile and clean data described in "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"
original source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Datasets:
The zip file contains data from Samsung SII motion sensors in 30 subjects under certain activities

## Output:
tidydataset.txt file in working directory
tidydataset object in global environment

## How the script works:
1) require needed libraries (tidyverse and data.table)
2) read needed datasets and convert them to tibbles (easier to print)
3) adjust names to descriptive format
4) filter only means and standard deviations variables
5) compile test and train data
6) adjust names to lowercase and w/o special characters
7) match activity labels to activity values
8) create a data set
