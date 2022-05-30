data("airquality")
View(airquality)
#i need to drop all N/A values
install.packages("tidyr")
library(tidyr)
clean <- drop_na(airquality)
View(clean)
str(clean)
#clean data
clean$Month <- as.factor(clean$Month)
str(clean)

#calculating mean value of ozone
mean(clean$Ozone)
x <- mean(clean$Ozone)

#Now i need to create variable called quality which shows the good or bad
#depends on ozone average
clean$Quality <- as.factor(ifelse(clean$Ozone > x, "good","bad"))
clean$Radiation <- as.factor(ifelse(clean$Solar.R > 50,"danger","safe"))
#now i need to find linear regression
model <- lm(clean$Ozone ~ clean$Solar.R+clean$Wind+clean$Temp)
summary(model)
#we can able to observe from summary that with star all data are significant