args = commandArgs()
basename = sub(".R$", "", sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
if (length(basename) != 0)
    quartz(type="pdf", file=paste0(basename, ".pdf"),
           width=13/4/25.4/0.664*20, height=13/4/25.4/0.664*20) # 20zw*20zw
par(family="HiraMinProN-W3")
par(mgp=c(2,0.8,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(3,3,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
組織率 = c(50,40,50,50,90,70,60,30,1,10,60,10,40)
正答率合計 = c(237.9,238.8,270.2,270.1,276.3,259.2,256.6,231.4,259.0,220.7,242.9,251.6,209.4)
plot(組織率, 正答率合計, xlab="組織率（%）", ylab="正答率合計", pch=16)
dev.off()
