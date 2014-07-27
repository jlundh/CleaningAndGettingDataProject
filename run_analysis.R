library(reshape2)

#change working directory before running
setwd("~/CleaningData/Project")
path <- getwd()

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- "Dataset.zip"
folder <- "UCI HAR Dataset"

#only download if zip file is not in working directory
if (!file.exists(f)) {
    download.file(url, file.path(path, f), method="curl")
}

#only unzip if UCI HAR Dataset folder does not already exist
if(!file.exists(folder)){
    unzip(f)
}

features <- read.table(file.path(folder,"features.txt"))

sapply(activity, simpleCap)

getDataSet <- function(folder,type, features) {
    
    keep     <- grepl("mean\\(\\)|std\\(\\)", features$V2)
    features <- features[keep,2]
    # classes vector can be used for reading a table
    # when NULL, the column will be skipped, speeding up the parsing time
    
    classes <- sapply(keep, function(x) if (x) c("numeric") else NULL)
    xfile <- paste("X_",type,".txt",sep="")
    yfile <- paste("y_",type,".txt",sep="")
    subjfile <- paste("subject_",type,".txt",sep="")
    
    x <- read.table(file.path(folder, type, xfile), colClasses = classes)
    names(x) <- features
    act <- read.table(file.path(folder, type, yfile), col.names = "activity")
    subj <- read.table(file.path(folder, type, subjfile), col.names = "subject")
    
    cbind(x, act, subj)
}

#Get test data
test <- getDataSet(folder,"test",features)

#Get training data
train <- getDataSet(folder,"train",features)

#Merge test data and training data 
merged <- rbind(test, train)

#Melt on activity and subject
melted <- melt(merged,(id.vars=c("activity","subject")))

#Use subject and activity as IDs and the mean function to aggregate
tidied <- dcast(melted, subject + activity ~ variable, mean)

#Use factors for giving descriptive activity names
tidied$activity <- as.factor(tidied$activity)
levels(tidied$activity) <- c("Walking",
                             "Walking upstairs",
                             "Walking downstairs",
                             "Sitting",
                             "Standing",
                             "Laying")
#Write tidy dataset
write.csv(tidied, "tidy.csv", row.names = FALSE )