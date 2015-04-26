#Getting and cleaning data course project

library(dplyr)


#training subjects, 7352x1
tr_s <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE, colClasses="integer", col.names="subject")
#test subjects, 2947x1
ts_s <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE, colClasses="integer", col.names="subject")
# 561x2
feature <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, colClasses="character", col.names=c("feature_no", "feature"))
# 6x2
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, 
                              colClasses=c("integer", "character"), col.names=c("activity_no", "activity"))
#training data from X_train, 7352x561
tr_x <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE, colClasses="numeric", col.names=feature[[2]])
#test data from X_test, 2947x561
ts_x <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, colClasses="numeric", col.names=feature[[2]])
#training label from Y_train, 7352x1
tr_y <- read.table("./UCI HAR Dataset/train/Y_train.txt", header=FALSE, colClasses="integer", col.names="activity_no")
#test label from Y_test, 2941x1
ts_y <- read.table("./UCI HAR Dataset/test/Y_test.txt", header=FALSE, colClasses="integer", col.names="activity_no")

#merge training and test data and create one big data set named df 
subject <- rbind(tr_s, ts_s)  #10299x1
activity <- rbind(tr_y, ts_y) #10299x1, values 1-6
x <- rbind(tr_x, ts_x)        #10299x561, main data set

#replace activity numbers in data frame activity with descriptive names
for (i in 1:6){activity$activity_no[activity$activity_no==activity_labels$activity_no[i]] <- activity_labels$activity[i]}
names(activity) <- "activity"
#change activity names from uppercase to lowercase
activity <- lapply(activity, function(v) {tolower(v)})

#create data frame
df <- data.frame(subject, activity, x)
#search all columns where name contains words "mean" or "std" and only keep those
df <- cbind(df[1:2], select(df, contains("mean")), select(df, contains("std")))
#remove angle and meanFreq variables
df <- select(df, -starts_with("angle"))
df <- select(df, -contains("meanfreq"))
#remove dots from names of the features; leave camelCase for readability
names(df) <- gsub(".", "", names(df), fixed=TRUE)
names(df) <- gsub("BodyBody", "Body", names(df), fixed=TRUE)

#group by subject and activity, then calculate mean of every subset
#store data in a new variable called newdf
newdf <- df %>% group_by(subject, activity) %>% summarise_each(funs(mean))
#create text file
write.table(newdf, file="HARUS.txt", row.names=FALSE)
