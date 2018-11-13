x = 5:7
y=8:10

plot(x,y)

plot(lynx)

plot(lynx, main="Lynx Trappings", col="red", col.main=52, cex.main=1.5)

plot(lynx, ylab="Lynx Trappings", xlab="")

plot(lynx, ylab="Lynx Trappings", xlab="", las=2)

par(mfrow=c(2,2), col.axis="red")

plot(1:8, las=0, xlab = "xlab", main="Las = 0")
plot(1:4, las=1, xlab = "xlab", main="Las = 1")
plot(1:10, las=2, xlab = "xlab", main="Las = 2")
plot(1:34, las=3, xlab = "xlab", main="Las = 3")

