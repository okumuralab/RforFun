args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=6, height=1.5)
# par(family="Times")
par(family="Palatino")
par(mar=c(2.5,2.5,0.5,0.5)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
par(mgp=c(1.3,0.5,0)) # title and axis margins. default: c(3,1,0)
set.seed(1)
x = matrix(round(rnorm(1000,mean=50,sd=10)), ncol=10)
invlogit = function(x){exp(x)/(1+exp(x))}
y = sapply(1:100, function(i){rbinom(1, 1, invlogit((x[i,]-50) %*% (1:10)/100))})
r3 = glm(y ~ x[,4] + x[,5] + x[,6] + x[,7] + x[,8] + x[,9] + x[,10],
        family=binomial(link="logit"))
plot(fitted(r3), y, ylim=c(-0.2,1.2), yaxt="n")
t = c(0,1);  axis(2, t, t)
dev.off()
