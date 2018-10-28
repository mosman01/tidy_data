# Assignment - Week 4
Analysing fitness data

The aim of the project is to clean and extract usable data from the Samsung Galaxy smartphone motion sensors file. R script called run_analysis.R

## What this R file does?!
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set (tidy_data.txt) with the average of each variable for each activity and each subject.

## Files included:
* run_analysis.R : the R-code to read and manipulate data set
* tidy_data.txt : the clean data extracted from the original data using run_analysis.R
* CodeBook.md : the CodeBook reference to the variables in tidy_data.txt
* README.md : the analysis description of the code in run_analysis.R

## Required Libraries:

* library(data.table)
