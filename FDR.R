p <- read.delim("for_FDR_temp.txt" ,header=FALSE)
p = p[,c(1)]
adjusted.p <- p.adjust(p, "fdr")
write.table(adjusted.p, file="fdr_for_FDR_temp.txt")


