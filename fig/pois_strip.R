args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=7, height=1.5)
par(family="HiraKakuProN-W3")
par(mgp=c(2,0.8,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(0.5,1,0,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
set.seed(2015)
stripchart(sample(1:50, 500, replace=TRUE),
           pch=16, method="stack", axes=FALSE, at=0)
dev.off()
