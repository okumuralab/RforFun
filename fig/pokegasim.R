args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=7, height=2)
par(family="Palatino")
par(mgp=c(2,0.8,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(2,2,2,2)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
plot(c(0,1200), c(0,3), type="n", axes=FALSE, xlab="", ylab="")
axis(1)
r1 = runif(17) * 1200
r2 = runif(38) * 1200
segments(r1, 0.5, r1, 1.5)
segments(r2, 2, r2, 3)
dev.off()
