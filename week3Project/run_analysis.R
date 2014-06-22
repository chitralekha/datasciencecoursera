#read the files from test set
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#assign the column names for activity table and subject table
colnames(ytest) <- "activityId"
colnames(subtest) <- "subject"
#read the fatures names that has to be assigned to xtest
feature <- read.table("./UCI HAR Dataset/features.txt")
v <- feature$V2

#make the features(xtest) column names readable by getting rid of extra characters
v <- make.names(feature$V2)
v <- gsub("\\.\\.\\.",".",v)
v <- gsub("\\.\\.",".",v)
v <- gsub("\\.$","",v)
colnames(xtest) <- v
v <- grep("mean|std",v,value=TRUE)
v <- grep("meanFreq",v,value=TRUE,invert = TRUE)
b <- xtest[,v]

#merge all the tables of test
b1 <- cbind(ytest,b)
b2 <-cbind(subtest,b1)
actlbl <- read.table("./UCI HAR Dataset/activity_labels.txt")
anames<- c("activityId", "activity")
colnames(actlbl) <- anames
finalTest = merge(actlbl,b2,by.x="activityId",by.y="activityId")
#sort the columns to have subject first
finalTest <- finalTest[,c(3,1,2,4:69)]


# read the files from train set
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#assign the column names for activity table and subject table
colnames(ytrain) <- "activityId"
colnames(subtrain) <- "subject"
feature <- read.table("./UCI HAR Dataset/features.txt")
v <- feature$V2

#make the features(ytest) column names readable by getting rid of extra characters
v <- make.names(feature$V2)
v <- gsub("\\.\\.\\.",".",v)
v <- gsub("\\.\\.",".",v)
v <- gsub("\\.$","",v)
colnames(xtrain) <- v
v <- grep("mean|std",v,value=TRUE)
v <- grep("meanFreq",v,value=TRUE,invert = TRUE)
b <- xtrain[,v]

#merge all the tables of train
b1 <- cbind(ytrain,b)
b2 <-cbind(subtrain,b1)
actlbl <- read.table("./UCI HAR Dataset/activity_labels.txt")
anames<- c("activityId", "activity")
colnames(actlbl) <- anames
finalTrain = merge(actlbl,b2,by.x="activityId",by.y="activityId")
finalTest <- finalTest[,c(3,1,2,4:69)]
finalTrain <- finalTrain[,c(3,1,2,4:69)]

#Merge the train and test data
finalData <- rbind(finalTrain,finalTest)

#Create the tidy data
q1 <- aggregate(.~subject + activityId+activity, FUN=mean, data = finalData)

#Have the tidayData sorted by subject id and activity id.
tidyData <- tidyData[order(tidyData$subject, tidyData$activityId),]