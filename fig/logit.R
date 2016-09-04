args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"),
           width=13/4/25.4/0.664*20, height=13/4/25.4/0.664*14) # 20zw*14zw
par(family="Palatino")
par(mar=c(2.5,2.5,0.5,0.5)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
par(mgp=c(1.3,0.5,0)) # title and axis margins. default: c(3,1,0)
curve(exp(x)/(1+exp(x)), xlim=c(-5,5), ylim=c(0,1), yaxs="i", yaxt="n",
      xlab=expression(italic(x)), ylab=expression(italic(p) == logit^{-1} * italic(x)))
t = c(0,0.5,1);  axis(2, at=t, labels=t)
dev.off()
