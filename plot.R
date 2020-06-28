d <- read.csv("testing_record.csv", header = TRUE)

data_summary <- function(data, varname, groupnames){
  require(plyr)
  summary_func <- function(x, col){
    c(mean = mean(x[[col]], na.rm=TRUE),
      sd = sd(x[[col]], na.rm=TRUE))
  }
  data_sum<-ddply(data, groupnames, .fun=summary_func,
                  varname)
  data_sum <- rename(data_sum, c("mean" = varname))
  return(data_sum)
}

# Summarize the data
df2 <- data_summary(d, varname="pickUpNumber", 
                    groupnames="condition")
# Convert dose to a factor variable
df2$dose=as.factor(df2$dose)
head(df2)

# make the plot
library(ggplot2)
# 按照大小排列
df2$condition <- factor(df2$condition, levels = df2$condition[order(-df2$pickUpNumber)])
# 按照ABCD排列
fillColor <- factor(df2$condition, levels(condition) <- c("A","B","C","D"))
p<- ggplot(df2, aes(x=condition, y=pickUpNumber, fill=fillColor)) + 
  geom_bar(stat="identity", color="black", width = 0.7, 
           position=position_dodge()) +
  geom_text(aes(label=sprintf("%0.3f", round(pickUpNumber, digits = 3))), position=position_dodge(width=0.9), vjust= -1) +
  geom_errorbar(aes(ymin=pickUpNumber, ymax=pickUpNumber+sd), width=.2,
                position=position_dodge(.9)) 
print(p)

# box plot
ggplot(d, aes(x=condition, y=pickUpNumber)) +
  geom_boxplot(size = .75) +
  geom_jitter(alpha = .5) 


#ggsave("pickUpNumber.png")

