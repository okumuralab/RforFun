pkg = "survival"
if (!require(pkg, character.only=TRUE)) {
    install.packages(pkg)
    library(pkg, character.only=TRUE)
}

options(stringsAsFactors=FALSE)
whas100 = read.csv("../data/whas100.csv")

args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=7, height=4)
par(family="Palatino")
par(mgp=c(2,0.5,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(2,2,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
s = survfit(Surv(lenfol, fstat) ~ gender, data=whas100)
plot(s)
dev.off()
