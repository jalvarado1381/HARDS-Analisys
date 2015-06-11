#HARDS Analisys
featuresVar<-read.table("features.txt")

xtest<-read.table("test/X_test.txt")

testSubjects<-read.table("test/subject_test.txt")

testActivities<-read.table("test/y_test.txt")

xtest2<-cbind(testSubjects,cbind(testActivities, xtest))

names(xtest2) <- c("Subject", "Activities", featuresVar$V2)

xtrain<-read.table("train/X_train.txt")

trainSubjects<-read.table("train/subject_train.txt")

trainActivities<-read.table("train/y_test.txt")

xtrain2<-cbind(trainSubjects,cbind(trainActivities, xtrain))

names(xtrain2) <- c("Subject", "Activities", featuresVar$V2)
##
hards <- rbind(xtrain2,xtest2[1:length(xtest2[,1]),])

names(hards) <- c("Subject", "Activities", featuresVar$V2)
