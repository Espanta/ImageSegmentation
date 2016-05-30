file <- file.path("data","tumor.csv")
tumorMatrix <- as.matrix(read.csv(file , header = FALSE))
tumor <- as.vector(as.matrix(read.csv(file , header = FALSE)))
str(tumor)


dim(tumorMatrix)
library(lubripack)
lubripack("flexclust")

#k-centroids clustering algorithm

?kcca

kccaData <- as.kcca(KMC,healthyVector)

Prediction <- predict(kccaData,newdata = tumor)

dim(Prediction) <- c(571,512)


image(Prediction)
