args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=5, height=5)
par(family="Palatino")
par(mgp=c(1.5,0.5,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(3,3,2,2)) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
plot(NULL, xlim=c(0,20), ylim=c(0,20),
     xlab=expression(italic(x)), ylab=expression(italic(λ)), xaxs="i", yaxs="i", asp=1)
for (lambda in seq(3,20,0.1)) {
    r = dpois(0:100, lambda) / dpois(0:100, c(3,3,3,3:100))
    o = order(r, decreasing=TRUE)
    t = sort(dpois(0:100, lambda), decreasing=TRUE)
    s = cumsum(dpois(0:100, lambda)[o])
    m = r[o[sum(s < 0.95) + 1]]
    x = range((0:100)[r >= m])
    segments(x[1], lambda, x[2], lambda, col="gray")
}
abline(v=5)
abline(h=3)
abline(h=11.26)
abline(h=4.63)
axis(4, c(3,4.63,11.26), labels=c("3.0","4.6","11.3"))
dev.off()
