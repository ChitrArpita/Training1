library(ggplot2)
data <- read.table("data.txt",header=TRUE)
myplot <-ggplot(data,aes(x=mean_insert_size, y=mean_coverageData, color=batch, label = rownames(data))) + geom_point() + geom_text(angle = 45, size = 2, check_overlap = TRUE)
savePlot <- function(myPlot) {
        pdf("myPlot.pdf")
        print(myPlot)
        dev.off()
 }
savePlot(myplot)
