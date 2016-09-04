args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=7, height=3)
par(family="Palatino")
par(mgp=c(1.5,0.5,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(3,3,2,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
x = 1:20
y = c(11,4,13,10,4,8,6,16,7,12,10,13,6,5,1,4,2,0,0,1)
d = dnorm(x, 10, 3)
e = exp(-x/10)
logL = function(a) {
  optimize(function(b){sum(y*log(a*d+b*e)-(a*d+b*e))}, c(0,100), maximum=TRUE)$objective
}
plot(30:90, sapply(30:90,logL), type="l", xlab=expression(italic(a)), ylab=expression(log ~~ italic(L)))
dev.off()
