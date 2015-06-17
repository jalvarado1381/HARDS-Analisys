#HARDS Analisys

# 1.- Merges the training and the test sets to create one data set.

cat("1.- Merging  the training and the test sets.\n")

featuresVar<-read.table("UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)
activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)

xtest<-read.table("UCI HAR Dataset/test/X_test.txt")
testSubjects<-read.table("UCI HAR Dataset/test/subject_test.txt")
testActivities<-read.table("UCI HAR Dataset/test/y_test.txt")
xtest2<-cbind(testSubjects,cbind(testActivities, xtest))
names(xtest2) <- c("Subject", "Activities", featuresVar$V2)

xtrain<-read.table("UCI HAR Dataset/train/X_train.txt")
trainSubjects<-read.table("UCI HAR Dataset/train/subject_train.txt")
trainActivities<-read.table("UCI HAR Dataset/train/y_train.txt")
xtrain2<-cbind(trainSubjects,cbind(trainActivities, xtrain))
names(xtrain2) <- c("Subject", "Activities", featuresVar$V2)

hards <- rbind(xtrain2,xtest2[1:length(xtest2[,1]),])
names(hards) <- c("Subject", "Activities", featuresVar$V2)

# 2.- Extracts only the measurements on the mean and standard deviation for each measurement.

cat("2.- Extracting the measurements on the mean and standard deviation for each measurement.\n")
meanstdRows <-c(grep("mean()", names(hards), fixed=TRUE), grep("std()",names(hards), fixed=TRUE))
hards<-hards[c(1,2,meanstdRows)]

rm(meanstdRows,xtrain2,xtest2,featuresVar, trainActivities,
   trainSubjects, testActivities,testSubjects, xtrain, xtest)

# 3.- Uses descriptive activity names to name the activities in the data set
cat("3.- Translating numbers to descritive names, for activities.\n")
for (l in activityLabels[[1]]){
  hards$Activities[hards$Activities==l] <- activityLabels[l,2]
}
rm(l)

# 4.- Appropriately labels the data set with descriptive variable names.
cat("4.- Working on variable names.\n")
varNames<-tolower(names(hards)[3:68])
varNames <-gsub("-", "", varNames)
varNames <-sub("\\(", "", varNames)
varNames <-sub("\\)", "", varNames)

names(hards) <- c("subjectid", "activityname", paste(varNames, rep("Avg",66), sep=""))
rm(varNames)

# 5.- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

cat("5.- Creating the new Data Set and and taking it to a file.\n")
hardsListSubjects <- list()
hardsListActivities <- list()

  for(subjectId in 1:30){
  
    for(activity in 1:6){

      tempdf <-hards[hards$subjectid==subjectId & hards$activityname==activityLabels[activity,2],]
      
      hardsListActivities[activityLabels[activity,2]] <- list(data.frame( lapply(tempdf[3:68],mean)))
            
    }
    
    hardsListSubjects[subjectId] <- list(hardsListActivities)
  }

rm(hards, subjectId, activity, tempdf, hardsListActivities )

temphards <- data.frame()

for(subjectId in 1:30){
  
  for(activity in 1:6){

    temphards <- rbind.data.frame(temphards,hardsListSubjects[[subjectId]][[activity]])
  
  }
  
}

idfields <-data.frame(subjectid=sort(rep(1:30,6)), activityname=activityLabels$V2)

finalhards<-cbind(idfields, temphards)
rm(subjectId, activity, activityLabels, hardsListSubjects, temphards, idfields )

write.csv(finalhards, "finalhards.txt", row.names=FALSE)


