setwd("C:/Users/Strea/Google Drive/JSOM/Spring 2018/MIS 6380 - Data Visualization/Project/Dataset/EPL Data/Original Dataset")

set.seed(42)

#Load the betting data set into a dataframe called "epl"
epl <- read.csv("Clustering.csv", header = TRUE)
head(epl)

#Remove the Target 'Final_R'
epl$Final_R <- NULL

#Removing row containing missing values
missing <- sum(is.na(epl))
missing
epl1 <- na.omit(epl)
sum(is.na(epl1))

#K-means Clustering
totwss <- vector()
btwss <- vector()
for (i in 2:15)
{
  set.seed(1234)
  temp <-kmeans(epl1,centers = i)
  totwss[i] <- temp$tot.withinss
  btwss[i] <- temp$betweenss
}
plot(totwss, xlab = "Number of Cluster",type = "b",ylab = "Total Within Sum of Square")
plot(btwss, xlab = "Number of Cluster",type = "b",ylab = "Total Between Sum of Square")


library(Rserve)
Rserve()
