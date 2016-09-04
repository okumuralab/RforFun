args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=7, height=3)
par(family="Palatino")
par(mgp=c(1.5,0.5,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(3.5,3.5,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
logL = function(t) { 4*log(t) + 6*log(1-t) }
curve(logL(x) - logL(0.4), xlim=c(0,1), ylim=c(-8,0),
      xlab=expression(italic(θ)),
      ylab=expression(log * italic(L) (italic(θ)) - log * italic(L) (0.4)))
abline(h=c(0,-0.5,-1.96^2/2), lty=2)
abline(v=c(0.4,0.2553,0.5577,0.1456,0.7), lty=2)
dev.off()
