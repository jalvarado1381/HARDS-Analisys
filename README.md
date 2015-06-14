# HARDS Analisys

##Resume
Given a Human Activity Recognition Data Set we'll get a new tidy data set.

## Data Set Explanation

##Script Explanation
featuresVar<-read.table("features.txt")

xtest<-read.table("test/X_test.txt")

testSubjects<-read.table()

testActivities<-read.table()

xtest2<-cbind(testSubjects,cbind(testActivities, xtest))

names(xtest2) <- c("Subject", "Activities", featuresVar$V2)

xtrain<-read.table("train/X_train.txt")

trainSubjects<-read.table()

trainActivities<-read.table()

xtrain2<-cbind(testSubjects,cbind(testActivities, xtest))

names(xtrain2) <- c("Subject", "Activities", featuresVar$V2)

hards <- merge(xtrain2, xtest2)


##How to execute the script

##Data set Source
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
