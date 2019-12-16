library(karyoploteR)

dd <- toGRanges("1MB_Z_Li_Ra.txt")
dd$inv <- -1*dd$V4 


kp <- plotKaryotype(chromosomes = c(paste0("chr", c(1:2, "X"))))

kpLines(kp, dd, y=dd$inv, ymin=-5, ymax=5)
kpAbline(kp, h=0, ymin=-5, ymax=5)

karyoplot <- kp
data <- dd
y <- dd$inv
chr=NULL
x=NULL
y=NULL
num.parts=3
breaks=NULL
ymin=NULL
ymax=NULL
data.panel=1
r0=0
r1=1
col="redblue6"
border=NA
clipping=TRUE


for(i in 1:length(c(breaks$neg, 0, breaks$pos))) {
  thr <- c(breaks$neg, 0, breaks$pos)[i]
  isecs <- findIntersections(data, thr$neg[1])
  message(i, ":  ", paste0(end(isecs), collapse = ", "))
}

findIntersections(data, 0)


kp <- plotKaryotype()
kp2 <- kpPlotHorizon(kp, dd, y=dd$inv)


kp$genome
dd

kp2$latest.plot$computed.values$colors
