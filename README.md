<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
## This repo explains how all of the scripts work and how they are connected

1. load library dplyr  to use rename

2. read files:
- Read feactures
 **features.txt**
- read X_train.txt" Training set
   **X_train.txt**
-Read subject
**subject_train.txt**
- Read read Training labels
**y_train.txt**
- Read Test set
**X_test.txt**
- Read subject_test.txt
**subject_test.txt**
- Read Test labels
**y_test.txt**

3. Se cambia el nombre V2 de feactures por name.feacture
NROW(features)
features <- rename(features, id = V1, name.feacture = V2)

4.  los features$name.feacture se colocan como nombres de las columnas de X_train.txt" Training set. 
colnames(train) <- features$name.feacture

5. los features$name.feacture se colocan como nombres de las columnas de test/X_test.txt" Training set.
colnames(test) <- features$name.feacture

6. Merges the training and the test sets to create one data set.
Merge Training set y Test set.
setdata <- rbind(train, test)
NROW(setdata)

#### activity_labels
activitylabels <- rbind(ytrain, ytest)
activitylabels
dim(activitylabels)


dataSubject <- rbind(subjecttrain, subjecttest)
dataSubject <- rename(dataSubject, subject = V1)

#### merge
df <- cbind(dataSubject, activitylabels)
dffinal <- cbind(setdata, df)
colnames(dffinal)

7.  Extracts only the measurements on the mean and
standard deviation for each measurement.
#### You can use  \< Y \> regular expressions  to match the beginning / end of the Word grep **"\\<mean\\>", features$name.feacture**

```
subdataFeaturesNames<-features$name.feacture[grep("\\<mean\\>|\\<std\\>", features$name.feacture)]
NROW(subdataFeaturesNames)
```

8. Uses descriptive activity names to name the activities in the data set.

```
activitylabels[, 1] <- read.table("./UCI HAR Dataset/activity_labels.txt")[activitylabels[, 1], 2]
names(activitylabels) <- "Activity"
View(activitylabels)
```

9. Appropriately labels the data set with descriptive variable names
#### se cambian los nombres de las columnas con nombres mas claros
```
names(setdata)<-gsub("^t", "time", names(setdata))
names(setdata)<-gsub("^f", "frequency", names(setdata))
names(setdata)<-gsub("Acc", "Accelerometer", names(setdata))
names(setdata)<-gsub("Gyro", "Gyroscope", names(setdata))
names(setdata)<-gsub("Mag", "Magnitude", names(setdata))
names(setdata)<-gsub("BodyBody", "Body", names(setdata))
```

10. From the data set in step 4, creates a second, 
independent tidy data set with the average of each 
variable for each activity and each subject.

- se carga la libreria library reshape2, para utilizar las funciones:
  - melt y dcast.

```R
colnames(dffinal)
subjectMelt <- melt(dffinal, id=c("subject","Activity"))
head(subjectMelt,n=3)
finaldcast <- dcast(subjectMelt,subject+ Activity ~ variable,mean)
head(finaldcast, n=3)
```

11. tidy dataset file:
```R
write.table(finaldcast, file = "tidydataset.txt")
```












=======
# Getting-and-Cleaning-Data-Course-Project
Getting and Cleaning Data Course Project
>>>>>>> 6e7dc1ef06d0ab0d06221c4c529ea4980e68cc77
=======
# Getting-and-Cleaning-Data-Course-Project
Getting-and-Cleaning-Data-Course-Project
>>>>>>> 35b3eca14e1671343b76e2b25cc62c59b6cf4807
=======
# Getting-and-Cleaning-Data-Course-Project
Getting-and-Cleaning-Data-Course-Project
>>>>>>> d8bbd3405607496219d2af524c7485ac3533f41b
