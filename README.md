GnCProject
==========

Project for Getting and Cleaning Data

The code run_analysis.R obtains data from smart phone inertial sensor tests. It runs with the data folder "UCI HAR Dataset" present in the working directory. These data were originally sourced from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The tidy data file is best read into R with the following command:
tidy_data <- read.table("FinalCleanData.txt")

Lines 1-10
The code first reads the features from features.txt, then the test_x(data) and test_y (outcome) from the corresponding files. It them obtains the subject ID list from subject_test.txt. The subject and measurement data are bound to the same datatable in testdata. 

Lines 12-16
The same is repeated with the training data set under traindata.

Lines 18-21
The training and test data are all combined under comdata with the feature names applied to the measurement columns. 

Lines 23-27
Activity_labels.txt is read into activity_labels. These names are merged with the activity labels in comdata to replace the numericla labels with descirptive names

Lines 29-31
Here the columns carrying mean() and std() functions of measured variables are selected using the 'grep' function

Lines 33-36:
The means of the above selected variables are calculated, segmented by Subject and Activity Type and written to the table with descriptive titles.