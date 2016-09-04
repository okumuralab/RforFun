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
    x = qpois(c(0.025,0.975), lambda)
    segments(x[1], lambda, x[2], lambda, col="gray")
}
abline(v=5)
abline(h=1.623486)
abline(h=11.668332)
abline(h=5, lty=2)
axis(4, c(1.623486,11.668332), labels=c(1.6,11.7))
dev.off()
