library(readr)
library(nnet)
genderdata <- read_csv("C:/Users/Student/Desktop/gender.csv")
genderdata$Gender = as.factor(genderdata$Gender)
genderdata$`Favorite Color` = as.factor(genderdata$`Favorite Color`)
genderdata$`Favorite Music Genre` = as.factor(genderdata$`Favorite Music Genre`)
genderdata$`Favorite Beverage` = as.factor(genderdata$`Favorite Beverage`)
genderdata$`Favorite Soft Drink` = as.factor(genderdata$`Favorite Soft Drink`)
N = nrow(genderdata)
trainingSize = round(N*0.7)
trainingCases = sample(N, trainingSize)
training = genderdata[trainingCases,]
test = genderdata[-trainingCases,]
model = nnet(Gender ~ ., size = 4, data = genderdata)
pred = as.factor(predict(model,test,type = "class"))
obs = test$Gender
table(pred,obs)
plot(model)

