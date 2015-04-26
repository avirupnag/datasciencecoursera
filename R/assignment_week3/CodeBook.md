# Introduction
## The script run_analysis.Rperfrms the 5 steps described in the curse prject's definitin.
	### Merges the training and the test sets t create ne data set using the fllwing steps.
	#### Read the train data int x_train_data, y_train_data and subject_train_data
	#### Read the test data int x_test_data, y_test_data and subject_test_data
	#### Cmbine and create 'x' data set using rbind int x_data
	#### Cmbine and create 'y' data set using rbind int y_data
	#### Cmbine and create 'subject' data set using rbind int subject_data
	### Extracts nly the measurements n the mean and standard deviatin fr each measurement using the features.txt in the fllwing steps.
	#### Read features.txt int features_data
	#### Extract nly clumn ids having mean r std in their names
	#### Create a subset using the mean_std_features clumns
	#### Set the clumn names using mean_std_features
	### Uses descriptive activity names t name the activities in the data set frm activity_labels.txt as mentined in the fllwing steps.
	#### Read activity_labels.txt int activities_labels_data
	#### Set values with crrect activity names int y_data
	#### Set clumn name in y_data t activity
	### Apprpriately labels the data set with descriptive variable names as mentined in the fllwing steps.
	#### Set clumn name f subject_data t subject
	#### Bind all the data in x_data, y_data and subject_data in a single data set
	### Frm the data set in the last step, creates a secnd, independent tidy data set f each variable fr each activity and each subject as mentined in the fllwing steps. 
	#### Using ddply and numclwise(mean) get the mean f the final_data  subject and activity wise int mean_data
	#### Using the write.table functin write the mean_data cntent int the tidy_mean_data.txt
	#### The result data in the file tidy_mean_data.txt  will 180 rws fr each f 30 subjects and fr each f the 6 activities and upladed t this repsitry.
##Variables
	### x_train_data, y_train_data, x_test_data, y_test_data, subject_train_data and subject_test_data cntain the data frm the dwnladed files.
	### x_data is the merged data f x_train_data and x_test_data
	### y_data is the merged data f y_train_data and y_test_data
	### subject_data is the merged data f subject_train_data and subject_test_data
	### features_data cntains the names fr the x_data dataset read frm the file features.txt, which is set in the clumn names stred in mean_std_features.
	### mean_std_features cntains the clumn ids f the features_data
	### x_mean_std_features_data cntains the data f the clumns ids in mean_std_features f x_data
	### activities_labels_data cntains the labels fr the y_data dataset read frm the file activity_labels.txt, which is set in  the first clumn in y_data.
	### A similar apprach is taken with activity names thrugh the activities variable.
	### all_data merges x_data, y_data and subject_data in a big dataset.
	### final_data cntains the merged data x_data, y_data and subject_data
	### mean_data cntains the mean f the final_data subject and activity wise, calculated using the ddply and numclwise(mean) functins.

