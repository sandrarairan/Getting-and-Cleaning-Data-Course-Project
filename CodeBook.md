El dataset proviene de: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

files:
- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Getting and Cleaning Data:
1. feactures.txt
Description: The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
id: id feactures
name.feacture: name feactures

> NROW(features)
[1] 561

2. Training set: X_train.txt
description:
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
> NCOL(train)
[1] 561

* Column names are added of features$name.feacture
colnames(train) <- features$name.feacture

3. Test set: X_test.txt
description:
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
> NCOL(test)
[1] 561

* Column names are added of features$name.feacture
colnames(test) <- features$name.feacture

