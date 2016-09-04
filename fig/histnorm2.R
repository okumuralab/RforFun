args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=7, height=3)
N = 1000000
h12 = runif(N) + runif(N) + runif(N) + runif(N) + runif(N) + runif(N) + runif(N) + runif(N) + runif(N) + runif(N) + runif(N) + runif(N) - 6
par(family="Palatino")
par(mgp=c(1.5,0.5,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(2,2,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
s = seq(-6,6,0.2)
hist(h12, freq=FALSE, col="gray", xlim=c(-4,4), ylim=c(0,0.5), main="", xlab="", ylab="", breaks=s)
curve(dnorm(x), add=TRUE)
dev.off()
