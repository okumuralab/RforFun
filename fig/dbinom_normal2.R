quartz(type="pdf", file="dbinom_normal2.pdf", width=7, height=4)
par(family="HiraKakuProN-W3")
par(mgp=c(2,0.8,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(3,3,2,2)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
# barplot(dbinom(30:70,100,0.5), space=0, ylim=c(0,0.08), las=1,
#         names.arg=c(30,rep("",9),40,rep("",9),50,rep("",9),60,rep("",9),70))
# curve(dnorm(x, 20.5, sqrt(25)), lwd=2, add=TRUE)
barplot(dbinom(20:60,100,0.4), space=0, ylim=c(0,0.09), las=1,
        names.arg=c(20,rep("",9),30,rep("",9),40,rep("",9),50,rep("",9),60))
curve(dnorm(x, 20.5, sqrt(100*0.6*0.4)), lwd=2, add=TRUE)
dev.off()
