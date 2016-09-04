args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=7, height=1.8)
par(family="Palatino")
par(mgp=c(2,0.8,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(2,2,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
par(mfrow = c(1,4))
set.seed(1)
for (i in 1:4) {
    x = rnorm(40)
    y = rnorm(40)
    plot(x, y, pch=16, main=round(cor(x,y),3), xlim=c(-3,3), ylim=c(-3,3), asp=1)
}
dev.off()
