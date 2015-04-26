Human Activity Recognition Using Smartphones Dataset
========


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING,
LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and 
gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 
50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been
randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training
data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then 
sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor 
acceleration signal, which has gravitational and body motion components, was separated using a 
Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to 
have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each 
window, a vector of features was obtained by calculating variables from the time and frequency domain.
(The complete list of features is available in 'features.txt' file.)

The set of variables that were estimated from these signals include mean value and standard deviation. 
After the data (subject\_train.txt, subject\_test.txt, features.txt, activity\_labels.txt, X\_train.txt, X\_test.txt, 
Y\_train.txt, Y\_test.txt) was loaded into R, all measurements (features) except those on the mean and 
standard deviation were removed from the data set. This resulted with data set of 10299 obseervations
of 68 variables. Additionally, activities were replaced with descriptive names instead of numbers and
names of variables were somewhat changed. 

Dataset was then grouped by subject and activity, and for every subset, mean value was calculated. That mean 
was stored in new tidy dataset (180 observations of 68 variables) where each row represents average of 
each variable for each activity and each subject.

Notes:  To run run\_analysis.R in R, package dplyr needs to be installed.


url of original dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity
Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International 
Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the 
authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

