library(dplyr)

## read feactures
features <- read.table("./UCI HAR Dataset/features.txt")
str(features)
NROW(features)
features <- rename(features, id = V1, name.feacture = V2)
colnames(features)



## read X_train.txt" Training set
train <- read.table("./UCI HAR Dataset/train/X_train.txt") 
NCOL(train)
colnames(train) <- features$name.feacture
colnames(train)

subjecttrain = read.table('./UCI HAR Dataset/train/subject_train.txt')
NROW(subjecttrain)
## read Training labels.
ytrain = read.table('./UCI HAR Dataset/train/y_train.txt')

# read Test set
test = read.table('./UCI HAR Dataset/test/X_test.txt')
NCOL(test)
colnames(test) <- features$name.feacture

subjecttest = read.table('./UCI HAR Dataset/test/subject_test.txt')

## read Test labels.
ytest = read.table('./UCI HAR Dataset/test/y_test.txt')

## 1. Merges the training and the test sets to create one data set.
##Merge Training set y Test set
setdata <- rbind(train, test)
NROW(setdata)

## activity_labels
activitylabels <- rbind(ytrain, ytest)
activitylabels
dim(activitylabels)


dataSubject <- rbind(subjecttrain, subjecttest)
dataSubject <- rename(dataSubject, subject = V1)

## merge
df <- cbind(dataSubject, activitylabels)
df <- rename(df, Activity = V1)
dffinal <- cbind(setdata, df)
colnames(dffinal)

## 2.  Extracts only the measurements on the mean and
#standard deviation for each measurement.
## You can use  \< Y \> regular expressions  to match the beginning / end of the Word grep ("\\<mean\\>", features$name.feacture)

subdataFeaturesNames<-features$name.feacture[grep("\\<mean\\>|\\<std\\>", features$name.feacture)]
NROW(subdataFeaturesNames)


## 3. Uses descriptive activity names to name the activities in the data set

activitylabels[, 1] <- read.table("./UCI HAR Dataset/activity_labels.txt")[activitylabels[, 1], 2]
names(activitylabels) <- "Activity"
View(activitylabels)



## 4. Appropriately labels the data set with descriptive variable names
## se cambian los nombres de las columnas con nombres mas claros
names(setdata)<-gsub("^t", "time", names(setdata))
names(setdata)<-gsub("^f", "frequency", names(setdata))
names(setdata)<-gsub("Acc", "Accelerometer", names(setdata))
names(setdata)<-gsub("Gyro", "Gyroscope", names(setdata))
names(setdata)<-gsub("Mag", "Magnitude", names(setdata))
names(setdata)<-gsub("BodyBody", "Body", names(setdata))

View(setdata)


## 5. From the data set in step 4, creates a second, 
##independent tidy data set with the average of each 
##variable for each activity and each subject.
library(reshape2)
colnames(dffinal)
subjectMelt <- melt(dffinal, id=c("subject","Activity"))
head(subjectMelt,n=3)
finaldcast <- dcast(subjectMelt,subject+ Activity ~ variable,mean)
head(finaldcast, n=3)


## tidy dataset file 
write.table(finaldcast, file = "tidydataset.txt", row.name = FALSE)

