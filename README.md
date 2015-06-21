HARDS Analysis
=====================
[Overview Explanation](https://github.com/jalvarado1381/HARDS-Analysis/blob/master/README.md#overview-explanation)

[Script Explanation](https://github.com/jalvarado1381/HARDS-Analysis/blob/master/README.md#script-explanation)

[How to execute the script run_analysis.R](https://github.com/jalvarado1381/HARDS-Analysis/blob/master/README.md#How-to-execute-the-script-run-analysis.R)

## Overview Explanation

This exercise, that I have called HARDS Analysis (Human Activity Recognition Data Set Analysis), consist in analyse and study the data stored in a set of files generated from a experiment, where  a group of 30 people performed a serie of activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), wearing a smartphone with embedded accelerometer and gyroscope. The goal of this experiment is to study the [Human Activity Recognition] (https://en.wikipedia.org/wiki/Activity_recognition) since today it is easier and cheaper to survey data about it with the used of smartphones.

With the help of this smartphone was possible to get spatial, acceleration, velocity and angular values for the 3-axial, for the six activity performed by the people.

The files mentioned above are contained in a directory called *"UCI HAR Dataset"* and can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). This directory is structured as follow: 

![UCI HAR Dataset directory image](https://github.com/jalvarado1381/HARDS-Analysis/blob/master/UCI_HAR_Dataset_Structure2.png "Image generated in GNU/Linux with the command tree - version 1.6.0")

As you can see at the image it is compound by two directories called **test** and **train**, containing the data obtained in  the experiment (X_test.txt and X_train.txt files), the README.txt (general information about experiment and the data)  and the files activity_labels.txt, features_info.txt and features.txt (these three last file made up the codebook).

Our work consist in merge the files X_test.txt and X_train.txt located in the directories **test** and **train** respectively to build a data set from which we're going to take the means() and std() variables to create newly another data set with only those variables, once we have it, it is necessary to generate another new data set with the [average](https://en.wikipedia.org/wiki/Average#Arithmetic_mean) of each variable for each activity and each subject.

##Script Explanation

For the development of this script I was focused on only using the base library of R, so you will notice that only appear basic functions and tools for completing the requirement.

The R script is divided into 5 parts. For helping to identify them  I made a sharp rectangles around them. 

Each of the parts are explained too in following lines:

##### 1.- Merging  the training and the test sets.

In this part I made used of read.table, cbind and rbind to read and merge the files and data frames.
Here I read most of the files I am going to use througth the script and built the main data frame, I named hards, from which I'll get all the data to reach  the tidy data set required. 

##### 2.- Extracting the measurements on the mean and standard deviation for each measurement.

Using the grep and names functions I could obtain all mean and std variables associated with the pattern strings "mean()" and "std()"

        meanstdVariables <- c(grep("mean()", names(hards), fixed=TRUE), grep("std()",names(hards), fixed=TRUE))

##### 3.- Translating numbers to descritive names, for activities.

Here, it is necessary to match the activities names with corresponding number in the file activity_labels.txt in the way it could fix perfectly in the data set.

        activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)
        
        for (activity in activityLabels[[1]]){
                hards$Activities[hards$Activities==activity] <- activityLabels[activity,2]
        }

##### 4.- Working on variable names.

I applied the sub, gsub, tolower and paste functions to build the names of the new variables. 

As you can see I had to escape parenthesis characters for being able to eliminate it to clean the variables and create new ones.

##### 5.- Calculating the new variables and creating the new Data Set and storing it to a file.

 I mainly made used of 2 **for loops** and the functions ```mean()```, ```lapply()``` and ```rbind.data.frame()```.

Within the first for loop were calculated the new variables using ```mean()``` and  ```lapply()``` and collected in two temporal list (```hardsListActivities``` and ```hardsListSubjects``` ).

Withing the second for loop were grouped all the observations collected in ```hardsListSubjects``` list and saved into a data frame(```finalhards```).

At last, ```finalhards``` was merged with the data frame ```idfields```, that has the new arrangements of the ```subjectid``` and ```activityname``` variables, using the function ```cbind()```.

##How to execute the script run_analysis.R

1.- Clone the repository HARDS-Analysis from github

        git clone https://github.com/jalvarado1381/HARDS-Analysis.git

2.- Download the directory *"UCI HAR Dataset"* from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), uncompress and copy it to the directory HARDS-Analysis, created by the cloned proccess in step 1.
  
3.- Open the R console or R Studio and setup the directory HARDS-Analysis as your working directory.
  
    Example:
    
        $ R ## Executing R in your GNU/Linux, Mac or Windows command line
        > setwd("PATH_WHERE_YOU_HAVE_THE_REPOSITORY/HARDS-Analysis") ## Executing setwd() in R prompt
  
4.- Once you set HARDS-Analysis as your working directory execute: 

        source("run_analysis.R")

Through the execution, it prints a line indicating each of the part it is executing. So you have to see something like this when it finish:

        1.- Merging  the training and the test sets.
        2.- Extracting the measurements on the mean and standard deviation for each measurement.
        3.- Translating numbers to descritive names, for activities.
        4.- Working on variable names.
        5.- Creating the new Data Set and and taking it to a file.
        The file "finalhards.txt" has been created in the working directory /home/jalvarado/cursos_r/coursera/getdata-015/project/HARDS-Analisys.

It indicate the execution was success and you have a new data.frame object created called `finalhards` and a new file in your working directory called `finalhards.txt`, where are stored a copy of the tidy data required.

**NOTES**: For information about the variables in this data set please  refer to its [codebook](https://github.com/jalvarado1381/HARDS-Analysis/blob/master/CodeBook.MD).

##Data set Source
If you want more information about the original data set you can go [here]( http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
