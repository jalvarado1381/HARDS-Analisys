HARDS Analysis
=====================

## Overview Explanation

This exercise, that I have called HARDS Analysis (Human Activity Recognition Data Set Analysis), consist in analyse and study the data stored in a set of files generated from a experiment, where  a group of 30 people performed a serie of activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), wearing a smartphone with embedded accelerometer and gyroscope. The goal of this experiment is to study the [Human Activity Recognition] (https://en.wikipedia.org/wiki/Activity_recognition) since today it is easier and cheaper to survey data about it with the used of smartphones.

With the help of this smartphone was possible to get spatial, acceleration, velocity and angular values for the 3-axial, for the six activity performed by the people.

The files mentioned above are contained in a directory called *"UCI HAR Dataset"* and can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. This directory is structured as follow: 

![UCI HAR Dataset directory image](https://github.com/jalvarado1381/HARDS-Analysis/blob/master/UCI_HAR_Dataset_Structure.png "UCI HAR Dataset directory")

As you can see at the image it is compound by two directories called **test** and **train**, containing the data obtained in  the experiment (X_test.txt and X_train.txt files), the README.txt (general information about experiment and the data)  and the files activity_labels.txt, features_info.txt and features.txt (these three last file made up the Code Book).

Our work consist in merge the files X_test.txt and X_train.txt located in the directories **test** and **train** respectively to build a data set from which we're going to take the means() and std() variables to create newly another data set with only those variables, once we have it, it is necessary to generate another new data set with the [average](https://en.wikipedia.org/wiki/Average#Arithmetic_mean) of each variable for each activity and each subject.

##Script Explanation

For the development of this script I was focused on only using the base library of R, so you will find I only the used of base functions an tools for completing the requirements.

The script is divided into 5 parts. You will be able to identify each part for a sharp rectangles I made around them.

#####1.- Merging  the training and the test sets.

In this part I made used of read.table, cbind and rbind to read and merge the files and data frames.
Here I read most of the files I am going to use througth the script and built the main data frame, I named hards, from which I'll get all the data to reach  the tidy data set required. 

#####2.- Extracting the measurements on the mean and standard deviation for each measurement.

Using the grep and names functions I could obtain all mean and std variables associated with the pattern strings "mean()" and "std()"

        `meanstdVariables <- c(grep("mean()", names(hards), fixed=TRUE), grep("std()",names(hards), fixed=TRUE))`

#####3.- Translating numbers to descritive names, for activities.

Here, it is necessary to match the activities names with corresponding number in the file activity_labels.txt in the way it could fix perfectly in the data set.

        activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)
        
        for (activity in activityLabels[[1]]){
                hards$Activities[hards$Activities==activity] <- activityLabels[activity,2]
        }

#####4.- Working on variable names.

I applied the sub, gsub, tolower and paste functions to build the names of the new variables. 

As you can see I had to escape parenthesis characters for being able to eliminate it and having cleaned variables.

#####5.- Calculating the new variables and creating the new Data Set and storing it to a file.

At last 

##How to execute the script run_analysis.R

1.- Clone the repository HARDS-Analysis from github

        git clone https://github.com/jalvarado1381/HARDS-Analysis.git

2.- Download the directory *"UCI HAR Dataset"* from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), uncompress and copy it to the directory HARDS-Analysis, created by the cloned proccess in step 1.
  
3.- Open the R console or R Studio and setup the directory HARDS-Analysis as your working directory.
  
    Example:
    
        1.-  $ R ## Executing R in your GNU/Linux or Mac command line
   
        2.-  > setwd("PATH_WHERE_YOU_HAVE_THE_REPOSITORY/HARDS-Analysis") ## Executing setwd() in R prompt
  

4.- Once you set HARDS-Analysis as your working directory execute: 

        source("run_analysis.R")

##Data set Source
If you want more information about the original data set you can go [here]( http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
