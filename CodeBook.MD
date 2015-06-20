#Codebook

## Overview Explanation

This exercise, that I have called HARDS Analysis (Human Activity Recognition Data Set Analysis), consist in analyse and study the data stored in a set of files generated from a experiment, where  a group of 30 people performed a serie of activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), wearing a smartphone with embedded accelerometer and gyroscope. The goal of this experiment is to study the [Human Activity Recognition] (https://en.wikipedia.org/wiki/Activity_recognition) since today it is easier and cheaper to survey data about it with the used of smartphones.

With the help of this smartphone was possible to get spatial, acceleration, velocity and angular values for the 3-axial, for the six activity performed by the people.

The files mentioned above are contained in an directory called *"UCI HAR Dataset"* and can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). This directory is structured as follow: 

![UCI HAR Dataset directory image](https://github.com/jalvarado1381/HARDS-Analysis/blob/master/UCI_HAR_Dataset_Structure2.png "UCI HAR Dataset directory")

**Above image was generated in GNU/Linux using the command ```tree - version 1.6.0```**

As you can see at the image *"UCI HAR Dataset"* is compound by two subdirectories called **test** and **train**, containing the data obtained in  the experiment (X_test.txt and X_train.txt files), the README.txt (general information about experiment and the data)  and the files activity_labels.txt, features_info.txt and features.txt (these three last file made up the Code Book).

Our work consist in merge the files X_test.txt and X_train.txt located in the directories **test** and **train** respectively to build a data set from which we're going to take the means() and std() variables to create newly another data set with only those variables, once we have it, it is necessary to generate another new data set with the [average](https://en.wikipedia.org/wiki/Average#Arithmetic_mean) of each variable for each activity and each subject.

##Variables

The variables exposed here, are based on those ones contained in the codebook given  in the files features_info.txt and features.txt from the directory *"UCI HAR Dataset"*. 

By applying the functions grep function I reduced the quantity of variables from 561 to 66, that are the total of variables with the pattern strings "mean()" and "std()", and after adding the subjectid and activityname, the quantity of variables to work with was placed in 68.

The way as they were obtained was applying the  `mean()` function on the mean() and std() variables on original data set.

####List of variables

- - - 
[1] **subjectid**

The Subject ID  used to identify the subject under analysis and its respective observations. 

It take values from 1 to 30, since 30 was the total of people in the research.

The number 1 represent the first person, the number 2 the second,  and so on...

At the final Data Set you're going to observe each value is repeated 6 times along with the variable activityname.

	Class: Integer

	Value Range: 1 - 30

      		The number 1 represent the first person, the number 2 the second one,  and so on...

- - -
[2] **activityname**

It represent each of the six activities performed by the subjects.

	Class: Factor

	Values range: 6 levels

        	"WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"
        	1              2                     3               4           5          6
- - -
[3] **tbodyaccmeanxAvg**

	Class: numeric 
	Min: 0.2216       Max: 0.3015
	
- - -  
[4] **tbodyaccmeanyAvg**

	Class: numeric 

- - -  
[5] **tbodyaccmeanzAvg**

	Class: numeric 

- - -  
[6] **tgravityaccmeanxAvg**

	Class: numeric 

- - -  
[7] **tgravityaccmeanyAvg**

	Class: numeric 

- - -  
[8] **tgravityaccmeanzAvg**

	Class: numeric 

- - -  
[9] **tbodyaccjerkmeanxAvg**

	Class: numeric 

- - -  
[10] **tbodyaccjerkmeanyAvg**

	Class: numeric 

- - -  
[11] **tbodyaccjerkmeanzAvg**

	Class: numeric 

- - -  
[12] **tbodygyromeanxAvg**

	Class: numeric 

- - -  
[13] **tbodygyromeanyAvg**

	Class: numeric 

- - -  
[14] **tbodygyromeanzAvg**

	Class: numeric 

- - -  
[15] **tbodygyrojerkmeanxAvg**

	Class: numeric 

- - -  
[16] **tbodygyrojerkmeanyAvg**

	Class: numeric 

- - -  
[17] **tbodygyrojerkmeanzAvg**

	Class: numeric 

- - -  
[18] **tbodyaccmagmeanAvg**

	Class: numeric 

- - -  
[19] **tgravityaccmagmeanAvg**

	Class: numeric 

- - -  
[20] **tbodyaccjerkmagmeanAvg**

	Class: numeric 

- - -  
[21] **tbodygyromagmeanAvg**

	Class: numeric 

- - -  
[22] **tbodygyrojerkmagmeanAvg**

	Class: numeric 

- - -  
[23] **fbodyaccmeanxAvg**

	Class: numeric 

- - -  
[24] **fbodyaccmeanyAvg**

	Class: numeric 

- - -  
[25] **fbodyaccmeanzAvg**

	Class: numeric 

- - -  
[26] **fbodyaccjerkmeanxAvg**

	Class: numeric 

- - -  
[27] **fbodyaccjerkmeanyAvg**

	Class: numeric 

- - -  
[28] **fbodyaccjerkmeanzAvg**

	Class: numeric 

- - -  
[29] **fbodygyromeanxAvg**

	Class: numeric 

- - -  
[30] **fbodygyromeanyAvg**

	Class: numeric 

- - -  
[31] **fbodygyromeanzAvg**

	Class: numeric 

- - -  
[32] **fbodyaccmagmeanAvg**

	Class: numeric 

- - -  
[33] **fbodybodyaccjerkmagmeanAvg**

	Class: numeric 

- - -  
[34] **fbodybodygyromagmeanAvg**

	Class: numeric 

- - -  
[35] **fbodybodygyrojerkmagmeanAvg**

	Class: numeric 

- - -  
[36] **tbodyaccstdxAvg**

	Class: numeric 

- - -  
[37] **tbodyaccstdyAvg**

	Class: numeric 

- - -  
[38] **tbodyaccstdzAvg**

	Class: numeric 

- - -  
[39] **tgravityaccstdxAvg**

	Class: numeric 

- - -  
[40] **tgravityaccstdyAvg**

	Class: numeric 

- - -  
[41] **tgravityaccstdzAvg**

	Class: numeric 

- - -  
[42] **tbodyaccjerkstdxAvg**

	Class: numeric 

- - -  
[43] **tbodyaccjerkstdyAvg**

	Class: numeric 

- - -  
[44] **tbodyaccjerkstdzAvg**

	Class: numeric 

- - -  
[45] **tbodygyrostdxAvg**

	Class: numeric 

- - -  
[46] **tbodygyrostdyAvg**

	Class: numeric 

- - -  
[47] **tbodygyrostdzAvg**

	Class: numeric 

- - -  
[48] **tbodygyrojerkstdxAvg**

	Class: numeric 

- - -  
[49] **tbodygyrojerkstdyAvg**

	Class: numeric 

- - -  
[50] **tbodygyrojerkstdzAvg**

	Class: numeric 

- - -  
[51] **tbodyaccmagstdAvg**

	Class: numeric 

- - -  
[52] **tgravityaccmagstdAvg**

	Class: numeric 

- - -  
[53] **tbodyaccjerkmagstdAvg**

	Class: numeric 

- - -  
[54] **tbodygyromagstdAvg**

	Class: numeric 

- - -  
[55] **tbodygyrojerkmagstdAvg**

	Class: numeric 

- - -  
[56] **fbodyaccstdxAvg**

	Class: numeric 

- - -  
[57] **fbodyaccstdyAvg**

	Class: numeric 

- - -  
[58] **fbodyaccstdzAvg**

	Class: numeric 

- - -  
[59] **fbodyaccjerkstdxAvg**

	Class: numeric 

- - -  
[60] **fbodyaccjerkstdyAvg**

	Class: numeric 

- - -  
[61] **fbodyaccjerkstdzAvg**

	Class: numeric 

- - -  
[62] **fbodygyrostdxAvg**

	Class: numeric 

- - -  
[63] **fbodygyrostdyAvg**

	Class: numeric 

- - -  
[64] **fbodygyrostdzAvg**

	Class: numeric 

- - -  
[65] **fbodyaccmagstdAvg**

	Class: numeric 

- - -  
[66] **fbodybodyaccjerkmagstdAvg**

	Class: numeric 

- - -  
[67] **fbodybodygyromagstdAvg**

	Class: numeric 

- - -  
[68] **fbodybodygyrojerkmagstdAvg**

	Class: numeric
