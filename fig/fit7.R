args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=7, height=3)
par(family="Palatino")
par(mgp=c(1.5,0.5,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(3,3,2,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
x = 1:20
y = c(11,4,13,10,4,8,6,16,7,12,10,13,6,5,1,4,2,0,0,1)
z = rep(x, y)
g = function(x) { exp(-x/10) / 8.221519 }
h = function(x) { dnorm(x,10,3) / 0.9990481 }
f = function(t) { sum(log(t * g(z) + (1-t) * h(z))) }
t = (45:70)/100
plot(t, sapply(t,f), type="l", xlab=expression(italic(t)), ylab=expression(log ~~ italic(L)))
abline(h=c(-372.8489,-372.8489-0.5))
dev.off()
