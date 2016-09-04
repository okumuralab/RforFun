args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=3, height=3)

pkg = "lawstat"
if (!require(pkg, character.only=TRUE)) {
    install.packages(pkg)
    library(pkg, character.only=TRUE)
}

par(family="Palatino")
par(mgp=c(2,0.8,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(3,3,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
f = function() {
  a = sample(20)
  b = sample(5:10, 1)
  x = a[1:b]
  y = a[(b+1):20]
  c(t.test(x, y)$p.value,
    brunner.munzel.test(x, y)$p.value)
}
r = replicate(1000, f())
plot(r[1,], r[2,], asp=1,
     xlab=expression(italic(t) ~~ test), ylab="Brunner-Munzel test")
abline(0, 1)
dev.off()
