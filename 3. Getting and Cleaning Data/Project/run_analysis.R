#Step 1 Merge the training and test data sets
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt");
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt");
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt");

xTest <- read.table("UCI HAR Dataset/test/X_test.txt");
yTest <- read.table("UCI HAR Dataset/test/y_test.txt");
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt");

allTrain = cbind(xTrain,yTrain,subjectTrain)
allTest = cbind(xTest,yTest,subjectTest)
allData = rbind(allTrain,allTest)

#Step 2 Extract only the measurements on the mean and standard deviation for each measurement
features <- read.table("UCI HAR Dataset/features.txt");
featuresCol <- grep("*mean*|*std*",features[,2])
allDataMeasuredCols = allData[,featuresCol];

allY = rbind(yTrain,yTest);
allSubject = rbind(subjectTrain,subjectTest);
allDataMeasuredCols = cbind(allDataMeasuredCols,allY,allSubject);

#Step 4 Appropriately labels the data set with descriptive variable names.
columnNames = c(as.character(features[featuresCol,2]),"Activity","Subject")
columnNames = gsub('-mean', 'Mean', columnNames)
columnNames = gsub('-std', 'Std', columnNames)
columnNames <- gsub('[-()]', '', columnNames)
names(allDataMeasuredCols) = columnNames;
#Step 3 Uses descriptive activity names to name the activities in the data set
activityLabels = read.table("UCI HAR Dataset/activity_labels.txt");
allDataMeasuredCols$Activity = activityLabels[allDataMeasuredCols$Activity,2]

#Step 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
allDataAverage <- ddply(allDataMeasuredCols, .(Subject, Activity), function(x) colMeans(x[, 1:79]))
write.table(allDataAverage, "avg_data_tidy.txt",quote = FALSE, row.name=FALSE)
