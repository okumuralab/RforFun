pkg = "metafor"
if (!require(pkg, character.only=TRUE)) {
    install.packages(pkg)
    library(pkg, character.only=TRUE)
}

quartz(type="pdf", file="metafor.pdf", width=7, height=4)
data(dat.bcg)
dat = escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)
res = rma(yi, vi, data=dat)
par(mgp=c(2,0.5,0)) # title and axis margins. default: c(3,1,0)
par(mar=c(3,1,1,1)+0.1) # bottom, left, top, right margins. default: c(5,4,4,2)+0.1
par(family="HiraKakuProN-W3")
forest(res, slab=paste(dat$author,dat$year,sep=", "),
       xlim=c(-16,6), at=log(c(0.05,0.25,1,4)), atransf=exp,
       ilab=cbind(dat$tpos,dat$tneg,dat$cpos,dat$cneg),
       ilab.xpos=c(-9.5,-8,-6,-4.5)+0.7, ilab.pos=c(2,2,2,2),
       cex=0.75)
par(cex=0.75, font=2)
text(c(-9.5,-8,-6,-4.5), 15, c("TB+","TB-","TB+","TB-"))
text(c(-8.75,-5.25), 16, c("Vaccinated","Control"))
text(-16, 15, "Author(s) and Year", pos=4)
text(6, 15, "Relative Risk [95% CI]", pos=2)
dev.off()
