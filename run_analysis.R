#HARDS Analisys
featuresVar<-read.table("features.txt")

xtest<-read.table("test/X_test.txt")

testSubjects<-read.table("test/subject_test.txt")

testActivities<-read.table("test/y_test.txt")

xtest2<-cbind(testSubjects,cbind(testActivities, xtest))

names(xtest2) <- c("Subject", "Activities", featuresVar$V2)

xtrain<-read.table("train/X_train.txt")

trainSubjects<-read.table("train/subject_train.txt")

trainActivities<-read.table("/y_test.txt")

xtrain2<-cbind(testSubjects,cbind(testActivities, xtest))

names(xtrain2) <- c("Subject", "Activities", featuresVar$V2)

hards <- merge(xtrain2, xtest2)
