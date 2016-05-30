file <- "data/flower.csv"
flowersMatrix <- as.matrix(read.csv(file, header = FALSE))

flowers <- as.vector(flowersMatrix)
str(flowers)

# The file contains 1 flowers  that has 50*50 pixels which is 2500 values for each pixel.
# NOTE: We have to first create a matrix and then a vector.

# Now lets create distance vector of each pixel to other pixels. We should have n(n-1)/2 when we have n pixel. 
# So, there will be (2500*2499)/2 difference values. So out distance vector shojld have 3123750 values

distance <- dist(flowers, "euclidean")

PixelClust <- hclust(distance, method="ward.D")
plot(PixelClust)

rect.hclust(PixelClust, k = 3, border="red")

#Now in the last stp, lets cluster data into the 3 clusters we choose
flowerClusters <- cutree(PixelClust, k = 3)
flowerClusters
unique(flowerClusters)

# Lets see the mean value of each cluster.
tapply(flowers,flowerClusters, mean)

# as you can see in the output, there are three clusters of 1, 2, and 3. Each cluster has a mean vlaue

# Lets use the clusters and draw an image using the tree clustres.
dim(flowerClusters) <- c(50,50)
image(flowerClusters)
image(flowersMatrix, col=grey(seq(0,1, length=256)))
