#Codebook

## Overview Explanation

This exercise, that I have called HARDS Analysis (Human Activity Recognition Data Set Analysis), consist in analyse and study the data stored in a set of files generated from a experiment, where  a group of 30 people performed a serie of activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), wearing a smartphone with embedded accelerometer and gyroscope. The goal of this experiment is to study the [Human Activity Recognition] (https://en.wikipedia.org/wiki/Activity_recognition) since today it is easier and cheaper to survey data about it with the used of smartphones.

With the help of this smartphone was possible to get spatial, acceleration, velocity and angular values for the 3-axial, for the six activity performed by the people.

The files mentioned above are contained in an directory called *"UCI HAR Dataset"* and can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). This directory is structured as follow: 

![UCI HAR Dataset directory image](https://github.com/jalvarado1381/HARDS-Analysis/blob/master/UCI_HAR_Dataset_Structure2.png "UCI HAR Dataset directory")

**Above image was generated in GNU/Linux using the command ```tree - version 1.6.0```**

As you can look at in the image the directory *"UCI HAR Dataset"* is compound by two subdirectories called **test** and **train**, containing the data obtained in  the experiment (X_test.txt and X_train.txt files), the README.txt (general information about experiment and the data)  and the files activity_labels.txt, features_info.txt and features.txt (these three last file made up the codebook for this data set).


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

	Class: Integer(Ordinal)

	Values range: 1 - 30

      		The number 1 represent the first person, the number 2 the second one,  and so on...

- - -
[2] **activityname**

It represent each of the six activities performed by the subjects.

	Class: Factor(Categorical)

	Values range: 6 levels
	
 Levels     | 1                 | 2                   | 3                   | 4         | 5         | 6
------------|-------------------|---------------------|---------------------|-----------|-----------|----------
 **Activities** |"WALKING"          | "WALKING_UPSTAIRS"  | "WALKING_DOWNSTAIRS"| "SITTING" | "STANDING"| "LAYING"

- - -
[3] **tbodyaccmeanxAvg**

	Class: numeric 
	Min: 0.2216  Max: 0.3015  

- - -  
 [4] **tbodyaccmeanyAvg**

	Class: numeric 
	Min: -0.040514  Max: -0.001308  

- - -  
 [5] **tbodyaccmeanzAvg**

	Class: numeric 
	Min: -0.15251  Max: -0.07538  

- - -  
 [6] **tgravityaccmeanxAvg**

	Class: numeric 
	Min: -0.6800  Max:  0.9745  

- - -  
 [7] **tgravityaccmeanyAvg**

	Class: numeric 
	Min: -0.47989  Max:  0.95659  

- - -  
 [8] **tgravityaccmeanzAvg**

	Class: numeric 
	Min: -0.49509  Max:  0.95787  

- - -  
 [9] **tbodyaccjerkmeanxAvg**

	Class: numeric 
	Min: 0.04269  Max: 0.13019  

- - -  
 [10] **tbodyaccjerkmeanyAvg**

	Class: numeric 
	Min: -0.0386872  Max:  0.0568186  

- - -  
 [11] **tbodyaccjerkmeanzAvg**

	Class: numeric 
	Min: -0.067458  Max:  0.038053  

- - -  
 [12] **tbodygyromeanxAvg**

	Class: numeric 
	Min: -0.20578  Max:  0.19270  

- - -  
 [13] **tbodygyromeanyAvg**

	Class: numeric 
	Min: -0.20421  Max:  0.02747  

- - -  
 [14] **tbodygyromeanzAvg**

	Class: numeric 
	Min: -0.07245  Max:  0.17910  

- - -  
 [15] **tbodygyrojerkmeanxAvg**

	Class: numeric 
	Min: -0.15721  Max: -0.02209  

- - -  
 [16] **tbodygyrojerkmeanyAvg**

	Class: numeric 
	Min: -0.07681  Max: -0.01320  

- - -  
 [17] **tbodygyrojerkmeanzAvg**

	Class: numeric 
	Min: -0.092500  Max: -0.006941  

- - -  
 [18] **tbodyaccmagmeanAvg**

	Class: numeric 
	Min: -0.9865  Max:  0.6446  

- - -  
 [19] **tgravityaccmagmeanAvg**

	Class: numeric 
	Min: -0.9865  Max:  0.6446  

- - -  
 [20] **tbodyaccjerkmagmeanAvg**

	Class: numeric 
	Min: -0.9928  Max:  0.4345  

- - -  
 [21] **tbodygyromagmeanAvg**

	Class: numeric 
	Min: -0.9807  Max:  0.4180  

- - -  
 [22] **tbodygyrojerkmagmeanAvg**

	Class: numeric 
	Min: -0.99732  Max:  0.08758  

- - -  
 [23] **fbodyaccmeanxAvg**

	Class: numeric 
	Min: -0.9952  Max:  0.5370  

- - -  
 [24] **fbodyaccmeanyAvg**

	Class: numeric 
	Min: -0.98903  Max:  0.52419  

- - -  
 [25] **fbodyaccmeanzAvg**

	Class: numeric 
	Min: -0.9895  Max:  0.2807  

- - -  
 [26] **fbodyaccjerkmeanxAvg**

	Class: numeric 
	Min: -0.9946  Max:  0.4743  

- - -  
 [27] **fbodyaccjerkmeanyAvg**

	Class: numeric 
	Min: -0.9894  Max:  0.2767  

- - -  
 [28] **fbodyaccjerkmeanzAvg**

	Class: numeric 
	Min: -0.9920  Max:  0.1578  

- - -  
 [29] **fbodygyromeanxAvg**

	Class: numeric 
	Min: -0.9931  Max:  0.4750  

- - -  
 [30] **fbodygyromeanyAvg**

	Class: numeric 
	Min: -0.9940  Max:  0.3288  

- - -  
 [31] **fbodygyromeanzAvg**

	Class: numeric 
	Min: -0.9860  Max:  0.4924  

- - -  
 [32] **fbodyaccmagmeanAvg**

	Class: numeric 
	Min: -0.9868  Max:  0.5866  

- - -  
 [33] **fbodybodyaccjerkmagmeanAvg**

	Class: numeric 
	Min: -0.9940  Max:  0.5384  

- - -  
 [34] **fbodybodygyromagmeanAvg**

	Class: numeric 
	Min: -0.9865  Max:  0.2040  

- - -  
 [35] **fbodybodygyrojerkmagmeanAvg**

	Class: numeric 
	Min: -0.9976  Max:  0.1466  

- - -  
 [36] **tbodyaccstdxAvg**

	Class: numeric 
	Min: -0.9961  Max:  0.6269  

- - -  
 [37] **tbodyaccstdyAvg**

	Class: numeric 
	Min: -0.99024  Max:  0.61694  

- - -  
 [38] **tbodyaccstdzAvg**

	Class: numeric 
	Min: -0.9877  Max:  0.6090  

- - -  
 [39] **tgravityaccstdxAvg**

	Class: numeric 
	Min: -0.9968  Max: -0.8296  

- - -  
 [40] **tgravityaccstdyAvg**

	Class: numeric 
	Min: -0.9942  Max: -0.6436  

- - -  
 [41] **tgravityaccstdzAvg**

	Class: numeric 
	Min: -0.9910  Max: -0.6102  

- - -  
 [42] **tbodyaccjerkstdxAvg**

	Class: numeric 
	Min: -0.9946  Max:  0.5443  

- - -  
 [43] **tbodyaccjerkstdyAvg**

	Class: numeric 
	Min: -0.9895  Max:  0.3553  

- - -  
 [44] **tbodyaccjerkstdzAvg**

	Class: numeric 
	Min: -0.99329  Max:  0.03102  

- - -  
 [45] **tbodygyrostdxAvg**

	Class: numeric 
	Min: -0.9943  Max:  0.2677  

- - -  
 [46] **tbodygyrostdyAvg**

	Class: numeric 
	Min: -0.9942  Max:  0.4765  

- - -  
 [47] **tbodygyrostdzAvg**

	Class: numeric 
	Min: -0.9855  Max:  0.5649  

- - -  
 [48] **tbodygyrojerkstdxAvg**

	Class: numeric 
	Min: -0.9965  Max:  0.1791  

- - -  
 [49] **tbodygyrojerkstdyAvg**

	Class: numeric 
	Min: -0.9971  Max:  0.2959  

- - -  
 [50] **tbodygyrojerkstdzAvg**

	Class: numeric 
	Min: -0.9954  Max:  0.1932  

- - -  
 [51] **tbodyaccmagstdAvg**

	Class: numeric 
	Min: -0.9865  Max:  0.4284  

- - -  
 [52] **tgravityaccmagstdAvg**

	Class: numeric 
	Min: -0.9865  Max:  0.4284  

- - -  
 [53] **tbodyaccjerkmagstdAvg**

	Class: numeric 
	Min: -0.9946  Max:  0.4506  

- - -  
 [54] **tbodygyromagstdAvg**

	Class: numeric 
	Min: -0.9814  Max:  0.3000  

- - -  
 [55] **tbodygyrojerkmagstdAvg**

	Class: numeric 
	Min: -0.9977  Max:  0.2502  

- - -  
 [56] **fbodyaccstdxAvg**

	Class: numeric 
	Min: -0.9966  Max:  0.6585  

- - -  
 [57] **fbodyaccstdyAvg**

	Class: numeric 
	Min: -0.99068  Max:  0.56019  

- - -  
 [58] **fbodyaccstdzAvg**

	Class: numeric 
	Min: -0.9872  Max:  0.6871  

- - -  
 [59] **fbodyaccjerkstdxAvg**

	Class: numeric 
	Min: -0.9951  Max:  0.4768  

- - -  
 [60] **fbodyaccjerkstdyAvg**

	Class: numeric 
	Min: -0.9905  Max:  0.3498  

- - -  
 [61] **fbodyaccjerkstdzAvg**

	Class: numeric 
	Min: -0.993108  Max: -0.006236  

- - -  
 [62] **fbodygyrostdxAvg**

	Class: numeric 
	Min: -0.9947  Max:  0.1966  

- - -  
 [63] **fbodygyrostdyAvg**

	Class: numeric 
	Min: -0.9944  Max:  0.6462  

- - -  
 [64] **fbodygyrostdzAvg**

	Class: numeric 
	Min: -0.9867  Max:  0.5225  

- - -  
 [65] **fbodyaccmagstdAvg**

	Class: numeric 
	Min: -0.9876  Max:  0.1787  

- - -  
 [66] **fbodybodyaccjerkmagstdAvg**

	Class: numeric 
	Min: -0.9944  Max:  0.3163  

- - -  
 [67] **fbodybodygyromagstdAvg**

	Class: numeric 
	Min: -0.9815  Max:  0.2367  

- - -  
 [68] **fbodybodygyrojerkmagstdAvg**

	Class: numeric 
	Min: -0.9976  Max:  0.2878  

- - - 
