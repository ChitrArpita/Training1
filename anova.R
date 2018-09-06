status=c(XXX)

batchYY = c(rep("b1",50), rep("b2",44), rep("b3",36), rep("b4",12), rep("b5",36))

batch_effct = data.frame(status,batchYY)

results = aov(status ~ batchYY, data=batch_effct)

summary(results)
