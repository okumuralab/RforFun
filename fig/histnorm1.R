args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=8.5, height=2)
N = 1000000
h1 = runif(N) - 0.5
h2 = runif(N) + runif(N) - 1
h3 = runif(N) + runif(N) + runif(N) - 1.5
par(family="Palatino")
par(mfrow = c(1,3))
par(mgp=c(1.5,0.5,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(2,2,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
s1 = seq(-0.5,0.5,0.1)
s2 = seq(-1,1,0.1)
s3 = seq(-1.5,1.5,0.1)
hist(h1, freq=FALSE, col="gray", xlim=c(-2,2), ylim=c(0,1), main="", xlab="", ylab="", breaks=s1)
hist(h2, freq=FALSE, col="gray", xlim=c(-2,2), ylim=c(0,1), main="", xlab="", ylab="", breaks=s2)
hist(h3, freq=FALSE, col="gray", xlim=c(-2,2), ylim=c(0,1), main="", xlab="", ylab="", breaks=s3)
dev.off()
