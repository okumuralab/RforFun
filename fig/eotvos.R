args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=5, height=5)
# par(family="Times")
par(family="Palatino")
par(mgp=c(2,0.5,0)) # title and axis margins. default: c(3,1,0)
# par(mar=c(5,4,4,2)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
x = c(0.94, 0.50, 0.00, -0.74, -0.86, -1.42, -1.71)
y = c(0.4, 0.4, 0.0, -0.3, -0.5, -0.7, -1.0)
e = c(0.2, 0.1, 0.2, 0.2, 0.2, 0.2, 0.2)
r = lm(y ~ x, weights=1/e^2)
plot(x, y, type="p", pch=16, ylim=range(c(y-e, y+e)),
#    xlab="10^3Δ(B/μ)", ylab="10^8Δκ",
     xlab=expression(10^3 * Delta * (italic(B)/italic(μ))),
     ylab=expression(10^8 * Delta * italic(κ)))
arrows(x, y-e, x, y+e, length=0.03, angle=90, code=3)
abline(r)
dev.off()
