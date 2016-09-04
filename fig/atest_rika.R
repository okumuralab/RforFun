args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=7, height=4)

par(family="Palatino")
par(mgp=c(2,0.8,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(2,3,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1

x = read.csv("../data/rika_hist.csv")
n = sum(x$生徒数)
barplot(x$生徒数/n, width=5/6, space=0.2, las=1, xlim=c(0,25), ylim=c(0,0.07))
m = sum(x[,1]*x[,2]) / sum(x[,2])
s = sqrt(sum((x[,1]-m)^2*x[,2]) / sum(x[,2]))
curve(dnorm(x, mean=m+0.5+1/12, sd=s), xlim=c(-0.5+7/12,25.5+7/12), add=T)
abline(v=m+7/12)
t = seq(0, 25, 5)
axis(1, at=t+7/12, labels=t)

dev.off()
