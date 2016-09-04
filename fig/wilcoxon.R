args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=3, height=3)
par(family="Palatino")
par(mgp=c(1.5,0.5,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(3,3,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
f = function() {
  a = sample(40)  # a = qnorm((sample(40) - 0.5) / 40)
  x = a[1:20]
  y = a[21:40]
  c(t.test(x, y, var.equal=TRUE)$p.value, wilcox.test(x, y)$p.value)
}
r = replicate(1000, f())
plot(r[1,], r[2,], asp=1,
     xlab=expression(italic(t) ~~ test), ylab="Wilcoxon test")
abline(0, 1)
dev.off()
