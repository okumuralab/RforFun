args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"),
           width=13/4/25.4/0.664*15, height=13/4/25.4/0.664*15) # 15zw*15zw
par(family="Palatino")
par(mgp=c(2,0.8,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(2,2,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
p = c(0.01, 1, 1, 0.1)
x = c(1, 2, 3, 4)
y = c(0, 12, 9, 1)
z = y / p
r1 = lm(z ~ x)
plot(x, z, type="p", pch=16, xlim=c(0.5,4.5), ylim=c(0,15))
abline(r1)
r2 = lm(z ~ x, weights=p)
abline(r2, lty=2)
q = x * p
r3 = glm(y ~ q + p - 1, family=poisson(link="identity"))
abline(r3$coef['p'], r3$coef['q'], lty=3)
dev.off()
