
file <- "data/healthy.csv"
healthy <- read.csv(file, header = FALSE)
View(healthy)
dim(healthy)

healthyMatrix <- as.matrix(healthy)
dim(healthy)

image(healthyMatrix, axes=FALSE)
image(healthyMatrix, col= grey(seq(0,1, length= 256)))

healthyVector <- as.vector(healthyMatrix)
str(healthyVector)

# Because the resolution of the picture is high 566*644, it is not efficient to use hierarchical clustering, rather 
# we use k-means algorithm.

# 1- Decide on number of clusters
k <- 5
set.seed(1)
KMC <- kmeans(healthyVector, centers = k, iter.max = 1000 )
str(KMC)
MRIClusters  <- KMC$cluster

dim(MRIClusters) <- c(nrow(healthyMatrix), ncol(healthyMatrix))
image(MRIClusters, col = rainbow(k))
