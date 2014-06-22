# Get data from internet. Commented out here because it takes too long to download...

# fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(fileUrl, destfile = "project.zip",method="curl")
# unzip("project.zip")

# Load data into R.
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt")
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Load feature titles into R and subset out index with "mean()" or "std()"
feature <- read.table("UCI HAR Dataset/features.txt")
featureVector <- grepl('mean\\(\\)|std\\(\\)',feature[,"V2"])

# Preprocess data to combine and subset appropriately and assign variable names.
x <- rbind(xtest,xtrain)
xSub <- x[,featureVector]
colnames(xSub) <- feature[featureVector,"V2"]
activity <- rbind(ytest,ytrain)
colnames(activity) <- "activity"
subject <- rbind(subjecttest,subjecttrain)
colnames(subject) <- "subject"

# Merge every data set to get the tidy one... 
tidy <- cbind(subject,activity,xSub)

# Calculate mean for every activity and every subject
tempmelt <- melt(tidy,id=c("activity","subject"), measure.vars = colnames(tidy)[3:68])
tidyMean <- dcast(tempmelt, activity + subject ~ variable, mean)

# And export to txt files.
write.csv(tidy,"tidy.txt")
write.csv(tidyMean, "tidyMean.txt")


