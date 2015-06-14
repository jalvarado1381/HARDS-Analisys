#HARDS Analisys

# 1.- Merges the training and the test sets to create one data set.

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

##
hards <- rbind(xtrain2,xtest2[1:length(xtest2[,1]),])

names(hards) <- c("Subject", "Activities", featuresVar$V2)

# 2.- Extracts only the measurements on the mean and standard deviation for each measurement.

meanstdRows <-c(grep("mean()",names(hards), fixed=TRUE), grep("std()",names(hards), fixed=TRUE))

hards1<-hards[c(1,2,meanstdRows)]


#hards[c(grep("std()",names(hards), fixed=TRUE), grep("mean()",names(hards), fixed=TRUE))]

# 3.- Uses descriptive activity names to name the activities in the data set
for (l in activityLabels[[1]]){
  hards1$Activities[hards1$Activities==l] <- activityLabels[l,2]
}

# 4.- Appropriately labels the data set with descriptive variable names.
varNames<-tolower(names(hards1)[3:68])
varNames <-gsub("-", "", varNames)
varNames <-sub("\\(", "", varNames)
varNames <-sub("\\)", "", varNames)

#names(hards1) <- c("SubjectID", "ActivityName", names(hards1)[3:68])
names(hards1) <- c("subjectid", "activityname", varNames)


# 5.- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# hards1 <- hards1[order(hards1$subjectid, hards1$activityname),]
# tempdf <-hards1[hards1$subjectid==1,]
# templs <-split(tempdf, tempdf$activityname )
#l<-lapply(templs[2:67],mean)

hardsListSubjects <- list()
hardsListActivities <- list()


  for(subjectId in 1:30){
  
    for(activity in 1:6){

      tempdf <-hards1[hards1$subjectid==subjectId & hards1$activityname==activityLabels[activity,2],]
      
      #hardsListActivities[activity] <- list((list(subjectId, activityLabels[activity,2], lapply(tempdf[3:68],mean))))
      hardsListActivities[activityLabels[activity,2]] <- list(data.frame( lapply(tempdf[3:68],mean)))
      
      #lapply(tempdf[3:68], mean)
      
    }
    
    hardsListSubjects[subjectId] <- list(hardsListActivities)
  }

temphards <- data.frame()

for(subjectId in 1:30){
  
  for(activity in 1:6){
#   rbind.data.frame(hardsListSubjects[[subjectId]][[1]], hardsListSubjects[[1]][[2]], 
#                    hardsListSubjects[[1]][[3]], hardsListSubjects[[1]][[4]], 
#                    hardsListSubjects[[1]][[5]], hardsListSubjects[[1]][[6]])
    
    temphards <- rbind.data.frame(temphards,hardsListSubjects[[subjectId]][[activity]])
  }
}
idfields <-data.frame(subjectid=sort(rep(1:30,6)), activityname=activityLabels$V2)
finalhards<-cbind(idfields, temphards)
write.csv(finalhards, "finalhards.txt", row.names=FALSE)


