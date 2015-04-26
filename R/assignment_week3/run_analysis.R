library(plyr)

#1. Merges the training and the test sets to create one data set.

# Read the train data
x_train_data <- read.table("train/X_train.txt")
y_train_data <- read.table("train/y_train.txt")
subject_train_data <- read.table("train/subject_train.txt")

# Read the test data
x_test_data <- read.table("test/X_test.txt")
y_test_data <- read.table("test/y_test.txt")
subject_test_data <- read.table("test/subject_test.txt")

# Combine and create 'x' data set using rbind
x_data <- rbind(x_train_data, x_test_data)

# Combine and create 'y' data set using rbind
y_data <- rbind(y_train_data, y_test_data)

# Combine and create 'subject' data set using rbind
subject_data <- rbind(subject_train_data, subject_test_data)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.

# Read features.txt into features_data
features_data <- read.table("features.txt")

# Extract only columns having mean or std in their names
mean_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# Create a subset using the mean_std_features columns
x_mean_std_features_data <- x_data[, mean_and_std_features]

# Set the column names using mean_std_features
names(x_mean_std_features_data) <- features[mean_std_features, 2]

#3. Uses descriptive activity names to name the activities in the data set

activities_labels_data <- read.table("activity_labels.txt")

# Set values with correct activity names in y_data
y_data[, 1] <- activities[y_data[, 1], 2]

# Set column names in y_data to activity
names(y_data) <- "activity"

#4. Appropriately labels the data set with descriptive variable names.

# Set column name of subject_data to subject
names(subject_data) <- "subject"

# Bind all the data in x_data, y_data and subject_data in a single data set
final_data <- cbind(x_data, y_data, subject_data)

#5. From the data set in step 4, creates a second, independent tidy data set with the average
#   of each variable for each activity and each subject.

# Using ddply and numcolwise(mean) get the mean of the final_data  
# subject and activity wise
mean_data <- ddply(final_data, .(subject, activity), numcolwise(mean))

# The mean of the final_data subject and activity wise can also be 
# achieved by using the aggregate function
#  mean_data <- aggregate(all_data[,1:66], by=all_data[c("subject","activity")], FUN=mean)

# Using the write.table function write the mean_data content into the tidy_mean_data.txt
write.table(mean_data, "tidy_mean_data.txt", row.name=FALSE)