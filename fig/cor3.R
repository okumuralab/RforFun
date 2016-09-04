args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=4, height=4)
par(family="Palatino")
par(mgp=c(1.5,0.5,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(3,3,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
f = function() {
    k = runif(1)
    a = runif(10)
    b = runif(10)
    x = k * a + (1-k) * b
    y = k * a - (1-k) * b
    c(cor(x,y,method="kendall"), cor(x,y,method="spearman"))
}
r = replicate(1000, f())
plot(r[1,], r[2,], xlim=c(-1,1), ylim=c(-1,1),
     xlab="Kendall’s tau", ylab="Spearman’s rho", asp=1)
abline(0, 1)
dev.off()
