#The code book

## Overview Explanation

This exercise, that I have called HARDS Analysis (Human Activity Recognition Data Set Analysis), consist in analyse and study the data stored in a set of files generated from a experiment, where  a group of 30 people performed a serie of activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), wearing a smartphone with embedded accelerometer and gyroscope. The goal of this experiment is to study the [Human Activity Recognition] (https://en.wikipedia.org/wiki/Activity_recognition) since today it is easier and cheaper to survey data about it with the used of smartphones.

With the help of this smartphone was possible to get spatial, acceleration, velocity and angular values for the 3-axial, for the six activity performed by the people.

The files mentioned above are contained in a directory called *"UCI HAR Dataset"* and can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. This directory is structured as follow: 

![UCI HAR Dataset directory image](https://github.com/jalvarado1381/HARDS-Analysis/blob/master/UCI_HAR_Dataset_Structure2.png "UCI HAR Dataset directory")

As you can see at the image it is compound by two directories called **test** and **train**, containing the data obtained in  the experiment (X_test.txt and X_train.txt files), the README.txt (general information about experiment and the data)  and the files activity_labels.txt, features_info.txt and features.txt (these three last file made up the Code Book).

Our work consist in merge the files X_test.txt and X_train.txt located in the directories **test** and **train** respectively to build a data set from which we're going to take the means() and std() variables to create newly another data set with only those variables, once we have it, it is necessary to generate another new data set with the [average](https://en.wikipedia.org/wiki/Average#Arithmetic_mean) of each variable for each activity and each subject.

##Codes Book

The variables exposed here, are based on those ones contained in the codes book given  in the files features_info.txt and features.txt from the directory *"UCI HAR Dataset"*. By applying the functions grep function I reduced the quantity of variables from 561 to 66 variables and after adding the subjectid and activityname and activityid, the quantity of variables to work with was placed in 68.

The way as they were obtained was applying the  `mean()` function on the mean() and std() variables on original data set.

####Variables


- - - 
* **subjectid**

The Subject ID  used to identify the subject under analysis and its respective observations. 

It take values from 1 to 30, since 30 was the total of people in the research.

The number 1 represent the first person, the number 2 the second,  and so on...

At the final Data Set you're going to observe each value is repeated 6 times along with the variable activityname.

Class: Integer

Value Range: 1 - 30

      The number 1 represent the first person, the number 2 the second,  and so on...

- - -
* **activityname**

It represent each of the six activities performed by the subjects.

Class: Factor

Value Range: 6 levels

        "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"
            1              2                     3               4           5          6
- - -
* **tbodyaccmeanxAvg** 

Class: numeric 

- - -  
* **tbodyaccmeanyAvg** 

Class: numeric 

- - -  
* **tbodyaccmeanzAvg** 

Class: numeric 

- - -  
* **tgravityaccmeanxAvg** 

Class: numeric 

- - -  
* **tgravityaccmeanyAvg** 

Class: numeric 

- - -  
* **tgravityaccmeanzAvg** 

Class: numeric 

- - -  
* **tbodyaccjerkmeanxAvg** 

Class: numeric 

- - -  
* **tbodyaccjerkmeanyAvg** 

Class: numeric 

- - -  
* **tbodyaccjerkmeanzAvg** 

Class: numeric 

- - -  
* **tbodygyromeanxAvg** 

Class: numeric 

- - -  
* **tbodygyromeanyAvg** 

Class: numeric 

- - -  
* **tbodygyromeanzAvg** 

Class: numeric 

- - -  
* **tbodygyrojerkmeanxAvg** 

Class: numeric 

- - -  
* **tbodygyrojerkmeanyAvg** 

Class: numeric 

- - -  
* **tbodygyrojerkmeanzAvg** 

Class: numeric 

- - -  
* **tbodyaccmagmeanAvg** 

Class: numeric 

- - -  
* **tgravityaccmagmeanAvg** 

Class: numeric 

- - -  
* **tbodyaccjerkmagmeanAvg** 

Class: numeric 

- - -  
* **tbodygyromagmeanAvg** 

Class: numeric 

- - -  
* **tbodygyrojerkmagmeanAvg** 

Class: numeric 

- - -  
* **fbodyaccmeanxAvg** 

Class: numeric 

- - -  
* **fbodyaccmeanyAvg** 

Class: numeric 

- - -  
* **fbodyaccmeanzAvg** 

Class: numeric 

- - -  
* **fbodyaccjerkmeanxAvg** 

Class: numeric 

- - -  
* **fbodyaccjerkmeanyAvg** 

Class: numeric 

- - -  
* **fbodyaccjerkmeanzAvg** 

Class: numeric 

- - -  
* **fbodygyromeanxAvg** 

Class: numeric 

- - -  
* **fbodygyromeanyAvg** 

Class: numeric 

- - -  
* **fbodygyromeanzAvg** 

Class: numeric 

- - -  
* **fbodyaccmagmeanAvg** 

Class: numeric 

- - -  
* **fbodybodyaccjerkmagmeanAvg** 

Class: numeric 

- - -  
* **fbodybodygyromagmeanAvg** 

Class: numeric 

- - -  
* **fbodybodygyrojerkmagmeanAvg** 

Class: numeric 

- - -  
* **tbodyaccstdxAvg** 

Class: numeric 

- - -  
* **tbodyaccstdyAvg** 

Class: numeric 

- - -  
* **tbodyaccstdzAvg** 

Class: numeric 

- - -  
* **tgravityaccstdxAvg** 

Class: numeric 

- - -  
* **tgravityaccstdyAvg** 

Class: numeric 

- - -  
* **tgravityaccstdzAvg** 

Class: numeric 

- - -  
* **tbodyaccjerkstdxAvg** 

Class: numeric 

- - -  
* **tbodyaccjerkstdyAvg** 

Class: numeric 

- - -  
* **tbodyaccjerkstdzAvg** 

Class: numeric 

- - -  
* **tbodygyrostdxAvg** 

Class: numeric 

- - -  
* **tbodygyrostdyAvg** 

Class: numeric 

- - -  
* **tbodygyrostdzAvg** 

Class: numeric 

- - -  
* **tbodygyrojerkstdxAvg** 

Class: numeric 

- - -  
* **tbodygyrojerkstdyAvg** 

Class: numeric 

- - -  
* **tbodygyrojerkstdzAvg** 

Class: numeric 

- - -  
* **tbodyaccmagstdAvg** 

Class: numeric 

- - -  
* **tgravityaccmagstdAvg** 

Class: numeric 

- - -  
* **tbodyaccjerkmagstdAvg** 

Class: numeric 

- - -  
* **tbodygyromagstdAvg** 

Class: numeric 

- - -  
* **tbodygyrojerkmagstdAvg** 

Class: numeric 

- - -  
* **fbodyaccstdxAvg** 

Class: numeric 

- - -  
* **fbodyaccstdyAvg** 

Class: numeric 

- - -  
* **fbodyaccstdzAvg** 

Class: numeric 

- - -  
* **fbodyaccjerkstdxAvg** 

Class: numeric 

- - -  
* **fbodyaccjerkstdyAvg** 

Class: numeric 

- - -  
* **fbodyaccjerkstdzAvg** 

Class: numeric 

- - -  
* **fbodygyrostdxAvg** 

Class: numeric 

- - -  
* **fbodygyrostdyAvg** 

Class: numeric 

- - -  
* **fbodygyrostdzAvg** 

Class: numeric 

- - -  
* **fbodyaccmagstdAvg** 

Class: numeric 

- - -  
* **fbodybodyaccjerkmagstdAvg** 

Class: numeric 

- - -  
* **fbodybodygyromagstdAvg** 

Class: numeric 

- - -  
* **fbodybodygyrojerkmagstdAvg**

Class: numeric
