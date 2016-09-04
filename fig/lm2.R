args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"),
           width=13/4/25.4/0.664*15, height=13/4/25.4/0.664*15) # 15zw*15zw
par(family="Palatino")
par(mgp=c(2,0.8,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(2,2,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
x = c(1,2,3,4)
y = c(2,3,5,4)
ci = sapply(1:4, function(i){poisson.test(y[i])$conf.int})
r = glm(y ~ x, family=poisson(link="identity"))
plot(x, y, type="p", pch=16, xlim=c(0,5), ylim=range(c(0,ci)))
abline(r)
arrows(x, ci[1,], x, ci[2,], length=0.05, angle=90, code=3)
dev.off()
