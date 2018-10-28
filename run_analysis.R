library(data.table)

#Reading Data labels
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt",col.names = c('Activity_ID','Activity_Type'))

#Extracting Features Mean and STD
features <- read.table("UCI HAR Dataset/features.txt")
features.mn_sd.ID<-grep(".*mean.*|.*std.*", features[,2])
features.mn_sd <- features$V2[features.mn_sd.ID]
#Properly labeling them for Humans!
features.mn_sd<-gsub('^t', 'Time ', features.mn_sd)
features.mn_sd<-gsub('^f', 'Frequency ', features.mn_sd)
features.mn_sd<-gsub('mag', 'Magnitude ', features.mn_sd)
features.mn_sd<-gsub('[()]', '', features.mn_sd)
features.mn_sd<-gsub('mean', 'Mean', features.mn_sd)
features.mn_sd<-gsub('std', 'STD', features.mn_sd)

#Reading and Extracting Training dataset
training_set <- read.table("UCI HAR Dataset/train/X_train.txt")[features.mn_sd.ID]
training_lab <- read.table("UCI HAR Dataset/train/Y_train.txt")
training_subj <- read.table("UCI HAR Dataset/train/subject_train.txt")
training <- cbind(training_subj, training_lab, training_set)
colnames(training)<-c('training_subject','training_ID',as.character(features.mn_sd))


#Reading and Extracting Test dataset
test_set <- read.table("UCI HAR Dataset/test/X_test.txt")[features.mn_sd.ID]
test_lab <- read.table("UCI HAR Dataset/test/Y_test.txt")
test_subj <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(test_subj, test_lab, test_set)
colnames(test)<-c('training_subject','training_ID',as.character(features.mn_sd))

#Reshape Dataframe by subject and activity
Merged_data <- rbind(training, test)
Merged_data$training_subject<-as.factor(Merged_data$training_subject)
Merged_data$training_ID<-as.factor(Merged_data$training_ID)

Merged_data<-melt(Merged_data,id.vars = c('training_subject','training_ID'))
Merged_data<-dcast(Merged_data,training_ID+training_subject~variable,mean)

#Save data in table format
write.table(Merged_data,'tidy.txt',row.name=FALSE)
