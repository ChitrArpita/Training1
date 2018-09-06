
mydata = read.table("test.txt", sep="\t" , header=TRUE )
data <- mydata[, 4:10]
species <- mydata[, 3] # this will determine the number of colors in the pca plot
pca <- prcomp(data, center = TRUE,scale. = TRUE) 
print(pca)
plot(pca, type = "l") # for this l parameter the picture will be in a connecting line , it will plot a histogram by default
summary(pca)
plot(pca$x[,1:2], col = species) # here the col is important
libeary("ggplot2")
ggplot(pca$x[,1:2],aes(x=PC1,y=PC2,col=Species))+
   geom_point(size=3,alpha=0.5)+ #Size and alpha just for fun
   scale_color_manual(values = c("#FF1BB3","#A7FF5B","#99554D","#A7A7A7"))+ #your colors here
   theme_classic()
