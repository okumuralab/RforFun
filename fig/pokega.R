args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=7, height=2)
par(family="Palatino")
par(mgp=c(2,0.8,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(2,2,2,2)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
plot(c(0,1200), c(0,3), type="n", axes=FALSE, xlab="", ylab="")
axis(1)
x1 = c(55,81.5,178.1,194.4,214.3,254.3,517.8,548.7,
       553.6,556.6,700.1,730.7,735.6,881.9,883.3,962.2,1164.2)
x2 = c(43.9,54.8,85,94.3,115.2,224.5,228.5,246.1,310.2,
       314.4,333,336,338.8,343.7,364.3,377.6,474.8,499.5,
       610,615.8,631.6,662.7,694.5,740.9,746.5,748.1,781.4,
       788.1,812.9,815.7,831.7,834.1,883.5,923,986.4,1082.3,1105.5,1112.2)
segments(x1, 0.5, x1, 1.5)
segments(x2, 2, x2, 3)
dev.off()
