quartz(type="pdf", file="dbinom_normal.pdf", width=7, height=4)
par(family="HiraKakuProN-W3")
par(mgp=c(2,0.8,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(3,3,2,2)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
barplot(dbinom(0:10,10,0.5), names.arg=0:10, space=0, ylim=c(0,0.26), las=1)
curve(dnorm(x, 5.5, sqrt(2.5)), lwd=2, add=TRUE)
dev.off()
