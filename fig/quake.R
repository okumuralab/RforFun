args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=5, height=2)
par(family="Palatino")
par(mgp=c(2,0.5,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(2,1,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1

m = 120
a = 0.2
bpt = function(t) { (m/(2*pi*a^2*t^3))^(1/2)*exp(-(t-m)^2/(2*a^2*m*t)) }

plot(NULL, xlim=c(0,250), ylim=c(0,1.05*max(bpt(110:130))), axes=FALSE, xlab="", ylab="", yaxs="i")
axis(1, c(0,120,157,187))
x = seq(157,187,5)
y = bpt(x)
polygon(c(x,x[length(x)],x[1]), c(y,0,0), col=gray(0.6))
x = seq(187,250,7)
y = bpt(x)
polygon(c(x,x[length(x)],x[1]), c(y,0,0), col=gray(0.9))
curve(bpt(x), lwd=2, add=TRUE)
dev.off()
