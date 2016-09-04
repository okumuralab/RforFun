args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"),
           width=13/4/25.4/0.664*15, height=13/4/25.4/0.664*10) # 15zw*10zw
par(family="Palatino")
par(mgp=c(2,0.8,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(1,1,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
x = c(1,3,5,8,5,4,2)          # データ
plot(1:7, x, pch=16, xlab="", ylab="", axes=FALSE, xlim=c(0.5,7.5), ylim=c(0.5,8.5))
text((1:7)+0.3, x, x)
lines(c(1,2), c(2,2))
lines(c(3,5), c(6,6))
lines(c(6,7), c(3,3))
dev.off()
