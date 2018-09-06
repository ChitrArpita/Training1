d1<-read.table("LNP")
d2<-read.table("LNM")

ks.test(d1$V1,d2$V1)

ks.test(d1$V1,d2$V1,alternative = "l")

ks.test(d1$V1,d2$V1,alternative = "g")

ks.test(d1$V1,d2$V1,alternative = "t")

ks.test(d1$V1,d2$V1,
        alternative = c("two.sided", "less", "greater"),
        exact = NULL)
