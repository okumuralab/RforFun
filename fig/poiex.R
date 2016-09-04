args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=7, height=3)
par(family="Palatino")
par(mgp=c(1.5,0.5,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(1,3,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
plot(0:143, rpois(144, 10*sin((0:143)/144*2*pi)+100), type="o", pch=16, ylim=c(0,140),
     xaxt="n", xlab="", ylab="", las=1)
curve(10*sin(x/144*2*pi)+100, add=TRUE)
dev.off()
