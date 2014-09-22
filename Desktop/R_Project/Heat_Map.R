data <- read.csv("C:/Users/lokesh/Desktop/R_Tutorial/ppg2008.csv")
data <- data[order(data$PTS),]
row.names(data) <- data$Name
# ways to delete a column
#data<- subset(data, select=-Name)
#data$Name<-NULL
data <- data[,2:21]

#The data was loaded into a data frame, but it has to be a data matrix to make your heatmap. 

data_matrix <- data.matrix(data)
heat_map = heatmap(data_matrix,col=heat.colors(256),scale="column",margins=c(5,10))