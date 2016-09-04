args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=10, height=3)
N = 1000000
h1 = runif(N) - 0.5
h2 = runif(N) + runif(N) - 1
h3 = runif(N) + runif(N) + runif(N) - 1.5
h12 = runif(N) + runif(N) + runif(N) + runif(N) + runif(N) + runif(N) + runif(N) + runif(N) + runif(N) + runif(N) + runif(N) + runif(N) - 6
# par(family="HiraKakuProN-W3")
par(family="Palatino")
par(mfrow = c(1,4))
par(mgp=c(2,0.8,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(3,3,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
hist(h1, freq=FALSE, col="gray", xlim=c(-3,3), ylim=c(0,1), main="", xlab="", ylab="")
hist(h2, freq=FALSE, col="gray", xlim=c(-3,3), ylim=c(0,1), main="", xlab="", ylab="")
hist(h3, freq=FALSE, col="gray", xlim=c(-3,3), ylim=c(0,1), main="", xlab="", ylab="")
hist(h12, freq=FALSE, col="gray", xlim=c(-3.5,3.5), ylim=c(0,1), main="", xlab="", ylab="")
curve(dnorm(x), add=TRUE)
dev.off()
