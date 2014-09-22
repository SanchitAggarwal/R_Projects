#require(kernlab)
#require(e1071)
require(randomForest)
train <- read.csv("C://Users//lokesh//Desktop//R_Tutorial//train.csv",na.strings=c("NA", ""))
test <- read.csv("C://Users//lokesh//Desktop//R_Tutorial//test.csv",na.strings=c("NA", ""))
#test$Survived <- rep(0, 418)
# submit <- data.frame(test$PassengerId,test$Survived)
# write.csv(submit,file="C://Users//lokesh//Desktop//R_Tutorial//titanic_predicted_value.csv",row.names=FALSE)
#train <- train[!is.na(train$Fare),]
#train <- train[!is.na(train$Age),]
#test <- test[!is.na(test$Fare),]
#test <- test[!is.na(test$Age),]
#train<-na.omit(train)
#test<-na.omit(test)
train$Age[is.na(train$Age)]<-median(train$Age, na.rm=TRUE)
train[is.na(train1$Fare)]<-median(train$Fare, na.rm=TRUE)
train$Embarked[c(62,830)] <- "S"
test$Age[is.na(test$Age)]<-median(test$Age, na.rm=TRUE)
test$Fare[is.na(test$Fare)]<-median(test$Fare, na.rm=TRUE)
train$Survived <- as.factor(train$Survived)
formula <- Survived~ Pclass +Sex+ Age+ SibSp+	Parch+ Fare+	Embarked
m <- randomForest(formula,data=train,importance=TRUE)
test$Survived <- predict(m, test)
submit <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
write.csv(submit,file="C://Users//lokesh//Desktop//R_Tutorial//titanic_predicted_value.csv",row.names=FALSE)
