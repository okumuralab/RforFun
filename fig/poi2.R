args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=3, height=3)
par(family="Palatino")
par(mgp=c(1.5,0.5,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(2,2,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
f = function() {
    x=rpois(144, 10*sin(2*pi*(0:143)/144)+100)
    x1=x[1:143]
    x2=x[2:144]
    c(var(x)/mean(x), mean((x1-x2)^2/(x1+x2)))
}
r = replicate(10000, f())
h1 = hist(r[1,], breaks=seq(0,3,0.05), plot=FALSE)
h2 = hist(r[2,], breaks=seq(0,3,0.05), plot=FALSE)
plot(h2$mids, h2$counts, type="o", pch=16, xlim=c(0.6,2), xlab="", ylab="")
points(h1$mids, h1$counts, type="o", lty=2)
dev.off()
