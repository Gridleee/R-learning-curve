data("diamonds")

head(diamonds)

attach(diamonds)

qqnorm(depth)

hist(depth)

depthsmall = sample(depth, 5000)

shapiro.test(depthsmall)

cvm.test(depth)

lillie.test(depth)

sf.test(depthsmall)

pearson.test(depth)

