pkg = "survival"
if (!require(pkg, character.only=TRUE)) {
    install.packages(pkg)
    library(pkg, character.only=TRUE)
}

args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=4, height=4)
par(family="Palatino")
par(mgp=c(1.5,0.5,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(3,3,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1

f = function() {
    x = matrix(1, 59, 2)
    y = matrix(0, 59, 2)
    z = matrix(0:1, 59, 2, byrow=TRUE)
    for (i in 1:118) {
        if (runif(1) < 47/118) {
            x[i] = runif(1)
            y[i] = 1
        }
    }
    chi2 = survdiff(Surv(as.vector(x), as.vector(y)) ~ as.vector(z))$chisq
    p1 = pchisq(chi2, 1, lower.tail=FALSE)
    p2 = fisher.test(matrix(c(sum(y[,1]), 59-sum(y[,1]), sum(y[,2]), 59-sum(y[,2])),
                            nrow=2))$p.value
    c(p1, p2)
}
a = replicate(1000, f())
plot(a[1,], a[2,], xlab="log-rank test", ylab="Fisher test", asp=1)

dev.off()
