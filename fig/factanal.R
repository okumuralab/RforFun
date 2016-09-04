args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=5, height=5)
par(family="HiraKakuProN-W3")
par(mgp=c(2,0.8,0)) # title and axis margins. default: c(3,1,0)
par(xpd=TRUE)
par(mar=c(3,3,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
atest = read.csv("../data/atest2015.csv", fileEncoding="CP932")
chu = atest[ ,7:11]
row.names(chu) = atest[ ,1]
f = factanal(chu, factors=2)
plot(NULL, xlim=c(0,1), ylim=c(0,1), xlab="因子1", ylab="因子2")
text(f$loadings, names(chu))
points(0, 0, pch=4)
dev.off()
