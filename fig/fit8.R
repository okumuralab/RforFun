args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=5, height=5)
par(family="Palatino")
par(mgp=c(1.5,0.5,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(3,3,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
x = 1:20
y = c(11,4,13,10,4,8,6,16,7,12,10,13,6,5,1,4,2,0,0,1)
z = rep(x, y)
g = function(x) { exp(-x/10) / 8.221519 }
h = function(x) { dnorm(x,10,3) / 0.9990481 }
f = function(arg) {
  n1 = arg[1];  n2 = arg[2]
  return(n1 + n2 - sum(log(n1 * g(z) + n2 * h(z))))
}
m = matrix(sapply(40:90, function(y){sapply(40:90, function(x){f(c(x,y))})}), nrow=51)
contour(40:90, 40:90, -m, levels=seq(144.5676,by=-0.5,length.out=10),
        asp=1, xlab=expression(italic(ν)[1]), ylab=expression(italic(ν)[2]))
points(75.9, 57.1, pch="x")
dev.off()
