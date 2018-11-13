colors()

?pch

x=7:37

plot(x, pch=11)

par(mfrow=c(1,1), col.axis="black")

library("plotrix", lib.loc="~/R/R-3.5.1/library")

plot(1:7, ylab = "", main = "Line Types, lty 0:6", xlab = "lty")

ablineclip(v=1, lty=1, col="sienna2", lwd=2)
ablineclip(v=2, lty=2, col="sienna2", lwd=2)
ablineclip(v=3, lty=3, col="sienna2", lwd=2)
ablineclip(v=4, lty=4, col="sienna2", lwd=2)
ablineclip(v=5, lty=5, col="sienna2", lwd=2)
ablineclip(v=6, lty=6, col="sienna2", lwd=5)
ablineclip(v=7, lty=0, col="sienna2", lwd=2)

plot(lynx)

plot(lynx, type="p", main="Type p")
plot(lynx, type="l", main="Type l")
plot(lynx, type="b", main="Type b")
plot(lynx, type="c", main="Type c")
plot(lynx, type="o", main="Type o")
plot(lynx, type="h", main="Type h")
plot(lynx, type="s", main="Type s")
plot(lynx, type="n", main="Type n")

par(mar=c(4, 3, 3, 3), col.axis="green")

plot(cars$speed, type="s", col="red", bty="n", xlab="Cars ID", ylab="speed")
text(8, 14, "Speed in mph", cex=0.85, col = "red")

par(new=T)

plot(cars$dist, type="s", bty="n", ann=F, axes = F, col="darkblue")

axis(side=4, col = "darkblue")

text(37, 18, "Stopdistance in ft", cex=0.85, col="darkblue")

title(main = "Speed and stopping\n Distance of Cars (fd)")
