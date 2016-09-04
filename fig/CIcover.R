args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=7, height=3)
par(family="Palatino")
par(mgp=c(2,0.8,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(3,3,2,2)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
CI = sapply(0:10, function(x) binom.test(x,10)$conf.int)
f = function(t) {
  p = dbinom(0:10, 10, t)
  sum(p * (CI[1,] <= t & t <= CI[2,]))
}
x = seq(0, 1, 0.0001)
y = sapply(x, f)
plot(x, y, type="l", ylim=c(0.95,1), xlab="", ylab="", las=1)
dev.off()
