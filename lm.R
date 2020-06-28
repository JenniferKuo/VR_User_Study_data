setwd("C:/Users/GUO/VR_data")

d <- read.csv("testing_record.csv", header = TRUE)
h <- subset(d, d$sbsodScore > 2)
l = subset(d, d$sbsodScore <= 2)

d$condition <- relevel(as.factor(d$condition), "C")
fix.fit <- lm(d$distanceMoved ~ as.factor(d$condition) + as.factor(d$order) + as.factor(d$route) + d$sbsodScore)
summary(fix.fit)

d$condition <- relevel(as.factor(d$condition), "C")
fix.fit <- lm(d$taskTime ~ as.factor(d$condition) + as.factor(d$order) + as.factor(d$route) + d$sbsodScore)
summary(fix.fit)

d$condition <- relevel(as.factor(d$condition), "B")
fix.fit <- lm(d$pickUpNumber ~ as.factor(d$condition) + as.factor(d$order) + as.factor(d$route) + d$sbsodScore)
summary(fix.fit)

d$condition <- relevel(as.factor(d$condition), "B")
fix.fit <- lm(d$phoneActiveTime ~ as.factor(d$condition) + as.factor(d$order) + as.factor(d$route) + d$sbsodScore)
summary(fix.fit)

d$condition <- relevel(as.factor(d$condition), "B")
fix.fit <- lm(d$angleDiff ~ as.factor(d$condition) + as.factor(d$order) + as.factor(d$route) + d$sbsodScore)
summary(fix.fit)

d$condition <- relevel(as.factor(d$condition), "B")
fix.fit <- lm(d$distanceDiff ~ as.factor(d$condition) + as.factor(d$order) + as.factor(d$route) + d$sbsodScore)
summary(fix.fit)