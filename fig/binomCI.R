quartz(type="pdf", file="binomCI.pdf", width=7, height=4)
par(family="HiraKakuProN-W3")
par(mgp=c(2,0.8,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(3,3,2,2)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
curve(qbinom(0.025,10,x)/10, xlim=c(0,1), n=1001, asp=1, las=1)
curve(qbinom(0.975,10,x)/10, n=1001, add=TRUE)
dev.off()
