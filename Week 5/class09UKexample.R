#row names is in row 1
x <- read.csv("UK_foods.csv", row.names = 1)
dim(x)
View(head(x))

#exploring our Data with plots
barplot(as.matrix(x), beside = T, col=rainbow(nrow(x)))

#Principal analysis to the rescue
pca <- prcomp( t(x))
print(pca)
summ <- summary(pca)
plot(pca)        
print(summ)

#a dramatic reduction in dimensionality from seventeen dimensions to two
plot(pca$x[,1], pca$x[,2], xlab="PC1", ylab="PC2", xlim=c(-270,500))
text(pca$x[,1], pca$x[,2], colnames(x))

v <- round( pca$sdev^2/sum(pca$sdev^2) * 100 )
barplot(v, xlab="Principal Component", ylab="Percent Variation")

## Lets focus on PC1 as it accounts for > 90% of variance 
par(mar=c(10, 3, 0.35, 0))
barplot( pca$rotation[,1], las=2 )

#for PC2
par(mar=c(10, 3, 0.35, 0))
barplot( pca$rotation[,2], las=2 )


