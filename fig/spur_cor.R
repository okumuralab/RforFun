args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=8, height=3)
par(family="Palatino")
par(mgp=c(2,0.8,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(3,3,2,2)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
par(mfrow = c(1,2))
sim1 = function(n=40) { x = rnorm(n); y = rnorm(n); cor(x, y) }
sim2 = function(n=40) { x = cumsum(rnorm(n)); y = cumsum(rnorm(n)); cor(x, y) }
r1 = replicate(1000000, sim1())
r2 = replicate(1000000, sim2())
hist(r1, col=gray(0.6), freq=FALSE, breaks=(0:40)/20-1, xlim=c(-1,1), ylim=c(0,2.5), xlab="", ylab="", main="")
hist(r2, col=gray(0.8), freq=FALSE, breaks=(0:40)/20-1, xlim=c(-1,1), ylim=c(0,2.5), xlab="", ylab="", main="")
dev.off()
