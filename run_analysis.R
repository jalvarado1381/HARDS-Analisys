#HARDS Analisys

# 1.- Merges the training and the test sets to create one data set.

featuresVar<-read.table("features.txt", stringsAsFactors=FALSE)
activityLabels<-read.table("activity_labels.txt", stringsAsFactors=FALSE)

xtest<-read.table("test/X_test.txt")

testSubjects<-read.table("test/subject_test.txt")

testActivities<-read.table("test/y_test.txt")

xtest2<-cbind(testSubjects,cbind(testActivities, xtest))

names(xtest2) <- c("Subject", "Activities", featuresVar$V2)

xtrain<-read.table("train/X_train.txt")

trainSubjects<-read.table("train/subject_train.txt")

trainActivities<-read.table("train/y_train.txt")

xtrain2<-cbind(trainSubjects,cbind(trainActivities, xtrain))

names(xtrain2) <- c("Subject", "Activities", featuresVar$V2)
##
hards <- rbind(xtrain2,xtest2[1:length(xtest2[,1]),])

names(hards) <- c("Subject", "Activities", featuresVar$V2)

# 2.- Extracts only the measurements on the mean and standard deviation for each measurement.
#hards[grep("mean()", names(hards), fixed=TRUE)]
#hards[grep("std()", names(hards), fixed=TRUE)]

mean.std.rows <-c(grep("mean()",names(hards), fixed=TRUE), grep("std()",names(hards), fixed=TRUE))

hards1<-hards[c(1,2,mean.std.rows)]


#hards[c(grep("std()",names(hards), fixed=TRUE), grep("mean()",names(hards), fixed=TRUE))]

# 3.- Uses descriptive activity names to name the activities in the data set
for (l in activityLabels[[1]]){
  hards1$Activities[hards1$Activities==l] <- activityLabels[l,2]
}

# 4.- Appropriately labels the data set with descriptive variable names.

names(hards1) <- c("SubjectID", "ActivityName", names(hards1)[3:68])

hards2<-data.frame()

# 5.- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
for(id in 1:30){
  
  for(a in 1:6){
    
    tempdf <-hards1[hards1$SubjectID==id & hards1$ActivityName==activityLabels[2,2],]
    hards2sapply(tempdf)
    
  }
  
}
