# Obtain feature names from features.txt
features <- read.table("UCI HAR Dataset/features.txt", sep = "", header = FALSE)
# Read X_test values into table
testx <- read.table("UCI HAR Dataset/test/X_test.txt", sep="", header = FALSE)
# Read Y_test values (Activity) into another table
testy <- read.table("UCI HAR Dataset/test/Y_test.txt", sep="", header = FALSE)
# Read subject ID
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", sep="", header = FALSE)
# Column bind data in order Subject ID, Activity, Feature values
testdata <- cbind(subject_test, testy, testx)

# Repeating above steps for training data
trainx <- read.table("UCI HAR Dataset/train/X_train.txt", sep="", header = FALSE)
trainy <- read.table("UCI HAR Dataset/train/Y_train.txt", sep="", header = FALSE)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", sep="", header = FALSE)
traindata <- cbind(subject_train, trainy, trainx)

# Combine data test and training
comdata <- rbind(testdata, traindata)
# Add names to the columns in the aforementioned order, using 2nd column from features
colnames(comdata) <- c("Subject","Activity",as.vector(features$V2))

# Read Activity labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)
colnames(activity_labels) <- c("Activity", "Activity name")
comdata <- merge(activity_labels, comdata, by = "Activity")

