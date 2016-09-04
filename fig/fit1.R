args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=5, height=2.5)
par(family="Palatino")
par(mgp=c(1.5,0.5,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(2,2,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
s = function(x) { 50 * dnorm(x, mean=10, sd=3) }
b = function(x) { 10 * exp(-x / 10) }
f = function(x) { s(x) + b(x) }
# curve(h, xlim=c(1,20), ylim=c(0,11), xlab="", ylab="", xaxt="n", frame.plot=FALSE)
curve(f, xlim=c(1,20), ylim=c(0,11), xlab="", ylab="")
curve(s, lty=2, add=TRUE)
curve(b, lty=2, add=TRUE)
# axis(1, c(1,5,10,15,20), c(1,5,10,15,20))
dev.off()
