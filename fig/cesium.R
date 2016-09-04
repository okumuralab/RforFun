args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"), width=7, height=4)
par(family="Palatino")
sp = scan("http://oku.edu.mie-u.ac.jp/~okumura/stat/data/120704151211.TXT",
          skip=38, nlines=1024, comment.char=";")
sp = floor(sp * 601 + 0.5)
ci = sapply(200:500, function(i){poisson.test(sp[i])$conf.int})
par(mgp=c(1.5,0.5,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(4,3,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
plot(200:500, sp[200:500], type="p", pch=16, xlab="Channel", ylab="Count",
     xlim=c(200,500), ylim=c(0,125))
arrows(200:500, ci[1,], 200:500, ci[2,], length=0.03, angle=90, code=3)
dev.off()
