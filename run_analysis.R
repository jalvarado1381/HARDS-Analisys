#HARDS Analysis

################################################
# 1.- Merging  the training and the test sets. #
################################################

cat("1.- Merging  the training and the test sets.\n")

featuresVar<-read.table("UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)
activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)

xtest<-read.table("UCI HAR Dataset/test/X_test.txt")
testSubjects<-read.table("UCI HAR Dataset/test/subject_test.txt")
testActivities<-read.table("UCI HAR Dataset/test/y_test.txt")
xtest<-cbind(testSubjects,cbind(testActivities, xtest))
names(xtest) <- c("Subject", "Activities", featuresVar$V2)

xtrain<-read.table("UCI HAR Dataset/train/X_train.txt")
trainSubjects<-read.table("UCI HAR Dataset/train/subject_train.txt")
trainActivities<-read.table("UCI HAR Dataset/train/y_train.txt")
xtrain<-cbind(trainSubjects,cbind(trainActivities, xtrain))
names(xtrain) <- c("Subject", "Activities", featuresVar$V2)

hards <- rbind(xtrain,xtest[1:length(xtest[,1]),])
names(hards) <- c("Subject", "Activities", featuresVar$V2)

############################################################################################
# 2.- Extracting the measurements on the mean and standard deviation for each measurement. #
############################################################################################

cat("2.- Extracting the measurements on the mean and standard deviation for each measurement.\n")

meanstdVariables <-c(grep("mean()", names(hards), fixed=TRUE), grep("std()",names(hards), fixed=TRUE))
hards<-hards[c(1,2,meanstdVariables)]

rm(meanstdVariables,featuresVar, trainActivities,
   trainSubjects, testActivities,testSubjects, xtrain, xtest) ## removing objects

##############################################################################
# 3.- Uses descriptive activity names to name the activities in the data set #
##############################################################################

activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)
cat("3.- Translating numbers to descritive names, for activities.\n")
for (activity in activityLabels[[1]]){
  hards$Activities[hards$Activities==activity] <- activityLabels[activity,2]
}

rm(activity) ## removing objects

#############################################################################################
# 4.- Working on variable names to appropriately labels the data set with descriptive ones. #
#############################################################################################

cat("4.- Working on variable names.\n")
varNames<-tolower(names(hards)[3:68])
varNames <-gsub("-", "", varNames)
varNames <-sub("\\(", "", varNames)
varNames <-sub("\\)", "", varNames)

names(hards) <- c("subjectid", "activityname", paste(varNames, rep("Avg",66), sep=""))

rm(varNames) ## removing objects

##############################################################
# 5.- Creating the new Data Set and and taking it to a file. #
##############################################################

cat("5.- Creating the new Data Set and and taking it to a file.\n")

#pre-creating List 
hardsListSubjects <- list()
hardsListActivities <- list()

#Calculating and collecting average of each variable
for(subjectId in 1:30){  
    for(activity in 1:6){
      tempdf <-hards[hards$subjectid==subjectId & hards$activityname==activityLabels[activity,2],]      
      hardsListActivities[activityLabels[activity,2]] <- list(data.frame( lapply(tempdf[3:68],mean)))
    }    
    hardsListSubjects[subjectId] <- list(hardsListActivities)
}

rm(hards, subjectId, activity, tempdf, hardsListActivities )

finalhards <- data.frame()

#Appending the new values in an temporal data frame
for(subjectId in 1:30){  
  for(activity in 1:6){
    finalhards <- rbind.data.frame(finalhards,hardsListSubjects[[subjectId]][[activity]])  
  }  
}

idfields <-data.frame(subjectid=sort(rep(1:30,6)), activityname=activityLabels$V2)
finalhards<-cbind(idfields, finalhards)

rm(subjectId, activity, activityLabels, hardsListSubjects,  idfields ) ## removing objects

write.table(finalhards, "finalhards.txt", sep=",", row.names=FALSE)

if (file.exists("finalhards.txt")){
  
  cat("The file \"finalhards.txt\" has been created in the working directory ", getwd(), ".", sep="")
  
} else{
  cat("It was able to create the file \"finalhards.txt\".")
}

