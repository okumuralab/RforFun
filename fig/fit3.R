args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=4, height=3)
par(family="Palatino")
par(mgp=c(1.5,0.5,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(2,2,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
y = c(11,4,13,10,4,8,6,16,7,12,10,13,6,5,1,4,2,0,0,1)
ci = sapply(1:20, function(i){poisson.test(y[i])$conf.int})
plot(1:20, y, type="p", pch=16, xlab="", ylab="", ylim=range(ci))
arrows(1:20, ci[1,], 1:20, ci[2,], length=0.03, angle=90, code=3)
s = function(x) { 50 * dnorm(x, mean=10, sd=3) }
b = function(x) { 10 * exp(-x / 10) }
f = function(x) { s(x) + b(x) }
curve(f, add=TRUE)
dev.off()
