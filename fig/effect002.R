quartz(type="pdf", file="effect002.pdf", width=7, height=3)
par(mgp=c(2,0.8,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(2,1,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
curve(dnorm(x), lwd=2, xlim=c(-3,3), ylim=c(0,0.41),
      xlab="", ylab="", frame.plot=FALSE, yaxt="n", yaxs="i")
curve(dnorm(x,mean=0.02), lwd=2, add=TRUE)
segments(0, 0, 0, dnorm(0))
segments(0.02, 0, 0.02, dnorm(0))
dev.off()
