library(plyr)
library(dplyr)

# Load in all the data
features=read.table("./data/UCI HAR Dataset/features.txt")
activities=read.table("./data/UCI HAR Dataset/activity_labels.txt")
x_train=read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train=read.table("./data/UCI HAR Dataset/train/y_train.txt")
subj_train=read.table("./data/UCI HAR Dataset/train/subject_train.txt")
x_test=read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test=read.table("./data/UCI HAR Dataset/test/y_test.txt")
subj_test=read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# 1. Merge the training and test sets to create one data set
# Sol:   Do that for the measurements, subjects and activities
full_mov_data=rbind(x_train,x_test)
full_subj=rbind(subj_train,subj_test)
full_subj=rename(full_subj,c("V1"="subject"))
full_act=rbind(y_train,y_test)
full_act=rename(full_act,c("V1"="act_id"))


# 4. Appropriately label the data set with descriptive variable names
# Sol: Assign the variable names from the features file
colnames(full_mov_data)=features[,2]

# 2. Extract only the measurements on the mean and standard deviation for each measurement
# Sol: Take only columns that contain either the word "mean" or "std".
mean_or_std_vars=grep("[Mm]ean|[Ss]td",features[,2])
trim_mov_data=full_mov_data[,mean_or_std_vars]

# 3. Use descriptive activity names to name the activities in the data set
# Sol: Add a colum to activity data.frame with the name of the activity
full_act=mutate(full_act,activity=activities[act_id,2])

## Now add all the things together in one data.fram
comb_data=cbind(subject=full_subj$subject,activity=full_act$activity,trim_mov_data)

# 5.Create a second, independent tidy data set with the average 
#   of each variable for each activity and each subject
# Sol: Use the dplyr functions for the task
avg_data=(comb_data %>%
            group_by(subject,activity) %>%
            summarise_each(funs(mean)))
write.table(avg_data, "avg_data.txt",row.name=FALSE)
