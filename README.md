HARDS Analysis
=====================

## Problem and Data Set Analysis

I have a set of files that store data generated from a experiment, where  a group of 30 people performed a serie of activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone with embedded accelerometer and gyroscope. The goal of this experiment is to study the [Human Activity Recognition] (https://en.wikipedia.org/wiki/Activity_recognition) since today it is easier and cheaper to survey data about it with the used of smartphones.

With the help of this smartphone was possible to get spatial, acceleration, velocity and angular values for the 3-axial, for each activity performed by people.

The files mentioned above are contained in a directory called "UCI HAR Dataset" that is structured as follow: 

![CI HAR Dataset directory](https://github.com/jalvarado1381/HARDS-Analysis/blob/master/UCI_HAR_Dataset_Structure.png "UCI HAR Dataset directory")

As you can see at the image it is compound by two directories called **test** and **train**, containing the data obtained in experiment, the README.txt (General information about experiment and the data ) file and the files activity_labels.txt, features_info.txt and features.txt (Code Book).

Human Activity Recognition Data Set we'll get a new tidy data set.

[Arithmetic_mean](https://en.wikipedia.org/wiki/Arithmetic_mean)

[Average](https://en.wikipedia.org/wiki/Average#Arithmetic_mean)

##Script Explanation

1.- Merging  the training and the test sets.

2.- Extracting the measurements on the mean and standard deviation for each measurement.

3.- Translating numbers to descritive names, for activities.

4.- Working on variable names.

5.- Creating the new Data Set and and taking it to a file.

##How to execute the script

##Data set Source
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
