args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"),
           width=13/4/25.4/0.664*15, height=13/4/25.4/0.664*15) # 15zw*15zw
par(family="Palatino")
par(mgp=c(2,0.8,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(2,2,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
set.seed(1)
a = rnorm(100);  b = rnorm(100);  c = rnorm(100)
x = (a + c) / sqrt(2)
y = (b + c) / sqrt(2)
plot(x, y, pch=16, xlim=c(-3,3), ylim=c(-3,3), asp=1, xlab="", ylab="")
abline(lm(y ~ x))
abline(0, 1, lty=2)
dev.off()
