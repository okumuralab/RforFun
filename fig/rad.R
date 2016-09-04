args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=7, height=7)
par(family="Palatino")
par(mgp=c(1.5,0.5,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(3,3,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
options(stringsAsFactors=FALSE)
rad = read.csv("../data/rad.csv")
mp = names(rad)[-1]
f = function(m) {
    x = rad[,m]
    n = length(x)
    x1 = x[1:(n-1)]
    x2 = x[2:n]
    c(mean(x, na.rm=TRUE), 1 / mean((x1-x2)^2/(x1+x2), na.rm=TRUE) / 10)
}
s = sapply(mp, f)
plot(s[1,], s[2,], log="xy", xlab="μSv/h", ylab="cpm/(μSv/h)")
dev.off()
