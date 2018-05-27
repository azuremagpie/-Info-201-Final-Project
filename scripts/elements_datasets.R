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
additions_average_2015_2016 <- data.frame(matrix(ncol = ncol(data_1) - 1, 
                                       nrow = nrow(data_1)))
colnames(additions_average_2015_2016) <- colnames(data_1[2:5])
rownames(additions_average_2015_2016) <- as.vector(data_1[1:12, 1])
for (i in 1:nrow(additions_average_2015_2016)) {
  for (j in 1:ncol(additions_average_2015_2016)) {
    additions_average_2015_2016[i, j] <- 
                        round(((data_1[i, j + 1] + data_2[i, j + 1]) / 2),
                                                              digits = 2)
  }
}
View(additions_average_2015_2016)  #Use this dataframe to create reactive histogram
write.csv(additions_average_2015_2016,
          file = "additions_average_2015_2016.csv")


#Working with the subtraction datasets:
#Convert subtraction_2015 and subtraction_2016 into numeric data
subtraction_2015 <- read.csv("Subtraction_2015.csv", stringsAsFactors = F)
data_3 <- data.frame(lapply(subtraction_2015[,-1], as.numeric))
rownames(data_3) <- as.vector(subtraction_2015[1:5, 1])
write.csv(data_3, file = "subtraction_2015_v2.csv")

subtraction_2016 <- read.csv("Subtraction_2016.csv", stringsAsFactors = F)
data_4 <- data.frame(lapply(subtraction_2016[,-1], as.numeric))
rownames(data_4) <- as.vector(subtraction_2016[1:5, 1])
write.csv(data_4, file = "subtraction_2016_v2.csv")

#Create a dataframe that contains the average
#of each subtraction categories in 2015-2016.
#Dataframe is created from data_3 and data_4
subtraction_average_2015_2016 <- data.frame(matrix(ncol = ncol(data_3), 
                                                 nrow = nrow(data_3)))
colnames(subtraction_average_2015_2016) <- colnames(data_3)
rownames(subtraction_average_2015_2016) <- rownames(data_3)
for (i in 1:nrow(subtraction_average_2015_2016)) {
  for (j in 1:ncol(subtraction_average_2015_2016)) {
    subtraction_average_2015_2016[i, j] <- 
      round(((data_3[i, j] + data_4[i, j]) / 2),
            digits = 2)
  }
}
write.csv(subtraction_average_2015_2016, 
          file = "subtraction_average_2015_2016_v2.csv")

