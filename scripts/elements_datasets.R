addition_2016 <- read.csv("additions_2016.csv", stringsAsFactors = F)
#Remove special character from addition_2016
addition_2016[] <- lapply(addition_2016,
                          gsub, pattern = "?",
                          replacement = "", fixed = T)
#Convert data from column 2:end to numeric value
conversion <- data.frame(lapply(addition_2016[,-1], as.numeric))
data_1 <- data.frame(addition_2016[1], conversion)
write.csv(data_1, file = "additions_2016_v2.csv")


#Repeat the same steps for the addition_2015 dataset
addition_2015 <- read.csv("Additions_2015.csv", stringsAsFactors = F)
addition_2015[] <- lapply(addition_2015,
                          gsub, pattern = "?",
                          replacement = "", fixed = T)
conversion2 <- data.frame(lapply(addition_2015[,-1], as.numeric))
data_2 <- data.frame(addition_2015[1], conversion2)
write.csv(data_2, file = "additions_2015_v2.csv")

#Create a dataframe that contains the average 
#of each additions categories in 2015-2016
average_2015_2016 <- data.frame(matrix(ncol = ncol(data_1) - 1, 
                                       nrow = nrow(data_1)))
colnames(average_2015_2016) <- colnames(data_1[2:5])
rownames(average_2015_2016) <- as.vector(data_1[1:12, 1])
for (i in 1:nrow(average_2015_2016)) {
  for (j in 1:ncol(average_2015_2016)) {
    average_2015_2016[i, j] <- round(((data_1[i, j + 1] + data_2[i, j + 1]) / 2),
                                     digits = 2)
  }
}