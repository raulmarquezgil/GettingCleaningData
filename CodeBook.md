###Data Source
The original information used in this project is collected from the accelerometers from the Samsung Galaxy S smartphone.
The information is divided in two different sources: Tests and Trainings. Each source includes a list of samples provided by "subject", with a specific "activity", and a group of measurements for different features (up to 561)

###Source Train Files
"X_train.txt", with 7352 samples of collected data for the 561 features. Stored in variable: <b>trainingset</b>

"y_train.txt", with an activity id number fo any of the 7352 samples of the previous file. Stored in variable: <b>trainingactivity</b>
     
"subject_train.txt", with a subject id number for any of the 7352 samples. Stored in variable: <b>trainingsubject</b>

###Source Test Files
"X_test.txt", with 2947 samples of collected data for the 561 features. Stored in variable: <b>testset</b>

"y_test.txt", with an activity id number fo any of the 7352 samples of the previous file. Stored in variable: <b>testactivity</b>
     
"subject_test.txt", with a subject id number for any of the 7352 samples. Stored in variable: <b>testsubject</b>

###Common Files
"features.txt", with 561 raw labels, one for each feature. Stored in variable: <b>features</b>

"activity_labels.txt", with 6 labels, one for each activity. Stored in variable: <b>activitylabels</b>


###Useful variables
The set of 561 features have been reduced to the ones related to Means or Standard Deviation (only 66), and also the features names have been modified: mean and std were changed to Mean and Std, and some special characters have been removed: "(", ")", "-" and spaces.

###Complete Dataset
The whole dataset have been stored in <b>training</b> variable, as the junction of subjects, activities, and the 66 useful features, and also the junction of test dataset and training dataset.
The activity ids were substituted by the activity label for each sample.

###Grouped Dataset
A new variable: <b>final_group</b> stores the complete dataset but grouped by activity and subject.
Finally, the variable <b>tidydata</b> summarises the groups and features applying mean function. This variable is used as the final output saved in a txt file.
