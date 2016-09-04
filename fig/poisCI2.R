args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=5, height=5)
par(family="Palatino")
par(mgp=c(1.5,0.5,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(3,3,2,2)) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
plot(NULL, xlim=c(0,20), ylim=c(0,20),
     xlab=expression(italic(x)), ylab=expression(italic(λ)), xaxs="i", yaxs="i", asp=1)
for (lambda in seq(0,20,0.1)) {
    t = sort(dpois(0:100, lambda), decreasing=TRUE)
    s = cumsum(t)
    m = t[sum(s < 0.95) + 1]
    x = range((0:100)[dpois(0:100, lambda) >= m])
    segments(x[1], lambda, x[2], lambda, col="gray")
}
abline(v=5)
abline(h=1.9701)
abline(h=11.7992)
axis(4, c(1.9701,11.7992), labels=c("2.0","11.8"))
dev.off()
